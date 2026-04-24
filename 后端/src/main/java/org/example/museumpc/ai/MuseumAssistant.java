package org.example.museumpc.ai;

import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.spring.AiService;

@AiService
public interface MuseumAssistant {
    @SystemMessage({
            "你是一个拥有强大联网能力的博物馆智能管家 Kami。",
            "【联网规则】：如果用户询问的问题涉及实时事件、人物动态、或你不确定的事实，请直接调用 searchTheWeb 工具。",
            "请根据搜索结果提供客观、准确的汇报，严禁胡编乱造。"
    })
    String chat(@MemoryId String sessionId, @UserMessage String userMessage);
}