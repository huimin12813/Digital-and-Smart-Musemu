package org.example.museumpc.controller;

import org.example.museumpc.entity.Result;
import org.example.museumpc.mqtt.MqttSendClient;
import org.example.museumpc.mqtt.MqttProperties; // 导入配置类
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api/hardware")
public class MqttController {

    private static final Logger logger = LoggerFactory.getLogger(MqttController.class);

    @Autowired
    private MqttSendClient mqttSendClient;

    @Autowired
    private MqttProperties mqttProperties; // 注入配置类

    public static String LATEST_HARDWARE_STATUS = "暂无数据";

    /**
     * 控制指令接口
     * 调用方式: POST http://localhost:8080/api/hardware/command
     * JSON参数: {"deviceId": "1", "led": 1}
     */
    @PostMapping("/command")
    public Result sendCommand(@RequestBody Map<String, Object> params) {
        String deviceId = params.getOrDefault("deviceId", "1").toString();
        Object ledStatus = params.get("led");

        if (ledStatus == null) {
            return Result.error("参数错误：请传入 led (1 或 0)");
        }

        String command = "{\"led\":" + ledStatus.toString() + "}";

        // 【修改点】：直接使用 yml 中配置的 send-topic，并替换里面的 deviceId
        // 这样如果以后主题变了，你只需要改 yml，不用改 Java 代码
        String targetTopic = mqttProperties.getSendTopic().replace("{deviceId}", deviceId);

        try {
            mqttSendClient.publish(targetTopic, command);
            logger.info(">>> [硬件联动] 发送至主题: {}, 内容: {}", targetTopic, command);
            return Result.success("指令下发成功");
        } catch (Exception e) {
            logger.error("MQTT 发送失败", e);
            return Result.error("硬件通信故障: " + e.getMessage());
        }
    }

    @GetMapping("/status")
    public Result getStatus() {
        return Result.success("获取成功", LATEST_HARDWARE_STATUS);
    }
}