package com.yedam.board.service;

import java.util.List;

import com.yedam.board.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> getInquiryList(String userId);
	public boolean addInquiry(String userId, String boardTitle, String boardSubject,String boardFile);
}
