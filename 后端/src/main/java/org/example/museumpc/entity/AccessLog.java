package org.example.museumpc.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class AccessLog {
    // Getters and Setters
    private Long id;
    private String personId;
    private String personName;
    private String role;
    private Date accessTime;
    private Integer granted; // 1:通过, 0:拒绝
    private String deviceId;
    private String reason;

    public AccessLog() {}

}