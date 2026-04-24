package org.example.museumpc.controller;

import org.example.museumpc.entity.AlarmRecord;
import org.example.museumpc.service.AlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/alarms")
@CrossOrigin(origins = "*")
public class AlarmController {

    // 🌟 注入 Service 替代 JdbcTemplate
    @Autowired
    private AlarmService alarmService;

    @GetMapping("/recent")
    public List<AlarmRecord> getRecentAlarms(@RequestParam(defaultValue = "10") int limit) {
        // 直接当甩手掌柜，向 Service 要数据
        return alarmService.getRecentAlarms(limit);
    }

    @PutMapping("/{id}/confirm")
    public Map<String, Object> confirmAlarm(@PathVariable Long id, @RequestParam String handler) {
        boolean success = alarmService.confirmAlarm(id, handler);

        Map<String, Object> res = new HashMap<>();
        res.put("success", success);
        return res;
    }

    @PutMapping("/{id}/handle")
    public Map<String, Object> handleAlarm(@PathVariable Long id, @RequestParam String handler) {
        boolean success = alarmService.handleAlarm(id, handler);

        Map<String, Object> res = new HashMap<>();
        res.put("success", success);
        return res;
    }
}