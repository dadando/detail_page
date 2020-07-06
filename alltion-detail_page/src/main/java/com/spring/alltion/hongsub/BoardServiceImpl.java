package com.spring.alltion.hongsub;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl {

	@Autowired
	private SqlSession sqlSession;
	
	public void getBoardList(HttpServletRequest request, Model model) {
		ArrayList<BoardVO> boardlist = new ArrayList<BoardVO>();
		BoardMapper boardmapper = sqlSession.getMapper(BoardMapper.class);
		boardlist = boardmapper.getBoardList();
		model.addAttribute("boardlist",boardlist);
		
	}

	public BoardVO getDetail(int product_number) {
		BoardMapper boardmapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO bvo = boardmapper.getDetail(product_number);
		
		return bvo;
	}

}
