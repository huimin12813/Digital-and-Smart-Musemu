package org.example.museumpc.mqtt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.example.museumpc.service.RuleEngineService; // 【确保导入这个类】
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class MqttAcceptCallback implements MqttCallback {

    private static final Logger logger = LoggerFactory.getLogger(MqttAcceptCallback.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 【新增 1】：注入规则引擎服务
    @Autowired
    private RuleEngineService ruleEngineService;

    @Override
    public void connectionLost(Throwable cause) {
        logger.error("MQTT 连接已断开，请检查网络...");
    }

    @Override
    public void messageArrived(String topic, MqttMessage message) throws Exception {
        String payload = new String(message.getPayload(), "UTF-8");

        // 【调试核心】：这一行能让你在控制台看清楚到底是谁在发数据，发的是什么！
        logger.info(">>> [MQTT 原始消息] 主题: {}, 内容: {}", topic, payload);

        if (topic.startsWith("museum/") && topic.endsWith("/sensors")) {
            String deviceId = topic.split("/")[1];
            try {
                JSONObject json = JSON.parseObject(payload);

                // ==========================================================
                // 【核心修复】：增加数据有效性校验
                // 只有当 JSON 包含 temperature 或 smoke 字段且不为 null 时才执行后续逻辑
                // ==========================================================
                if (json.get("temperature") == null &&
                        json.get("smoke") == null &&
                        json.get("light") == null &&
                        json.get("humidity") == null &&
                        json.get("pir") == null) {

                    logger.warn(">>> [过滤] 收到来自设备 {} 的无效空数据包，已跳过入库。", deviceId);
                    return;
                }

                // 1. 存入传感器历史数据表
                String sql = "INSERT INTO sensor_data (device_id, smoke, temperature, humidity, light, pir) VALUES (?, ?, ?, ?, ?, ?)";
                jdbcTemplate.update(sql,
                        deviceId,
                        json.getInteger("smoke"),
                        json.getBigDecimal("temperature"),
                        json.getBigDecimal("humidity"),
                        json.getInteger("light"),
                        json.getInteger("pir")
                );

                // 2. 更新活跃状态
                jdbcTemplate.update("UPDATE museum_device SET status = 1, last_active = NOW() WHERE device_id = ?", deviceId);

                logger.info(">>> [数据中心] 设备 [{}] 数据入库成功", deviceId);

                // 3. 触发规则引擎
                Map<String, Object> dataMap = json.getInnerMap();
                ruleEngineService.process(deviceId, dataMap);

            } catch (Exception e) {
                logger.error(">>> [错误] 消息处理异常: {}", e.getMessage());
            }
        }
        // 2. 【核心新增】：处理心跳包 (museum/{id}/heartbeat)
        else if (topic.startsWith("museum/") && topic.endsWith("/heartbeat")) {
            String deviceId = topic.split("/")[1];
            try {
                // 更新活跃时间戳并确保状态为在线 (1)
                String sql = "UPDATE museum_device SET last_active = NOW(), status = 1 WHERE device_id = ?";
                int rows = jdbcTemplate.update(sql, deviceId);

                if (rows > 0) {
                    logger.info(">>> [心跳成功] 设备 [{}] 已在线", deviceId);
                } else {
                    logger.warn(">>> [未注册设备] 收到来自 {} 的心跳，但数据库无此设备", deviceId);
                }
            } catch (Exception e) {
                logger.error("心跳处理失败: {}", e.getMessage());
            }
        }
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken token) {}
}