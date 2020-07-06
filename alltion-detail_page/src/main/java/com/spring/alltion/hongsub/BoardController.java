package com.spring.alltion.hongsub;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	
	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@RequestMapping("/boardlist.hs")
	public String boardlist(HttpServletRequest request,Model model)throws Exception {
		boardService.getBoardList(request,model);
		
		return "board/board_list";
	}
	
	@RequestMapping("/boarddetail.hs")
	public String boardDetail(@RequestParam(value="product_number")int product_number,Model model) {
		BoardVO bvo = boardService.getDetail(product_number);
		model.addAttribute("bvo",bvo);
		MemberVO mvo = memberService.getMemberInfo(bvo.getProduct_id());
		model.addAttribute("mvo",mvo);
		int count_comment_list = commentService.getCount_comment(product_number);
		model.addAttribute("count_comment_list",count_comment_list-1);
		
		return "board/board_detail";
	}
}
