package com.springmvc.my.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.springmvc.my.domain.*;

@Controller
public class SimpleRestController {
	/*
    @GetMapping("/ajax")
    public String ajax() {
        return "ajax";
    }

    @PostMapping("/send")
    @ResponseBody
    public Person test(@RequestBody Person p) {
        System.out.println("p = " + p);
        p.setName("ABC");
        p.setAge(p.getAge() + 10);

        return p;
    }
    */
}
