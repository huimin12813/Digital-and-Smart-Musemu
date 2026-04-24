package org.example.museumpc.mqtt;

import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class MqttAcceptClient {
    @Autowired
    private MqttProperties mqttProperties;
    @Autowired
    private MqttAcceptCallback mqttAcceptCallback;

    private MqttClient client;

    @PostConstruct
    public void init() {
        connect();
    }

    public void connect() {
        try {
            // 使用配置的 clientId 加上后缀，防止与发送端冲突
            client = new MqttClient(mqttProperties.getHostUrl(), mqttProperties.getClientId() + "_accept", new MemoryPersistence());
            MqttConnectOptions options = new MqttConnectOptions();
            options.setCleanSession(mqttProperties.isCleanSession());
            options.setUserName(mqttProperties.getUsername());
            if (mqttProperties.getPassword() != null && !mqttProperties.getPassword().isEmpty()) {
                options.setPassword(mqttProperties.getPassword().toCharArray());
            }
            options.setConnectionTimeout(mqttProperties.getTimeout());
            options.setKeepAliveInterval(mqttProperties.getKeepAlive());
            options.setAutomaticReconnect(mqttProperties.isReconnect());

            client.setCallback(mqttAcceptCallback);
            client.connect(options);
            System.out.println(">>> MQTT 接收端连接成功！");

            if (mqttProperties.getSubscribeTopic() != null) {
                client.subscribe(mqttProperties.getSubscribeTopic(), mqttProperties.getQos());
                System.out.println(">>> 已订阅: " + mqttProperties.getSubscribeTopic());
            }
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }
}