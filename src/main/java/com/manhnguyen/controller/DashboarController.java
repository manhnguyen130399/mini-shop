package com.manhnguyen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dashboard")
public class DashboarController {
	@GetMapping
	public String deFault() {
		return "dashboard";
	}

}
