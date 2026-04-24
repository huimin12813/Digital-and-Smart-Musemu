package org.example.museumpc.service;

import ai.djl.inference.Predictor;
import ai.djl.modality.cv.Image;
import ai.djl.modality.cv.ImageFactory;
import ai.djl.repository.zoo.Criteria;
import ai.djl.repository.zoo.ZooModel;
import org.example.museumpc.entity.AlarmRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Service
public class AbnormalBehaviorService {

    @Autowired
    private AlarmService alarmService;

    @Autowired
    private ZooModel<Image, Map<String, Object>> abnormalBehaviorModel;

    public Map<String, Object> detectBehavior(MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        if (abnormalBehaviorModel == null) {
            response.put("status", "error");
            return response;
        }

        try (InputStream is = file.getInputStream()) {
            Image img = ImageFactory.getInstance().fromInputStream(is);

            try (Predictor<Image, Map<String, Object>> predictor = abnormalBehaviorModel.newPredictor()) {
                Map<String, Object> result = predictor.predict(img);

                String className = (String) result.get("className");
                boolean detected = (boolean) result.get("detected");

                if (detected) {
                    triggerAlarm(className, (double) result.get("confidence"));
                }

                response.put("status", detected ? "danger" : "normal");
                response.put("behavior", detected ? toBehaviorLabel(className) : "正常");
                response.putAll(result);
                return response;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            return response;
        }
    }

    private void triggerAlarm(String className, double confidence) {
        AlarmRecord record = new AlarmRecord();
        record.setDeviceId("AI_CAM_02");

        switch (className) {
            case "Fighting":
                record.setLevel("critical");
                record.setContent("🚨 [紧急] 监控区域发现疑似打架斗殴行为，请立即处置！");
                break;
            case "Robbery":
                record.setLevel("critical");
                record.setContent("🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！");
                break;
            case "Shooting":
                record.setLevel("critical");
                record.setContent("🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！");
                break;
            case "Fence_Climbing":
                record.setLevel("warning");
                record.setContent("⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！");
                break;
            case "Stealing":
                record.setLevel("warning");
                record.setContent("⚠️ [预警] 监控区域发现疑似盗窃行为，请注意监控！");
                break;
            default:
                return;
        }

        alarmService.createAlarm(record, null);
    }

    private String toBehaviorLabel(String className) {
        switch (className) {
            case "Fighting": return "打架斗殴";
            case "Robbery": return "抢劫";
            case "Shooting": return "持枪威胁";
            case "Fence_Climbing": return "翻越围栏";
            case "Stealing": return "盗窃";
            default: return className;
        }
    }
}
