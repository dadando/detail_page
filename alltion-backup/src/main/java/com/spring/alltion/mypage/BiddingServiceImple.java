package com.spring.alltion.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BiddingServiceImple {
	
	@Autowired
	private SqlSession sqlSession;
}
