package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.hongsub.BoardVO;

public interface BoardMapper {

	ArrayList<BoardVO> getBoardList();

	BoardVO getDetail(int product_number);

	int selectNowPrice(int bid_product_number);

	void updateBoard(@Param("price")int price,@Param(value="bid_product_number") int bid_product_number,@Param(value="product_top_bidder")String product_top_bidder);

	int selectPurchasePrice(int bid_product_number);

}
