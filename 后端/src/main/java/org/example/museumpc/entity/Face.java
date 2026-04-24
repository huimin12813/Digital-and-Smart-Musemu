package org.example.museumpc.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class Face {
    // Getters and Setters
    private String id;
    private String name;
    private String metadata; // 存储JSON字符串
    private String feature;  // 存储特征向量字符串
    private Date createTime;

    public Face() {}

}