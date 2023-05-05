package com.yedam.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.book.domain.BookVO;

public interface BookMapper {
	public int addbook(BookVO vo);
	public List<BookVO> mainRecommand(String string);
	
	public List<BookVO> searchbook(String category);
	public int getpageCount(String category);
	public List<BookVO> categoryBookList(@Param("page") int page,@Param("bookCategory")String bookCategory);
	public List<BookVO> newList();
	public List<BookVO> searchBookList(@Param("bookCategory") String bookCategory,@Param("search")String search,@Param("page")int page);
	public int getSearchPageCount(@Param("bookCategory")String bookCategory ,@Param("search")String search);
	public List<BookVO> getNewBookList();
	public List<BookVO> bestSeller(@Param("monthFirst")String monthFirst, @Param("monthLast")String monthLast);
	public List<BookVO> bestSellerSearchPage(@Param("monthFirst")String monthFirst, @Param("monthLast")String monthLast,@Param("page")int page);
}
