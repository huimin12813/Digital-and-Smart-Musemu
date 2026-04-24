package org.example.museumpc.service;

import ai.djl.inference.Predictor;
import ai.djl.modality.cv.Image;
import ai.djl.modality.cv.ImageFactory;
import ai.djl.repository.zoo.Criteria;
import ai.djl.repository.zoo.ZooModel;
import org.example.museumpc.entity.AlarmRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.*;

@Service
public class FireDetectionService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private ZooModel<Image, List<Map<String, Object>>> fireModel;

    public Map<String, Object> detectFire(MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        if (fireModel == null) {
            response.put("status", "error");
            return response;
        }

        try (InputStream is = file.getInputStream()) {
            Image img = ImageFactory.getInstance().fromInputStream(is);

            try (Predictor<Image, List<Map<String, Object>>> predictor = fireModel.newPredictor()) {
                List<Map<String, Object>> detections = predictor.predict(img);

                boolean hasFire = false;
                boolean hasSmoke = false;
                for (Map<String, Object> box : detections) {
                    int classId = (int) box.get("class");
                    if (classId == 0) hasFire = true;
                    if (classId == 1) hasSmoke = true;
                }

                String status = "normal";
                if (hasFire && hasSmoke) status = "fire_and_smoke";
                else if (hasFire) status = "fire";
                else if (hasSmoke) status = "smoke";

                if (!"normal".equals(status)) {
                    // 只有触发告警才写入数据库
                    triggerEmergencyAlarm(status);
                }

                response.put("status", status);
                response.put("detections", detections);
                return response;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            return response;
        }
    }

    // 在 FireDetectionService.java 里注入 AlarmService
    @Autowired
    private AlarmService alarmService;

    /**
     * AI 触发告警的方法
     */
    private void triggerEmergencyAlarm(String alertType) {
        AlarmRecord record = new AlarmRecord();
        record.setDeviceId("AI_CAM_01"); // 摄像头设备ID

        if ("fire_and_smoke".equals(alertType)) {
            record.setLevel("critical");
            record.setContent("🚨 [最高紧急] 监控区域同时发现明火与浓烟，请立即疏散并处理！");
        } else if ("fire".equals(alertType)) {
            record.setLevel("critical");
            record.setContent("🔥 [火灾告警] 监控区域发现疑似明火！");
        } else if ("smoke".equals(alertType)) {
            record.setLevel("warning");
            record.setContent("💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！");
        }

        // 直接调用你的 AlarmService，它会自动处理落库、发WebSocket、派发工单！
        alarmService.createAlarm(record, null);
    }
}