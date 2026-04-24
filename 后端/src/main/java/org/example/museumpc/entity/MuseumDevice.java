package org.example.museumpc.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@Data
public class MuseumDevice {
    // Getters and Setters
    private Integer id;
    private String deviceId;
    private String name;
    private String location;
    private Integer status;      // 1:在线, 0:离线
    private Date lastActive;
    private Date createTime;
    private Integer armStatus;   // 1:布防, 0:撤防
    private Integer ledStatus;
    private Integer lightStatus;
    private Integer buzzerStatus;
    private Integer motorStatus;
    private String region;
    public MuseumDevice() {}

}