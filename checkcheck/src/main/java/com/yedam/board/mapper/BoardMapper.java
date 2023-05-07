package com.yedam.board.mapper;

import java.util.List;

import com.yedam.board.domain.BoardVO;

public interface BoardMapper {
	public List<BoardVO> searchBoard2(String userId);
}
