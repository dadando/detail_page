package com.spring.alltion.hongsub;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.mapper.BidMapper;
import com.spring.mapper.BoardMapper;

@Service
public class BidServiceImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	//응찰 리스트 구하는 서비스.
	public List<BidVO> bidListService(int bno, int page,Model model) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		
		int bid_page = 1; // 응찰리스트 첫 페이지 = 1
		int bid_limit = 10; //한 페이지에 뿌려줄 응찰 리스트 갯수
		if(page!=0) {
			bid_page = page;
		}
		int bid_listcount = 0;
		bid_listcount = bidmapper.countBidList(bno)-1; // 상품번호에 대한 응찰리스트 갯수
		int bid_endrow = bid_listcount - (page-1)*10;  // 읽을 마지막 응찰리스트 마지막 row번호
		int bid_startrow = bid_endrow - bid_limit + 1; // 읽기 시작할 응찰리스트 시작할 row번호
		
		int bid_maxpage = (int)((double)bid_listcount/bid_limit+0.9); // 총 페이지 수
		int bid_startpage = (((int)((double)bid_page / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지 시작 페이지수
		int bid_endpage = bid_maxpage; // 마지막 페이지 수
		if (bid_endpage > bid_startpage+10-1) {
			bid_endpage = bid_startpage + 10 - 1;
		}
		model.addAttribute("bid_page",bid_page);
		model.addAttribute("bid_maxpage",bid_maxpage);
		model.addAttribute("bid_startpage",bid_startpage);
		model.addAttribute("bid_endpage",bid_endpage);
		model.addAttribute("bid_listcount",bid_listcount);
		
		return bidmapper.bidList(bno,bid_startrow,bid_endrow);
	}

	//응찰 하기 서비스.
	public int bidInsertService(BidVO bidvo) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		BoardMapper boardmapper = sqlSession.getMapper(BoardMapper.class);
		int bid_product_number = bidvo.getBid_product_number();
		int price = 0;
		String product_top_bidder = " ";
		System.out.println("bid_product_number = "+bid_product_number);
		//응찰리스트의 수를 구함 =>응찰리스트 순서 정렬용.
		int res = bidmapper.countBidList(bid_product_number);
		bidvo.setBid_no(res);
		
		if(res==1) {
			//첫 응찰시 현재가로 바로 응찰.
			price = boardmapper.selectNowPrice(bid_product_number);
			bidvo.setBid_price(price);
		}else {
			//응찰하기 클릭시 +1000원된 가격으로 응찰이 된다.
			//두번째 응찰부터
			price = bidmapper.selectNowPrice(bid_product_number);
			price +=1000;
			bidvo.setBid_price(price); 
		}
		//상세보기의 현재가 갱신
		product_top_bidder = bidvo.getBid_id();
		System.out.println("product_top_bidder = "+product_top_bidder);
		boardmapper.updateBoard(price,bid_product_number,product_top_bidder);
		
		return bidmapper.bidInsert(bidvo);
	}

	//즉시 구매하기 서비스.
	public int bidpurchaseService(BidVO bidvo) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		BoardMapper boardmapper = sqlSession.getMapper(BoardMapper.class);
		int bid_product_number = bidvo.getBid_product_number();
		int price = 0;
		price = boardmapper.selectPurchasePrice(bid_product_number);
		
		int res = bidmapper.countBidList(bid_product_number);
		bidvo.setBid_no(res);
		bidvo.setBid_price(price);
		String product_top_bidder = bidvo.getBid_id();
		boardmapper.updateBoard(price, bid_product_number,product_top_bidder);
		
		return bidmapper.bidInsert(bidvo);
	}

	//응찰 리스트 갯수
	public int getBid_listcountService(int product_number) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		int bno = product_number;
		int bid_listcount = 0;
		bid_listcount = bidmapper.countBidList(bno)-1; 
		
		return bid_listcount;
	}

}
