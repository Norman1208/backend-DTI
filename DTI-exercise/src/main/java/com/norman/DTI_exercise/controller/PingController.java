package com.norman.DTI_exercise.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/ping")
public class PingController {

    @GetMapping
    public String getPing() {
        return "Ping endpoint working!";
    }
}