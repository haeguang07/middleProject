package com.yedam.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.board.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> searchBoard2(@Param("userId")String userId,@Param("page") int page);
	public List<BoardVO> selectBoard2List(int page);
	public int insertBoard2(@Param("userId")String userId,@Param("boardTitle")String boardTitle,@Param("boardSubject")String boardSubject,@Param("boardFile")String boardFile);
	//문의 게시판의 갯수
	public int borad2Count(String userId);
	public int borad2ListCount();
	
	public List<BoardVO> announcePaging(int page);
	public int board1Count();
	public int deleteAnno(int boardId);
	public BoardVO selectBoard1(int boardId);
}
