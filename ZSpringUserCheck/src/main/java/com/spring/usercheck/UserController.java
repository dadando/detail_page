package com.spring.usercheck;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;
	
//	@RequestMapping(value="/user_check.me", produces="application/json;charset=UTF-8")
//	private int usercheck(String id)throws Exception{
//		System.out.println(id);
//		int res = userService.usercheckService(id);
//		
//		return res;
//	}
	@RequestMapping(value="/user_check.me", produces="application/json;charset=UTF-8")
	private int usercheck(String id)throws Exception{
		System.out.println(id);
		int res = userService.usercheckService(id);
		System.out.println("res"+res);
		return res;
	}
}
