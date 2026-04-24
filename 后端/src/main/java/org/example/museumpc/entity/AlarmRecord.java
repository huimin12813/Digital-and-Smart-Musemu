package org.example.museumpc.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@Data
public class AlarmRecord {
    // Getters and Setters
    private Long id;
    private String deviceId;
    private String level;
    private String content;
    private Integer confirmed; // 0:未确认, 1:已确认
    private Integer handled;   // 0:未处理, 1:已处理
    private Date createTime;
    private String handler;

    public AlarmRecord() {}

}