package org.example.museumpc.controller;

import org.example.museumpc.entity.SensorData;
import org.example.museumpc.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class StatisticsController {

    // 🌟 唯一依赖：交给刚刚新建的 StatisticsService
    @Autowired
    private StatisticsService statisticsService;

    @GetMapping("/sensors/latest")
    public List<SensorData> getLatestSensors() {
        return statisticsService.getLatestSensors();
    }

    @GetMapping("/statistics/sensors/trend")
    public Map<String, Object> getTrend(@RequestParam("deviceId") String deviceId,
                                        @RequestParam("field") String field,
                                        @RequestParam(value = "hours", defaultValue = "24") int hours) {
        return statisticsService.getTrend(deviceId, field, hours);
    }

    @GetMapping("/statistics/sensors/extremes")
    public Map<String, Object> getExtremes(@RequestParam("deviceId") String deviceId) {
        return statisticsService.getExtremes(deviceId);
    }

    @GetMapping("/statistics/alarms")
    public Map<String, Object> getAlarmStats() {
        return statisticsService.getAlarmStats();
    }
}