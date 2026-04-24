package org.example.museumpc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PersonService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 获取所有人员精简信息（排除庞大的 feature_data）
     */
    public List<Map<String, Object>> getAllPersons() {
        String sql = "SELECT id, name, role, create_time as createTime FROM person ORDER BY id DESC";
        return jdbcTemplate.queryForList(sql);
    }

    /**
     * 根据 ID 删除人员
     */
    public void deletePersonById(Long id) {
        String sql = "DELETE FROM person WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}