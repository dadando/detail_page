package com.spring.alltion.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BiddingController {
	
	@Autowired
	private BiddingServiceImple biddingService;
	
	@RequestMapping("/bidding.hs")
	public String bidding_page(Model model)throws Exception{
		
		return "mypage/bidding";
	}
}
