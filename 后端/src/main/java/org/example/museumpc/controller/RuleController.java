package org.example.museumpc.controller;

import org.example.museumpc.entity.AlarmRule;
import org.example.museumpc.service.AlarmRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/rules")
@CrossOrigin(origins = "*")
public class RuleController {

    // 🌟 注入刚刚建好的 Service
    @Autowired
    private AlarmRuleService alarmRuleService;

    @GetMapping
    public List<AlarmRule> getAllRules() {
        return alarmRuleService.getAllRules();
    }

    @GetMapping("/{id}")
    public AlarmRule getRuleById(@PathVariable("id") Integer id) {
        return alarmRuleService.getRuleById(id);
    }

    @PostMapping
    public Map<String, Object> createRule(@RequestBody AlarmRule rule) {
        alarmRuleService.createRule(rule);
        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }

    @PutMapping("/{id}")
    public Map<String, Object> updateRule(@PathVariable("id") Integer id, @RequestBody AlarmRule rule) {
        alarmRuleService.updateRule(id, rule);
        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }

    @DeleteMapping("/{id}")
    public Map<String, Object> deleteRule(@PathVariable("id") Integer id) {
        alarmRuleService.deleteRule(id);
        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }

    @PostMapping("/{id}/toggle")
    public Map<String, Object> toggleRule(@PathVariable("id") Integer id, @RequestBody Map<String, Boolean> payload) {
        alarmRuleService.toggleRule(id, payload.get("enabled"));
        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }
}