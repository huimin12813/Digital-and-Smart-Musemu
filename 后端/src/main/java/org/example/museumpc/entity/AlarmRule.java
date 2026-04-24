package org.example.museumpc.entity;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AlarmRule {
    // Getters and Setters
    private Integer id;
    private String name;
    private String conditionExpr;
    private String level;         // info, warning, critical
    private String actionType;    // mqtt, websocket
    private String actionTarget;  // 主题名或URL
    private String actionParams;  // JSON格式参数
    private Integer enabled;      // 1:启用, 0:禁用

    public AlarmRule() {}

}