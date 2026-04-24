package org.example.museumpc.service;

import org.example.museumpc.entity.AlarmRecord;
import org.example.museumpc.entity.MuseumDevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.util.List;

@Component
public class DeviceStatusTask {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private AlarmService alarmService;

    @Scheduled(fixedRate = 30000)
    public void checkOfflineDevices() {
        String findSql = "SELECT device_id as deviceId, name FROM museum_device WHERE status = 1 AND (last_active < DATE_SUB(NOW(), INTERVAL 90 SECOND) OR last_active IS NULL)";
        List<MuseumDevice> offlineDevices = jdbcTemplate.query(findSql, new BeanPropertyRowMapper<>(MuseumDevice.class));

        for (MuseumDevice dev : offlineDevices) {
            // 1. 更新数据库状态
            jdbcTemplate.update("UPDATE museum_device SET status = 0 WHERE device_id = ?", dev.getDeviceId());

            // 2. 构建告警实体类并触发告警
            AlarmRecord record = new AlarmRecord();
            record.setDeviceId(dev.getDeviceId());
            record.setLevel("critical");
            record.setContent("设备 [" + dev.getName() + "] 连接断开，判定为离线。");

            alarmService.createAlarm(record, null);
        }
    }
}