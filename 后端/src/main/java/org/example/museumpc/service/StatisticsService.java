package org.example.museumpc.service;

import org.example.museumpc.entity.SensorData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class StatisticsService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<SensorData> getLatestSensors() {
        String sql = "SELECT s.device_id as deviceId, s.temperature, s.humidity, s.smoke, s.light, s.pir, s.create_time as createTime " +
                "FROM sensor_data s INNER JOIN (SELECT device_id, MAX(id) as max_id FROM sensor_data GROUP BY device_id) last_data ON s.id = last_data.max_id";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(SensorData.class));
    }

    public Map<String, Object> getTrend(String deviceId, String field, int hours) {
        // 🌟 最优解 1：防止 SQL 注入的白名单机制
        List<String> allowedFields = Arrays.asList("temperature", "humidity", "light", "smoke", "pir");
        if (!allowedFields.contains(field)) { field = "temperature"; }

        // 🌟 最优解 2：按完整的年月日小时分组排序
        String sql = "SELECT DATE_FORMAT(create_time, '%H:00') as label, AVG(" + field + ") as value FROM sensor_data " +
                "WHERE device_id = ? AND create_time >= DATE_SUB(NOW(), INTERVAL ? HOUR) " +
                "GROUP BY DATE_FORMAT(create_time, '%Y-%m-%d %H:00'), label " +
                "ORDER BY DATE_FORMAT(create_time, '%Y-%m-%d %H:00') ASC";

        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, deviceId, hours);

        List<String> labels = new ArrayList<>();
        List<Object> values = new ArrayList<>();
        for (Map<String, Object> m : list) {
            labels.add(m.get("label").toString());
            values.add(m.get("value"));
        }

        Map<String, Object> res = new HashMap<>();
        res.put("labels", labels);
        res.put("values", values);
        return res;
    }

    public Map<String, Object> getExtremes(String deviceId) {
        String sql = "SELECT MAX(temperature) as maxTemp, MIN(temperature) as minTemp, " +
                "MAX(humidity) as maxHumid, MIN(humidity) as minHumid FROM sensor_data " +
                "WHERE device_id = ? AND TO_DAYS(create_time) = TO_DAYS(NOW())";
        try {
            return jdbcTemplate.queryForMap(sql, deviceId);
        } catch (Exception e) { return new HashMap<>(); }
    }

    public Map<String, Object> getAlarmStats() {
        String sql = "SELECT (SELECT COUNT(*) FROM alarm_record WHERE TO_DAYS(create_time) = TO_DAYS(NOW())) as today, " +
                "(SELECT COUNT(*) FROM alarm_record WHERE YEARWEEK(create_time) = YEARWEEK(NOW())) as week, " +
                "(SELECT COUNT(*) FROM alarm_record WHERE MONTH(create_time) = MONTH(NOW())) as month";
        try {
            return jdbcTemplate.queryForMap(sql);
        } catch (Exception e) { return new HashMap<>(); }
    }
}