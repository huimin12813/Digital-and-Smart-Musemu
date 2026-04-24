package org.example.museumpc.controller;

import org.example.museumpc.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/face-rec")
@CrossOrigin(origins = "*")
public class PersonController {

    // 🌟 注入刚才写好的 Service
    @Autowired
    private PersonService personService;

    @GetMapping("/persons")
    public Map<String, Object> getPersons() {
        // 让 Service 去干活
        List<Map<String, Object>> persons = personService.getAllPersons();

        Map<String, Object> response = new HashMap<>();
        response.put("code", 200);
        response.put("data", persons);
        return response;
    }

    @DeleteMapping("/persons/{id}")
    public Map<String, Object> deletePerson(@PathVariable Long id) {
        // 让 Service 去删人
        personService.deletePersonById(id);

        Map<String, Object> response = new HashMap<>();
        response.put("code", 200);
        response.put("success", true);
        response.put("message", "删除成功");
        return response;
    }
}