package org.example.museumpc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MuseumPcApplication {

    public static void main(String[] args) {
        SpringApplication.run(MuseumPcApplication.class, args);
        System.out.println("=================================================");
        System.out.println("   系统整合启动成功：");
        System.out.println("   1. 人脸检测模块已就绪");
        System.out.println("   2. MQTT 消息服务已就绪");
        System.out.println("=================================================");
    }
}
