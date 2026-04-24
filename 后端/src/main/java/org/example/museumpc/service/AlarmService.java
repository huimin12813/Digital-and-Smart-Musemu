package org.example.museumpc.service;

import com.alibaba.fastjson.JSON;
import org.example.museumpc.config.AlarmWebSocketHandler;
import org.example.museumpc.entity.AlarmRecord;
import org.example.museumpc.mqtt.MqttSendClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AlarmService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private MqttSendClient mqttSendClient;

    // =======================================================
    // 🌟 新增：从 Controller 转移过来的查询与更新逻辑
    // =======================================================

    /**
     * 获取最近的告警记录
     */
    public List<AlarmRecord> getRecentAlarms(int limit) {
        String sql = "SELECT id, device_id as deviceId, level, content, create_time as createTime, confirmed, handled, handler " +
                "FROM alarm_record ORDER BY id DESC LIMIT ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AlarmRecord.class), limit);
    }

    /**
     * 确认告警
     */
    public boolean confirmAlarm(Long id, String handler) {
        String sql = "UPDATE alarm_record SET confirmed = 1, handler = ? WHERE id = ?";
        int rows = jdbcTemplate.update(sql, handler, id);
        return rows > 0;
    }

    /**
     * 处理告警
     */
    public boolean handleAlarm(Long id, String handler) {
        String sql = "UPDATE alarm_record SET handled = 1, handle_time = NOW(), handler = ? WHERE id = ?";
        int rows = jdbcTemplate.update(sql, handler, id);
        return rows > 0;
    }


    // =======================================================
    // 原始保留：创建告警与多端联动逻辑
    // =======================================================
    public void createAlarm(AlarmRecord record, String actionParams) {
        // 1. 插入告警记录
        String sql = "INSERT INTO alarm_record (device_id, level, content, confirmed, handled, create_time) VALUES (?, ?, ?, ?, ?, NOW())";
        jdbcTemplate.update(sql,
                record.getDeviceId(),
                record.getLevel(),
                record.getContent(),
                0, // confirmed 默认 0
                0  // handled 默认 0
        );

        // 2. 联动硬件 (例如：控制灯光或蜂鸣器)
        if (actionParams != null && !actionParams.isEmpty()) {
            mqttSendClient.publish("museum/" + record.getDeviceId() + "/actuators", actionParams);
        }

        // 3. 实时推送 (WebSocket)
        try {
            Map<String, Object> wsMsg = new HashMap<>();
            wsMsg.put("type", "new_alarm");
            wsMsg.put("level", record.getLevel());
            wsMsg.put("content", record.getContent());
            wsMsg.put("deviceId", record.getDeviceId());
            AlarmWebSocketHandler.sendAlarm(JSON.toJSONString(wsMsg));
        } catch (Exception e) {
            System.err.println("🚨 [系统异常] WebSocket 告警推送失败！");
        }

        // 4. 🌟 终极联动：如果是 critical 级别，自动生成紧急安防工单
        if ("critical".equals(record.getLevel())) {
            try {
                String workOrderSql = "INSERT INTO work_order (title, assignee, status, create_time) VALUES (?, ?, ?, NOW())";
                String orderTitle = "紧急安防出警：" + record.getContent();
                String assignee = "安保行动组"; // 自动指派的默认负责人
                String status = "待处理";      // 对应前端的待处理状态

                jdbcTemplate.update(workOrderSql, orderTitle, assignee, status);
            } catch (Exception e) {
                System.err.println("🚨 [系统异常] 自动工单生成失败！");
            }
        }
    }
}