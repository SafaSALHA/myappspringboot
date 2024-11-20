package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyAppController {

    @GetMapping("/")
    public String home() {
        return "index";  // Le nom du fichier HTML sans l'extension
    }
}
