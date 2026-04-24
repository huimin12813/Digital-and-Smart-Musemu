package org.example.museumpc.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Data
@Getter
@Setter
public class SensorData {
    private String deviceId;
    private Integer smoke;
    private BigDecimal temperature;
    private BigDecimal humidity;
    private Integer light;
    private BigDecimal accelX;
    private BigDecimal accelY;
    private BigDecimal accelZ;
    private Integer pir;
    private Date createTime;
}