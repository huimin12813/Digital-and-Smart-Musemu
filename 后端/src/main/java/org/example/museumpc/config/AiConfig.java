package org.example.museumpc.config;

import dev.langchain4j.model.openai.OpenAiChatModel;
import dev.langchain4j.service.AiServices;
import dev.langchain4j.web.search.WebSearchEngine;
import org.example.museumpc.ai.MuseumAssistant;
import org.example.museumpc.service.MuseumTools;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import dev.langchain4j.memory.chat.ChatMemoryProvider;
import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import java.time.Duration;
import dev.langchain4j.web.search.tavily.TavilyWebSearchEngine;

@Configuration
public class AiConfig {

    // ================= 从 application.yml 读取 DeepSeek 配置 =================
    @Value("${ai.deepseek.base-url}")
    private String baseUrl;

    @Value("${ai.deepseek.api-key}")
    private String apiKey;

    @Value("${ai.deepseek.model-name}")
    private String modelName;

    @Value("${ai.deepseek.temperature}")
    private Double temperature;

    // ================= 从 application.yml 读取 Tavily 搜索配置 =================
    @Value("${ai.tavily.api-key}")
    private String tavilyApiKey;


    @Bean
    public OpenAiChatModel openAiChatModel() {
        return OpenAiChatModel.builder()
                .baseUrl(baseUrl)            // 使用读取到的 baseUrl
                .apiKey(apiKey)              // 使用读取到的 apiKey
                .modelName(modelName)        // 使用读取到的模型名称
                .temperature(temperature)    // 使用读取到的温度值
                .timeout(Duration.ofSeconds(60))
                .logRequests(true)
                .logResponses(true)
                .build();
    }

    @Bean
    public WebSearchEngine searchEngine() {
        return TavilyWebSearchEngine.builder()
                .apiKey(tavilyApiKey)        // 使用读取到的 Tavily 密钥
                .build();
    }

    @Bean
    public MuseumAssistant museumAssistant(OpenAiChatModel model, MuseumTools tools, ChatMemoryProvider mem) {
        return AiServices.builder(MuseumAssistant.class)
                .chatLanguageModel(model)
                .tools(tools)
                .chatMemoryProvider(mem)
                .build();
    }

    @Bean
    public ChatMemoryProvider chatMemoryProvider() {
        return sessionId -> MessageWindowChatMemory.withMaxMessages(10);
    }
}