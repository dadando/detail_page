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
	private CommentServiceImpl commentService;
	
	@Autowired
	private BidServiceImpl bidService;
	
	@RequestMapping("/boardlist.hs")
	public String boardlist(HttpServletRequest request,Model model)throws Exception {
		boardService.getBoardList(request,model);
		
		return "board/board_list";
	}
	
	@RequestMapping("/boarddetail.hs")
	public String boardDetail(@RequestParam(value="product_number")int product_number,Model model) {
		// 상품번호를 통해서 상품 상세 정보를 얻는다.
		BoardVO bvo = boardService.getDetail(product_number);
		model.addAttribute("bvo",bvo);
		
		// 응찰 리스트 갯수를 얻는다.
		int bid_listcount = bidService.getBid_listcountService(product_number);
		model.addAttribute("bid_listcount",bid_listcount);
		
		// 상품 번호와 응찰리스트 페이지 수를 얻어서 응찰 리스트 페이징을 한다.
		int bno = product_number;
		int bid_page = (int)(double)(bid_listcount/10+0.9);
		bidService.bidListService(bno, bid_page, model);
		
		// 댓글 리스트 갯수를 얻는다.
		int comment_listcount = commentService.getCount_comment(product_number)-1;
		model.addAttribute("comment_listcount",comment_listcount);
		
		// 상품 번호와 응찰리스트 페이지 수를 얻어서 응찰 리스트 페이징을 한다.
		int comment_product_number = product_number;
		int comment_page = (int)(double)(comment_listcount/10+0.9);
		commentService.commentListService(comment_product_number, comment_page, model);
		
		return "board/board_detail";
	}
}
