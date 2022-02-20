package com.example.one.controller;

import com.example.one.service.MyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {
    private static final Logger LOGGER = LoggerFactory.getLogger(MyController.class);

    private final MyService myService;

    public MyController(MyService myService) {
        this.myService = myService;
    }

    @GetMapping("/{message}")
    public String hello(@PathVariable String message) {
        LOGGER.info("[ONE]:" + message);

        myService.makeRequestToContainerTwo(message);
        
        return "Container logged and sent message to container TWO";
    }
}