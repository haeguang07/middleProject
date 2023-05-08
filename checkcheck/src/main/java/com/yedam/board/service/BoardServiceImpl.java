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
	public List<BoardVO> getInquiryList(String userId) {
		return mapper.searchBoard2(userId);
	}
	@Override
	public boolean addInquiry(String userId, String boardTitle, String boardSubject, String boardFile) {
		return mapper.insertBoard2(userId, boardTitle, boardSubject, boardFile)==1;
	}

	
	
	

}
