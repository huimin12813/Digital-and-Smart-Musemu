package org.example.museumpc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    private final FaceDetectionController faceDetectionController;
    private final AlarmWebSocketHandler alarmWebSocketHandler;

    // 构造函数注入
    public WebSocketConfig(FaceDetectionController faceDetectionController,
                           AlarmWebSocketHandler alarmWebSocketHandler) {
        this.faceDetectionController = faceDetectionController;
        this.alarmWebSocketHandler = alarmWebSocketHandler;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        // 注册人脸检测
        registry.addHandler(faceDetectionController, "/ws/face-detect")
                .setAllowedOrigins("*"); // 这里先用 setAllowedOrigins("*") 试一下

        // 注册告警推送
        registry.addHandler(alarmWebSocketHandler, "/ws/alarm")
                .setAllowedOrigins("*");
    }

    // 【注意】：暂时注释掉下面这个 Bean，看 404 是否消失
    /*
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
    */
}