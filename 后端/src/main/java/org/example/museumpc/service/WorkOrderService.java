package org.example.museumpc.service;

import org.example.museumpc.entity.WorkOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkOrderService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 1. 分页或根据状态查询列表
    public List<WorkOrder> getWorkOrders(String status, int page, int size) {
        int offset = (page - 1) * size;
        String sql = "SELECT id, alarm_id as alarmId, title, status, create_time as createTime FROM work_order ";

        if (status != null && !status.trim().isEmpty()) {
            return jdbcTemplate.query(sql + "WHERE status = ? LIMIT ? OFFSET ?",
                    new BeanPropertyRowMapper<>(WorkOrder.class), status, size, offset);
        } else {
            return jdbcTemplate.query(sql + "LIMIT ? OFFSET ?",
                    new BeanPropertyRowMapper<>(WorkOrder.class), size, offset);
        }
    }

    // 2. 根据 ID 查询单条详情
    public WorkOrder getWorkOrderById(Long id) {
        String sql = "SELECT id, alarm_id as alarmId, title, description, assignee, status, create_time as createTime, complete_time as completeTime FROM work_order WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(WorkOrder.class), id);
    }

    // 3. 创建新工单
    public void createWorkOrder(WorkOrder wo) {
        String sql = "INSERT INTO work_order (alarm_id, title, description, assignee, status, create_time) VALUES (?, ?, ?, ?, 'pending', NOW())";
        jdbcTemplate.update(sql, wo.getAlarmId(), wo.getTitle(), wo.getDescription(), wo.getAssignee());
    }

    // 4. 指派工单处理人
    public void assignWorkOrder(Long id, String assignee) {
        String sql = "UPDATE work_order SET assignee = ?, status = 'processing' WHERE id = ?";
        jdbcTemplate.update(sql, assignee, id);
    }

    // 5. 更新工单状态
    public void updateWorkOrderStatus(Long id, String status) {
        String sql = "UPDATE work_order SET status = ? WHERE id = ?";
        jdbcTemplate.update(sql, status, id);
    }

    // 6. 删除工单
    public void deleteWorkOrder(Long id) {
        String sql = "DELETE FROM work_order WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}