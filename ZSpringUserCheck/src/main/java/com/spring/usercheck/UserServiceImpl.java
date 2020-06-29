package com.spring.usercheck;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.UserMapper;

@Service
public class UserServiceImpl {

	@Autowired
	private SqlSession sqlSession;
	
	public int usercheckService(String id) {
		UserMapper usermapper = sqlSession.getMapper(UserMapper.class);
		
		return usermapper.usercheck(id);
		
	}

}
