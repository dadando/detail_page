package com.spring.alltion.hongsub;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BidMapper;
import com.spring.mapper.BoardMapper;

@Service
public class BidServiceImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	//응찰 리스트 구하는 서비스.
	public List<BidVO> bidListService(int bno) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		
		return bidmapper.bidList(bno);
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

}
