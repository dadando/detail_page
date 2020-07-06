package com.spring.alltion.hongsub;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/loginform.hs")
	public String loginForm(HttpSession session) throws Exception{
		
		return "loginForm";
	}
}
