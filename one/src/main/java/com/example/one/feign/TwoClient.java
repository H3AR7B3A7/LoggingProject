package com.example.one.feign;


import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "TwoClient", url = "${DESTINATION_CLIENT}")
public interface TwoClient {

    @GetMapping("/{message}")
    String message(@PathVariable String message);
}