package org.example.museumpc.controller;

import org.example.museumpc.entity.AccessLog;
import org.example.museumpc.entity.Face;
import org.example.museumpc.service.FaceDetectionService;
import org.example.museumpc.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/face-rec")
@CrossOrigin(origins = "*")
public class FaceApiController {

    @Autowired
    private FaceDetectionService faceDetectionService;

    @Autowired
    private PersonService personService;

    // ===================================================
    // 1. 人脸识别核心接口 (保持原样，交给 FaceDetectionService)
    // ===================================================

    @PostMapping("/register")
    public Map<String, Object> register(@RequestBody Map<String, Object> request) {
        String imageBase64 = (String) request.get("imageBase64");
        @SuppressWarnings("unchecked")
        Map<String, Object> metadata = (Map<String, Object>) request.get("metadata");
        Map<String, Object> response = new HashMap<>();

        String faceId = faceDetectionService.registerFaceWithMetadata(imageBase64, metadata);
        if (faceId != null) {
            response.put("success", true);
            response.put("faceId", faceId);
        } else {
            response.put("success", false);
            response.put("message", "人脸录入失败");
        }
        return response;
    }

    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody Map<String, Object> request) {
        String imageBase64 = request.get("imageBase64").toString();
        Map<String, Object> response = new HashMap<>();

        if (imageBase64 == null) {
            response.put("success", false);
            response.put("message", "图像数据缺失");
            return response;
        }

        Map<String, Object> loginResult = faceDetectionService.faceLogin(imageBase64);
        if (loginResult != null) {
            response.put("success", true);
            response.put("message", "登录成功");
            response.put("user", loginResult);
        } else {
            response.put("success", false);
            response.put("message", "查无此人或特征不匹配");
        }
        return response;
    }

    @GetMapping("/list")
    public List<Face> list() {
        return faceDetectionService.getAllFaces();
    }

    @PostMapping("/search")
    public List<Map<String, Object>> search(@RequestBody Map<String, Object> request) {
        String imageBase64 = (String) request.get("imageBase64");
        int topK = (int) request.getOrDefault("topK", 1);
        double threshold = Double.parseDouble(request.getOrDefault("threshold", 0.62).toString());
        return faceDetectionService.searchFace(imageBase64, topK, threshold);
    }

    @DeleteMapping("/{faceId}")
    public Map<String, Object> delete(@PathVariable String faceId) {
        boolean success = faceDetectionService.deleteFace(faceId);
        Map<String, Object> response = new HashMap<>();
        response.put("success", success);
        return response;
    }

    // ===================================================
    // 2. 通行日志接口 (SQL 剥离至 FaceDetectionService)
    // ===================================================

    @GetMapping("/access-logs")
    public List<AccessLog> getAccessLogs() {
        // 传递默认参数 100，保持你原有逻辑的功能不变
        return faceDetectionService.getRecentAccessLogs(100);
    }

}