package com.yedam.board.service;

import java.util.List;

import com.yedam.board.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> getInquiryList(String userId, int page);
	public List<BoardVO> getInquiryList(int page);
	public boolean addInquiry(String userId, String boardTitle, String boardSubject);
	public int inquiryTotal(String userId);
	public int inquiryTotal();
	public List<BoardVO> getAnnouncementPage(int page);
	public int announceTotal();
	public boolean removeAnno(int boardId);
	public BoardVO getOneAnno(int boardId);
	public int addAnno(String userId ,int boardKind, String boardTitle , String boardSubject);
	public List<BoardVO> getBoard3List();
	public List<BoardVO> getInquiryNList(int page);
	public int inquiryNTotal();
	
}
