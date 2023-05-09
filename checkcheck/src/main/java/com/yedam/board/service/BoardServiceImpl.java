package com.yedam.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.board.domain.BoardVO;
import com.yedam.board.mapper.BoardMapper;
import com.yedam.common.DataSource;

public class BoardServiceImpl implements BoardService {
	SqlSession session = DataSource.getInstance().openSession(true);
	BoardMapper mapper = session.getMapper(BoardMapper.class);
	@Override
	public List<BoardVO> getInquiryList(String userId, int page) {
		return mapper.searchBoard2(userId,page);
	}
	@Override
	public boolean addInquiry(String userId, String boardTitle, String boardSubject, String boardFile) {
		return mapper.insertBoard2(userId, boardTitle, boardSubject, boardFile)==1;
	}
	@Override
	public int inquiryTotal(String userId) {
		return mapper.borad2Count(userId);
	}

	
	
	

}
