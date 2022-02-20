package com.example.one.service;

import com.example.one.feign.TwoClient;
import org.springframework.stereotype.Service;

@Service
public class MyService {
    
    public TwoClient twoClient;

    public MyService(TwoClient twoClient) {
        this.twoClient = twoClient;
    }

    public void makeRequestToContainerTwo(String message) {
        twoClient.message(message);
    }
}