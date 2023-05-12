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
	@Override
	public List<BoardVO> getAnnouncementPage(int page) {
		return mapper.announcePaging(page);
	}
	@Override
	public int announceTotal() {
		return mapper.board1Count();
	}
	@Override
	public boolean removeAnno(int boardId) {
		return mapper.deleteAnno(boardId)==1;
	}
	@Override
	public BoardVO getOneAnno(int boardId) {
		return mapper.selectBoard1(boardId);
	}
	@Override
	public List<BoardVO> getInquiryList(int page) {
		return mapper.selectBoard2List(page);
	}
	@Override
	public int inquiryTotal() {
		return mapper.borad2ListCount();
	}
	@Override
	public int addAnno(String userId, String boardTitle, String boardSubject) {
		return mapper.insertAnno(userId, boardTitle, boardSubject);
	}

	
	
	

}
