package org.example.museumpc.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "face.liveness")
public class LivenessProperties {
    private boolean enabled = true;
    private String modelType;          // 如 "IIC_FL_MODEL"
    private String modelPath;
    private float realityThreshold = 0.8f;
    private String device = "CPU";
    private int frameCount = 10;
    private int maxVideoDetectFrames = 30;
}