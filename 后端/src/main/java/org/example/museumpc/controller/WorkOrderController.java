package org.example.museumpc.controller;

import org.example.museumpc.entity.WorkOrder;
import org.example.museumpc.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/workorders")
@CrossOrigin(origins = "*")
public class WorkOrderController {

    // 注入我们刚刚写好的 Service
    @Autowired
    private WorkOrderService workOrderService;

    // 1. 查询工单列表
    @GetMapping
    public Map<String, Object> getWorkOrders(@RequestParam(required = false) String status,
                                             @RequestParam(defaultValue = "1") int page,
                                             @RequestParam(defaultValue = "20") int size) {
        // 调用 Service 获取数据
        List<WorkOrder> items = workOrderService.getWorkOrders(status, page, size);

        // 组装前端需要的返回格式
        Map<String, Object> res = new HashMap<>();
        res.put("total", items.size());
        res.put("items", items);
        return res;
    }

    // 2. 查询单条工单
    @GetMapping("/{id}")
    public WorkOrder getWorkOrder(@PathVariable Long id) {
        return workOrderService.getWorkOrderById(id);
    }

    // 3. 新增工单
    @PostMapping
    public Map<String, Object> createWorkOrder(@RequestBody WorkOrder wo) {
        workOrderService.createWorkOrder(wo);

        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }

    // 4. 指派工单
    @PutMapping("/{id}/assign")
    public Map<String, Object> assign(@PathVariable Long id, @RequestBody Map<String, String> payload) {
        workOrderService.assignWorkOrder(id, payload.get("assignee"));

        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }

    // 5. 更新状态 (比如标记完成)
    @PutMapping("/{id}/status")
    public Map<String, Object> updateStatus(@PathVariable Long id, @RequestBody Map<String, String> payload) {
        workOrderService.updateWorkOrderStatus(id, payload.get("status"));

        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }

    // 6. 删除工单
    @DeleteMapping("/{id}")
    public Map<String, Object> delete(@PathVariable Long id) {
        workOrderService.deleteWorkOrder(id);

        Map<String, Object> res = new HashMap<>();
        res.put("success", true);
        return res;
    }
}