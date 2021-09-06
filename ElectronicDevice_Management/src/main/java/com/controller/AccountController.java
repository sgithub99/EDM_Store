package com.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
//@RequestMapping("/user")
public class AccountController {
    @RequestMapping("/user")
    public String userPage(Model model) {
//        model.addAttribute("mess", "Welcome user page");
        return "accounts";
    }
}
