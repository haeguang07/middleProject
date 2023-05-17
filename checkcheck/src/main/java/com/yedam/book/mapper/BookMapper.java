package com.yedam.book.mapper;

import java.util.Date;
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
	public List<BookVO> bestSeller(@Param("monthFirst")Date monthFirst, @Param("monthLast")Date monthLast);
	public List<BookVO> bestSellerSearchPage(@Param("monthFirst")Date monthFirst, @Param("monthLast")Date monthLast,@Param("page")int page);
	public BookVO isbnCallOneBook(@Param("isbn")long isbn);
	public int bestSellerCount(@Param("monthFirst")Date monthFirst, @Param("monthLast")Date monthLast);
	public List<BookVO> hitCountSearchPage(@Param("monthFirst")String monthFirst,@Param("monthLast")String monthLast,@Param("page")int page);
	public int hitCountCount(@Param("monthFirst")String monthFirst,@Param("monthLast")String monthLast);
	public List<BookVO> newBookSearchPage(@Param("monthFirst")Date monthFirst,@Param("monthLast")Date monthLast,@Param("page")int page);
	public int newBookCount(@Param("monthFirst")Date monthFirst,@Param("monthLast")Date monthLast);
	public BookVO selectBookSearch(long isbn);
	public List<BookVO> bookStockList(int page);
	public int stockTotal();
	public int updateStock(@Param("isbn")long isbn , @Param("booknum")int booknum);
	public List<BookVO> userCategoryList(String userCategory);
	public List<String> buycheck(long isbn);
	public int plusHitCount(long isbn);
	
}
