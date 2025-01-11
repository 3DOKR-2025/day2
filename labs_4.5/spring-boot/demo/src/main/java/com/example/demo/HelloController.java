package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        return "Bonjour depuis Spring Boot!";
    }

    @GetMapping("/express")
    public String callExpress() {
        RestTemplate restTemplate = new RestTemplate();
        String responseFromExpress = restTemplate.getForObject("http://express:3000/", String.class); // Utilisation d'express
        return "Spring boot received: " + responseFromExpress;
    }
}