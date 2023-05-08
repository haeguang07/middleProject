package com.yedam.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.board.domain.BoardVO;

public interface BoardMapper {
	public List<BoardVO> searchBoard2(String userId);
	public int insertBoard2(@Param("userId")String userId,@Param("boardTitle")String boardTitle,@Param("boardSubject")String boardSubject,@Param("boardFile")String boardFile);
}
