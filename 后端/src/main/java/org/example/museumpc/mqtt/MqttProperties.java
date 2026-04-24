package org.example.museumpc.mqtt;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "mqtt")
public class MqttProperties {
    private String hostUrl;      // 对应 yml: host-url
    private String username;
    private String password;
    private String clientId;    // 对应 yml: clientId
    private String subscribeTopic; // 对应 yml: subscribe-topic
    private String sendTopic;      // 对应 yml: send-topic
    private int timeout;
    private int keepAlive;      // 对应 yml: keep-alive
    private boolean cleanSession; // 对应 yml: clean-session
    private boolean reconnect;    // 对应 yml: reconnect
    private int qos;
}