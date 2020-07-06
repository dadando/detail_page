package com.spring.usercheck;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value="/home.me")
	public String home() {
		
		return "home";
	}
	
	
	
	
}
