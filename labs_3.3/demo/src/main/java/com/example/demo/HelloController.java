package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import de.huxhorn.sulky.ulid.ULID;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject("http://spring-boot-container:8080", String.class);

        ULID ulid = new ULID();
        String uniqueId = ulid.nextULID();

        return "Application secondaire : " + result + " (ID unique : " + uniqueId + ")";
    }
}