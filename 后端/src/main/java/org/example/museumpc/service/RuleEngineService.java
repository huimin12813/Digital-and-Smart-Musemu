package org.example.museumpc.service;

import com.googlecode.aviator.AviatorEvaluator;
import org.example.museumpc.entity.AlarmRecord;
import org.example.museumpc.entity.AlarmRule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class RuleEngineService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private AlarmService alarmService;

    public void process(String deviceId, Map<String, Object> dataMap) {
        String sql = "SELECT id, name, condition_expr as conditionExpr, level, action_params as actionParams FROM alarm_rule WHERE enabled = 1";
        List<AlarmRule> rules = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AlarmRule.class));

        for (AlarmRule rule : rules) {
            try {
                Boolean isTriggered = (Boolean) AviatorEvaluator.execute(rule.getConditionExpr(), dataMap);
                if (isTriggered != null && isTriggered) {
                    // 创建告警实体类
                    AlarmRecord record = new AlarmRecord();
                    record.setDeviceId(deviceId);
                    record.setLevel(rule.getLevel());
                    record.setContent(rule.getName() + ": 数值异常 " + dataMap.toString());

                    // 传递实体类给 AlarmService
                    alarmService.createAlarm(record, rule.getActionParams());
                }
            } catch (Exception e) {
                System.err.println("规则执行失败: " + rule.getName());
            }
        }
    }


}