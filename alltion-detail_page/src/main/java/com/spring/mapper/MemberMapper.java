package com.spring.mapper;

import com.spring.alltion.hongsub.MemberVO;

public interface MemberMapper {

	String checkPassword(String id);

	MemberVO getInfo(String product_id);

}
