package org.example.museumpc.controller;

import org.example.museumpc.ai.MuseumAssistant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/api/agent")
@CrossOrigin
public class AgentController {

    @Autowired
    private MuseumAssistant assistant;

    @PostMapping("/chat")
    public Map<String, Object> chat(@RequestBody Map<String, String> request) {
        String question = request.get("question");
        String sessionId = request.getOrDefault("sessionId", "default-session");

        String answer = assistant.chat(sessionId, question);

        Map<String, Object> res = new HashMap<>();
        res.put("answer", answer);
        res.put("success", true);
        return res;
    }
}