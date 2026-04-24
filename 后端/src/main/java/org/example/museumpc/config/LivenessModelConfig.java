package org.example.museumpc.config;

import cn.smartjavaai.common.cv.SmartImageFactory;
import cn.smartjavaai.common.enums.DeviceEnum;
import cn.smartjavaai.face.config.FaceDetConfig;
import cn.smartjavaai.face.config.FaceRecConfig;
import cn.smartjavaai.face.config.LivenessConfig;
import cn.smartjavaai.face.enums.FaceDetModelEnum;
import cn.smartjavaai.face.enums.FaceRecModelEnum;
import cn.smartjavaai.face.enums.LivenessModelEnum;
import cn.smartjavaai.face.factory.FaceDetModelFactory;
import cn.smartjavaai.face.factory.FaceRecModelFactory;
import cn.smartjavaai.face.factory.LivenessModelFactory;
import cn.smartjavaai.face.model.facedect.FaceDetModel;
import cn.smartjavaai.face.model.facerec.FaceRecModel;
import cn.smartjavaai.face.model.liveness.LivenessDetModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Slf4j
@Configuration
public class LivenessModelConfig {

    @PostConstruct
    public void initEngine() {
        // 必须在模型加载前设置图像处理引擎
        SmartImageFactory.setEngine(SmartImageFactory.Engine.OPENCV);
        log.info("SmartImageFactory 引擎已设置为 OPENCV");
    }

    // ========== 1. 人脸检测配置 ==========
    @Value("${face.detect.model-type:MTCNN}")
    private String detectModelType;
    @Value("${face.detect.model-path}")
    private String detectModelPath;
    @Value("${face.detect.confidence-threshold:0.5}")
    private float confidenceThreshold;
    @Value("${face.detect.nms-threshold:0.4}")
    private float nmsThreshold;
    @Value("${face.detect.device:CPU}")
    private String detectDevice;

    // ========== 2. 活体检测配置 ==========
    @Value("${face.liveness.enabled:true}")
    private boolean livenessEnabled;
    @Value("${face.liveness.model-type:SEETA_FACE6_MODEL}")
    private String livenessModelType;
    @Value("${face.liveness.model-path}")
    private String livenessModelPath;
    @Value("${face.liveness.reality-threshold:0.8}")
    private float realityThreshold;
    @Value("${face.liveness.device:CPU}")
    private String livenessDevice;
    @Value("${face.liveness.frame-count:10}")
    private int frameCount;
    @Value("${face.liveness.max-video-detect-frames:30}")
    private int maxVideoDetectFrames;

    // ========== 3. 人脸识别配置  ==========
    @Value("${face.recognize.model-type:INSIGHT_FACE_IRSE50_MODEL}")
    private String recognizeModelType;
    @Value("${face.recognize.model-path}")
    private String recognizeModelPath;


    /**
     * 1. 注册人脸检测模型 Bean
     */
    @Bean
    public FaceDetModel faceDetectModel() {
        FaceDetConfig config = new FaceDetConfig();
        config.setModelEnum(FaceDetModelEnum.valueOf(detectModelType));
        config.setModelPath(detectModelPath);
        config.setConfidenceThreshold(confidenceThreshold);
        config.setNmsThresh(nmsThreshold);
        config.setDevice(DeviceEnum.valueOf(detectDevice));
        return FaceDetModelFactory.getInstance().getModel(config);
    }

    /**
     * 2. 注册活体检测模型 Bean
     */
    @Bean
    public LivenessDetModel livenessDetModel(FaceDetModel faceDetectModel) {
        if (!livenessEnabled) {
            log.info("活体检测已禁用（face.liveness.enabled=false）");
            return null;
        }
        LivenessConfig config = new LivenessConfig();
        config.setModelEnum(LivenessModelEnum.valueOf(livenessModelType));
        config.setModelPath(livenessModelPath);
        config.setRealityThreshold(realityThreshold);
        config.setDevice(DeviceEnum.valueOf(livenessDevice));
        config.setFrameCount(frameCount);
        config.setMaxVideoDetectFrames(maxVideoDetectFrames);
        config.setDetectModel(faceDetectModel); // 关联检测器
        return LivenessModelFactory.getInstance().getModel(config);
    }

    /**
     * 3. 注册人脸特征识别模型 Bean
     */
    @Bean
    public FaceRecModel faceRecModel(FaceDetModel faceDetectModel) {
        FaceRecConfig config = new FaceRecConfig();
        config.setModelEnum(FaceRecModelEnum.valueOf(recognizeModelType));
        config.setModelPath(recognizeModelPath);
        config.setDetectModel(faceDetectModel); // 关联检测器
        return FaceRecModelFactory.getInstance().getModel(config);
    }
}