package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AppController {
	@RequestMapping(value = {"/loginAdmin" })
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
			model.addAttribute("mess", "Login failed!");
		}
		return "loginAdmin";
	}

	@RequestMapping("/logout")
	public String logout(Model model) {
		model.addAttribute("mess", "Has Logged out!!!");
		return "loginAdmin";
	}
}
