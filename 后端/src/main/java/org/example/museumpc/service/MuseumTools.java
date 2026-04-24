package org.example.museumpc.service;

import dev.langchain4j.agent.tool.P;
import dev.langchain4j.agent.tool.Tool;
import dev.langchain4j.web.search.WebSearchEngine;
import org.example.museumpc.entity.AlarmRecord;
import org.example.museumpc.entity.SensorData;
import org.example.museumpc.entity.WorkOrder;
import org.example.museumpc.mqtt.MqttSendClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import java.util.List;

/**
 * AI Agent 工具类：利用实体类与数据库交互，并为 AI 提供格式化后的字符串结果
 */
@Slf4j
@Service
public class MuseumTools {

    private final JdbcTemplate jdbcTemplate;
    private final MqttSendClient mqttSendClient;
    private final WebSearchEngine searchEngine;

    // 2. 手动写构造函数 (这是最稳妥的 Spring 注入方式)
    @Autowired
    public MuseumTools(JdbcTemplate jdbcTemplate,
                       MqttSendClient mqttSendClient,
                       WebSearchEngine searchEngine) {
        this.jdbcTemplate = jdbcTemplate;
        this.mqttSendClient = mqttSendClient;
        this.searchEngine = searchEngine;
    }

    /**
     * 1. 查询历史传感器数据
     */
    @Tool("查询指定设备在特定时间段内的传感器历史数据(如温度、湿度、烟雾浓度)。参数：deviceId, startTime, endTime (格式: yyyy-MM-dd HH:mm:ss)")
    public String query_sensor_data(String deviceId, String startTime, String endTime) {
        // 使用 SensorData 实体类，注意别名匹配小驼峰
        String sql = "SELECT temperature, humidity, smoke, light, create_time as createTime FROM sensor_data " +
                "WHERE device_id = ? AND create_time BETWEEN ? AND ? ORDER BY create_time ASC LIMIT 10";
        try {
            List<SensorData> data = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(SensorData.class), deviceId, startTime, endTime);
            if (data.isEmpty()) return "该时段内未查到环境数据。";

            StringBuilder sb = new StringBuilder("查询到的环境历史记录如下：\n");
            for (SensorData s : data) {
                sb.append(String.format("[%s] 温度:%s, 湿度:%s, 烟雾:%d, 光照:%d\n",
                        s.getCreateTime(), s.getTemperature(), s.getHumidity(), s.getSmoke(), s.getLight()));
            }
            return sb.toString();
        } catch (Exception e) {
            return "数据库查询失败: " + e.getMessage();
        }
    }

    /**
     * 2. 查询未处理告警
     */
    @Tool("查询指定级别且尚未处理的报警记录。参数：level ('critical'-严重, 'warning'-警告)")
    public String query_alarms(String level) {
        String sql = "SELECT content, device_id as deviceId, create_time as createTime FROM alarm_record " +
                "WHERE level = ? AND handled = 0 ORDER BY id DESC LIMIT 5";
        try {
            // 利用 AlarmRecord 实体类
            List<AlarmRecord> alarms = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AlarmRecord.class), level);
            if (alarms.isEmpty()) return "当前没有任何未处理的 " + level + " 级报警。";

            StringBuilder sb = new StringBuilder("为您检测到以下未处理报警：\n");
            for (AlarmRecord a : alarms) {
                sb.append(String.format("- [时间:%s] [设备:%s] 内容:%s\n",
                        a.getCreateTime(), a.getDeviceId(), a.getContent()));
            }
            return sb.toString();
        } catch (Exception e) {
            return "获取报警记录失败。";
        }
    }

    /**
     * 3. 硬件控制
     */
    @Tool("下发硬件控制指令。参数：deviceId, command (JSON格式，如: {\"led\":1} 开启报警灯)")
    public String control_device(String deviceId, String command) {
        try {
            mqttSendClient.publish("museum/" + deviceId + "/actuators", command);
            return "指令 [" + command + "] 已成功发送至设备 " + deviceId;
        } catch (Exception e) {
            return "发送控制指令失败。";
        }
    }

    /**
     * 4. 查询工单统计 (实体化改造)
     */
    @Tool("查询博物馆工单的处理进度和统计信息，了解维护情况")
    public String query_work_order_stats() {
        // 技巧：为了完全不使用 Map，我们查询 WorkOrder 列表并手动在内存中进行简单的统计
        // 或者使用一个专门的统计 SQL 映射到 WorkOrder 对象的属性上
        String sql = "SELECT status, COUNT(*) as id FROM work_order GROUP BY status";
        // 这里巧妙地把 COUNT(*) 映射到了实体类的 id 属性上，避免创建新类

        try {
            List<WorkOrder> stats = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(WorkOrder.class));
            if (stats.isEmpty()) return "目前系统中没有任何工单记录。";

            StringBuilder result = new StringBuilder("工单实时处理进度如下：\n");
            for (WorkOrder stat : stats) {
                // stat.getStatus() 是状态名，stat.getId() 现在存储的是该状态的数量
                result.append(String.format("- 状态: %s, 累计工单数量: %d\n",
                        stat.getStatus(), stat.getId()));
            }
            return result.toString();
        } catch (Exception e) {
            return "工单统计查询异常。";
        }
    }

    // ========== 安防 LED 控制 ==========
    @Tool("打开指定设备的安防LED灯")
    public String turnOnLed(String deviceId) {
        log.info("AI 调用工具：打开安防LED，设备 {}", deviceId);
        mqttSendClient.publish("museum/" + deviceId + "/actuators", "{\"led\":1}");
        return "已打开设备 " + deviceId + " 的安防LED灯";
    }

    @Tool("关闭指定设备的安防LED灯")
    public String turnOffLed(String deviceId) {
        log.info("AI 调用工具：关闭安防LED，设备 {}", deviceId);
        mqttSendClient.publish("museum/" + deviceId + "/actuators", "{\"led\":0}");
        return "已关闭设备 " + deviceId + " 的安防LED灯";
    }

    // ========== 补光灯控制 ==========
    @Tool("打开指定设备的补光灯")
    public String turnOnLight(String deviceId) {
        log.info("AI 调用工具：打开补光灯，设备 {}", deviceId);
        mqttSendClient.publish("museum/" + deviceId + "/actuators", "{\"light\":1}");
        return "已打开设备 " + deviceId + " 的补光灯";
    }

    @Tool("关闭指定设备的补光灯")
    public String turnOffLight(String deviceId) {
        log.info("AI 调用工具：关闭补光灯，设备 {}", deviceId);
        mqttSendClient.publish("museum/" + deviceId + "/actuators", "{\"light\":0}");
        return "已关闭设备 " + deviceId + " 的补光灯";
    }

    // ========== 蜂鸣器控制 ==========
    @Tool("打开指定设备的蜂鸣器")
    public String turnOnBuzzer(String deviceId) {
        log.info("AI 调用工具：打开蜂鸣器，设备 {}", deviceId);
        mqttSendClient.publish("museum/" + deviceId + "/actuators", "{\"buzzer\":1}");
        return "已打开设备 " + deviceId + " 的蜂鸣器";
    }

    @Tool("关闭指定设备的蜂鸣器")
    public String turnOffBuzzer(String deviceId) {
        log.info("AI 调用工具：关闭蜂鸣器，设备 {}", deviceId);
        mqttSendClient.publish("museum/" + deviceId + "/actuators", "{\"buzzer\":0}");
        return "已关闭设备 " + deviceId + " 的蜂鸣器";
    }

    // ========== 电机控制 ==========
    @Tool("启动指定设备的电机")
    public String turnOnMotor(String deviceId) {
        log.info("AI 调用工具：启动电机，设备 {}", deviceId);
        mqttSendClient.publish("museum/" + deviceId + "/actuators", "{\"motor\":1}");
        return "已启动设备 " + deviceId + " 的电机";
    }

    @Tool("关闭指定设备的电机")
    public String turnOffMotor(String deviceId) {
        log.info("AI 调用工具：关闭电机，设备 {}", deviceId);
        mqttSendClient.publish("museum/" + deviceId + "/actuators", "{\"motor\":0}");
        return "已关闭设备 " + deviceId + " 的电机";
    }

    @Tool("联网搜索工具。当你无法回答用户的问题，或者涉及人物、八卦、实时新闻、天气、最新文物动态时，必须使用此工具。")
    public String searchTheWeb(@P("想要搜索的关键词或具体问题")String query) {
        // 打印这个很重要，能确认模型是否真的动了
        System.out.println(">>> [Agent日志] 正在执行联网搜索，关键词: " + query);
        try {
            // 注意：tavily 返回的可能是对象，确保 toString 后的内容模型能看懂
            return searchEngine.search(query).toString();
        } catch (Exception e) {
            log.error("搜索失败", e);
            return "搜索服务暂时不可用: " + e.getMessage();
        }
    }
}