package org.example.museumpc.controller;

import org.example.museumpc.service.AbnormalBehaviorService;
import org.example.museumpc.service.FireDetectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.Map;

@RestController
@RequestMapping("/api/vision")
@CrossOrigin
public class VisionController {

    @Autowired
    private FireDetectionService fireDetectionService;


    @Autowired
    private AbnormalBehaviorService abnormalBehaviorService;

    @PostMapping("/fire-monitor")
    public Map<String, Object> securityMonitor(@RequestParam("image") MultipartFile file) {
        Map<String, Object> result = fireDetectionService.detectFire(file);
        result.put("code", 200);
        return result;
    }


    @PostMapping("/behavior-monitor")
    public Map<String, Object> abnormalMonitor(@RequestParam("image") MultipartFile file) {
        Map<String, Object> result = abnormalBehaviorService.detectBehavior(file);
        result.put("code", 200);
        return result;
    }
}