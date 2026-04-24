package org.example.museumpc.mqtt;

import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class MqttSendClient {
    @Autowired
    private MqttProperties mqttProperties;

    private MqttClient client;

    @PostConstruct
    public void init() {
        connect();
    }

    public void connect() {
        try {
            client = new MqttClient(mqttProperties.getHostUrl(), mqttProperties.getClientId() + "_sender", new MemoryPersistence());
            MqttConnectOptions options = new MqttConnectOptions();
            options.setCleanSession(mqttProperties.isCleanSession());
            options.setUserName(mqttProperties.getUsername());
            if (mqttProperties.getPassword() != null && !mqttProperties.getPassword().isEmpty()) {
                options.setPassword(mqttProperties.getPassword().toCharArray());
            }
            options.setConnectionTimeout(mqttProperties.getTimeout());
            options.setKeepAliveInterval(mqttProperties.getKeepAlive());
            options.setAutomaticReconnect(mqttProperties.isReconnect());

            client.connect(options);
            System.out.println(">>> MQTT 发送端连接成功！");
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }

    public void publish(String topic, String message) {
        try {
            MqttMessage mqttMessage = new MqttMessage(message.getBytes());
            mqttMessage.setQos(mqttProperties.getQos());
            client.publish(topic, mqttMessage);
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }
}