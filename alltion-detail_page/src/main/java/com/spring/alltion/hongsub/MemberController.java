package com.spring.alltion.hongsub;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("/login.hs")
	public String login(@RequestParam(value="id")String id,@RequestParam(value="password")String password, HttpSession session)throws Exception{
		String res = memberService.userCheck(id,password);
		
		session.setAttribute("userId", res);
		if(res==id) {
			System.out.println("로그인 성공.");
			return "redirect:/boardlist.hs";
		}else {
			System.out.println("로그인 실패");
			return "redirect:/loginform.hs";
		}
	}
	
	@RequestMapping("/logout.hs")
	public String logout(HttpSession session)throws Exception {
		session.invalidate();
		
		return "loginForm";
	}
}
