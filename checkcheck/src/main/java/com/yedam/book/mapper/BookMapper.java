package com.yedam.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.book.domain.BookVO;

public interface BookMapper {
	public int addbook(BookVO vo);
	public List<BookVO> mainRecommand(String string);
	
	public List<BookVO> searchbook(String category);
	public int getpageCount(String category);
	public List<BookVO> searchBookList(@Param("page") int page,@Param("bookCategory")String bookCategory);
	public int getpageCount();
	public List<BookVO> newList();
}
