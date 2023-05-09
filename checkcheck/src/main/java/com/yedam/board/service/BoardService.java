package com.yedam.board.service;

import java.util.List;

import com.yedam.board.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> getInquiryList(String userId, int page);
	public boolean addInquiry(String userId, String boardTitle, String boardSubject,String boardFile);
	public int inquiryTotal(String userId);
	public List<BoardVO> getAnnouncementPage(int page);
	public int announceTotal();
	public boolean removeAnno(int boardId);
}
