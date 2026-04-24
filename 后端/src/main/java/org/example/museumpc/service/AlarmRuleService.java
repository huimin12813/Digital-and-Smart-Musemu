package org.example.museumpc.service;

import org.example.museumpc.entity.AlarmRule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlarmRuleService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<AlarmRule> getAllRules() {
        String sql = "SELECT id, name, condition_expr as conditionExpr, level, action_type as actionType, action_target as actionTarget, action_params as actionParams, enabled FROM alarm_rule";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AlarmRule.class));
    }

    public AlarmRule getRuleById(Integer id) {
        String sql = "SELECT id, name, condition_expr as conditionExpr, level, action_type as actionType, action_target as actionTarget, action_params as actionParams, enabled FROM alarm_rule WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(AlarmRule.class), id);
    }

    public void createRule(AlarmRule rule) {
        String sql = "INSERT INTO alarm_rule (name, condition_expr, level, action_type, action_target, action_params, enabled) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, rule.getName(), rule.getConditionExpr(), rule.getLevel(), rule.getActionType(), rule.getActionTarget(), rule.getActionParams(), rule.getEnabled());
    }

    public void updateRule(Integer id, AlarmRule rule) {
        String sql = "UPDATE alarm_rule SET name=?, condition_expr=?, level=?, enabled=? WHERE id=?";
        jdbcTemplate.update(sql, rule.getName(), rule.getConditionExpr(), rule.getLevel(), rule.getEnabled(), id);
    }

    public void deleteRule(Integer id) {
        jdbcTemplate.update("DELETE FROM alarm_rule WHERE id = ?", id);
    }

    public void toggleRule(Integer id, Boolean enabled) {
        jdbcTemplate.update("UPDATE alarm_rule SET enabled = ? WHERE id = ?", enabled ? 1 : 0, id);
    }
}