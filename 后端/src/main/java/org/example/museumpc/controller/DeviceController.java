package org.example.museumpc.controller;

import org.example.museumpc.entity.MuseumDevice;
import org.example.museumpc.entity.Result;
import org.example.museumpc.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class DeviceController {

    // 🌟 唯一核心：全面接管脏活累活的 Service
    @Autowired
    private DeviceService deviceService;

    // --- 4.3.1 控制接口 ---
    @PostMapping("/device/{deviceId}/control")
    public Map<String, Object> control(@PathVariable String deviceId, @RequestBody Map<String, Object> params) {
        String payload = deviceService.controlDevice(deviceId, params);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("payload", payload);
        return response;
    }

    @PostMapping("/device/{deviceId}/led/on") public Map<String, Object> ledOn(@PathVariable String deviceId) { return deviceService.executeQuickCmd(deviceId, "led", 1); }
    @PostMapping("/device/{deviceId}/led/off") public Map<String, Object> ledOff(@PathVariable String deviceId) { return deviceService.executeQuickCmd(deviceId, "led", 0); }
    @PostMapping("/device/{deviceId}/light/on") public Map<String, Object> lightOn(@PathVariable String deviceId) { return deviceService.executeQuickCmd(deviceId, "light", 1); }
    @PostMapping("/device/{deviceId}/light/off") public Map<String, Object> lightOff(@PathVariable String deviceId) { return deviceService.executeQuickCmd(deviceId, "light", 0); }
    @PostMapping("/device/{deviceId}/buzzer/on") public Map<String, Object> buzzerOn(@PathVariable String deviceId) { return deviceService.executeQuickCmd(deviceId, "buzzer", 1); }
    @PostMapping("/device/{deviceId}/buzzer/off") public Map<String, Object> buzzerOff(@PathVariable String deviceId) { return deviceService.executeQuickCmd(deviceId, "buzzer", 0); }
    @PostMapping("/device/{deviceId}/motor/on") public Map<String, Object> motorOn(@PathVariable String deviceId) { return deviceService.executeQuickCmd(deviceId, "motor", 1); }
    @PostMapping("/device/{deviceId}/motor/off") public Map<String, Object> motorOff(@PathVariable String deviceId) { return deviceService.executeQuickCmd(deviceId, "motor", 0); }

    // --- 4.3.11 布防状态 ---
    @PostMapping("/device/{deviceId}/arm")
    public Map<String, Object> armDevice(@PathVariable String deviceId) {
        deviceService.updateArmStatus(deviceId, 1);
        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }

    @PostMapping("/device/{deviceId}/disarm")
    public Map<String, Object> disarmDevice(@PathVariable String deviceId) {
        deviceService.updateArmStatus(deviceId, 0);
        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }

    @GetMapping("/device/{deviceId}/arm-status")
    public Map<String, Object> getArmStatus(@PathVariable String deviceId) {
        boolean armed = deviceService.getArmStatus(deviceId);
        Map<String, Object> res = new HashMap<>();
        res.put("armed", armed);
        return res;
    }

    // --- 4.3.10 管理接口 ---
    @GetMapping("/devices")
    public Result getDevices() {
        List<MuseumDevice> items = deviceService.getAllDevices();
        Map<String, Object> data = new HashMap<>();
        data.put("items", items);
        return Result.success("获取成功", data);
    }

    @PostMapping("/devices")
    public Map<String, Object> registerDevice(@RequestBody MuseumDevice device) {
        boolean success = deviceService.addDevice(device);
        Map<String, Object> res = new HashMap<>();
        res.put("success", success);
        return res;
    }

    @PutMapping("/devices/{deviceId}")
    public Map<String, Object> updateDevice(@PathVariable String deviceId, @RequestBody MuseumDevice device) {
        boolean success = deviceService.updateDevice(deviceId, device);
        Map<String, Object> res = new HashMap<>();
        res.put("success", success);
        return res;
    }

    @DeleteMapping("/devices/{deviceId}")
    public Map<String, Object> deleteDevice(@PathVariable String deviceId) {
        boolean success = deviceService.deleteDevice(deviceId);
        Map<String, Object> res = new HashMap<>();
        res.put("success", success);
        return res;
    }
}