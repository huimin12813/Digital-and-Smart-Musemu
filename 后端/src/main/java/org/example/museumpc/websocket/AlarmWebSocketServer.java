package org.example.museumpc.websocket;

import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/ws/alarm")
@Component
public class AlarmWebSocketServer {

    // 线程安全集合，存放每个连进来的前端大屏/浏览器客户端
    private static CopyOnWriteArraySet<AlarmWebSocketServer> webSocketSet = new CopyOnWriteArraySet<>();

    private Session session;

    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        webSocketSet.add(this);
        System.out.println("【WebSocket】有新的大屏连接加入！当前在线大屏数：" + webSocketSet.size());
    }

    @OnClose
    public void onClose() {
        webSocketSet.remove(this);
        System.out.println("【WebSocket】有大屏连接断开！当前在线大屏数：" + webSocketSet.size());
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("【WebSocket】收到大屏端心跳消息: " + message);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("【WebSocket】发生错误");
        error.printStackTrace();
    }

    /**
     * 【核心方法】：由后端其他 Service 调用，向所有大屏广播最新告警
     * @param message JSON 格式的告警信息
     */
    public static void broadcast(String message) {
        for (AlarmWebSocketServer client : webSocketSet) {
            try {
                client.session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}