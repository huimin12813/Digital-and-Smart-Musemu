package org.example.museumpc.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class WorkOrder {
    // Getters and Setters
    private Long id;
    private Long alarmId;
    private String title;
    private String description;
    private String assignee;
    private String status; // pending, processing, completed, closed
    private Date createTime;
    private Date completeTime;

    public WorkOrder() {}

}