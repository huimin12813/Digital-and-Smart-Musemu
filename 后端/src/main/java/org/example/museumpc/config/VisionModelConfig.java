package org.example.museumpc.config;

import ai.djl.modality.cv.Image;
import ai.djl.repository.zoo.Criteria;
import ai.djl.repository.zoo.ZooModel;
import org.example.museumpc.ai.AbnormalBehaviorTranslator;
import org.example.museumpc.ai.FireTranslator;
import org.example.museumpc.ai.PersonTranslator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

@Configuration
public class VisionModelConfig {

    // ================== 从 application.yml 读取配置 ================== //

    @Value("${vision.models.fire.path}")
    private String fireModelPath;

    @Value("${vision.models.fire.name}")
    private String fireModelName;

    @Value("${vision.models.abnormal.path}")
    private String abnormalModelPath;

    @Value("${vision.models.abnormal.name}")
    private String abnormalModelName;

    // ================== 模型 Bean 实例化区 ================== //

    @Bean(destroyMethod = "close")
    public ZooModel<Image, List<Map<String, Object>>> fireModel() throws Exception {
        System.out.println("[VisionModelConfig] 正在加载火焰检测模型... 路径: " + fireModelPath);
        Criteria<Image, List<Map<String, Object>>> criteria = Criteria.builder()
                .setTypes(Image.class, (Class<List<Map<String, Object>>>) (Class<?>) List.class)
                .optEngine("OnnxRuntime")
                .optModelPath(Paths.get(fireModelPath))      // 动态读取路径
                .optModelName(fireModelName)                 // 动态读取模型名
                .optTranslator(new FireTranslator())
                .build();
        return criteria.loadModel();
    }



    @Bean(destroyMethod = "close")
    public ZooModel<Image, Map<String, Object>> abnormalBehaviorModel() throws Exception {
        System.out.println("[VisionModelConfig] 正在加载异常行为检测模型... 路径: " + abnormalModelPath);
        Criteria<Image, Map<String, Object>> criteria = Criteria.builder()
                .setTypes(Image.class, (Class<Map<String, Object>>) (Class<?>) Map.class)
                .optEngine("OnnxRuntime")
                .optModelPath(Paths.get(abnormalModelPath))  // 动态读取路径
                .optModelName(abnormalModelName)             // 动态读取模型名
                .optTranslator(new AbnormalBehaviorTranslator())
                .build();
        return criteria.loadModel();
    }
}