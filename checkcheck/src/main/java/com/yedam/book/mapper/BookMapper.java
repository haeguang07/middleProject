package com.yedam.book.mapper;

import java.util.List;

import com.yedam.book.domain.BookVO;

public interface BookMapper {
	public int addbook(BookVO vo);
	
	public List<BookVO> searchbook(String category);
	public int getpageCount();
}
