package org.example.museumpc.service;

import com.alibaba.fastjson.JSON;
import org.example.museumpc.entity.MuseumDevice;
import org.example.museumpc.mqtt.MqttSendClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DeviceService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private MqttSendClient mqttSendClient;

    // ===================================================
    // 1. 硬件指令下发 (MQTT + 数据库状态同步)
    // ===================================================

    public String controlDevice(String deviceId, Map<String, Object> params) {
        String topic = "museum/" + deviceId + "/actuators";
        String payload = JSON.toJSONString(params);
        mqttSendClient.publish(topic, payload);
        return payload;
    }

    public Map<String, Object> executeQuickCmd(String deviceId, String key, int val) {
        String columnName = key + "_status";
        String sql = "UPDATE museum_device SET " + columnName + " = ? WHERE device_id = ?";
        jdbcTemplate.update(sql, val, deviceId);

        Map<String, Object> mqttPayload = new HashMap<>();
        // 为了兼容前端传递的逻辑，这里依然使用原来的 action 组装方式
        mqttPayload.put(key, val);
        return JSON.parseObject(controlDevice(deviceId, mqttPayload));
    }

    // ===================================================
    // 2. 布防状态管理 (只操作数据库，不发 MQTT)
    // ===================================================

    public void updateArmStatus(String deviceId, int armStatus) {
        jdbcTemplate.update("UPDATE museum_device SET arm_status = ? WHERE device_id = ?", armStatus, deviceId);
    }

    public boolean getArmStatus(String deviceId) {
        String sql = "SELECT arm_status FROM museum_device WHERE device_id = ?";
        Integer status = jdbcTemplate.queryForObject(sql, Integer.class, deviceId);
        return status != null && status == 1;
    }

    // ===================================================
    // 3. 设备台账 CRUD (包含 region 等完整字段)
    // ===================================================

    public List<MuseumDevice> getAllDevices() {
        // 严格遵循你原来 Controller 里的精准查询字段映射
        String sql = "SELECT device_id as deviceId, name, location, region, status, " +
                "arm_status as armStatus, last_active as lastActive, " +
                "led_status as ledStatus, light_status as lightStatus, " +
                "buzzer_status as buzzerStatus, motor_status as motorStatus " +
                "FROM museum_device ORDER BY id DESC";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MuseumDevice.class));
    }

    public boolean addDevice(MuseumDevice device) {
        String sql = "INSERT INTO museum_device (device_id, name, location, region, status, arm_status, create_time) VALUES (?, ?, ?, ?, 1, 0, NOW())";
        int rows = jdbcTemplate.update(sql, device.getDeviceId(), device.getName(), device.getLocation(), device.getRegion());
        return rows > 0;
    }

    public boolean updateDevice(String deviceId, MuseumDevice device) {
        String sql = "UPDATE museum_device SET name = ?, location = ?, region = ? WHERE device_id = ?";
        int rows = jdbcTemplate.update(sql, device.getName(), device.getLocation(), device.getRegion(), deviceId);
        return rows > 0;
    }

    public boolean deleteDevice(String deviceId) {
        String sql = "DELETE FROM museum_device WHERE device_id = ?";
        int rows = jdbcTemplate.update(sql, deviceId);
        return rows > 0;
    }
}