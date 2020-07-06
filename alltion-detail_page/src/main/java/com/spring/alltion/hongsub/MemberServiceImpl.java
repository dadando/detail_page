package com.spring.alltion.hongsub;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MemberMapper;

@Service
public class MemberServiceImpl {

	@Autowired
	private SqlSession sqlSession;
	
	public String userCheck(String id, String password) {
		String dbpass="";
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		dbpass = memberMapper.checkPassword(id);
		if(dbpass!=null) {
			if(dbpass.equals(password)) {
				return id;
			}else {
				return null;
			}
		}else {
			return null;
		}
	}

	public MemberVO getMemberInfo(String product_id) {
		MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO mvo = membermapper.getInfo(product_id);
		
		return mvo;
	}

}
