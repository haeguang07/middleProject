package com.yedam.book.service;

import java.util.Date;
import java.util.List;

import com.yedam.book.domain.BookVO;

public interface BookService {
	//관리자 도서 추가
	public boolean insertbook(BookVO vo);
	//사용자 도서검색
	public List<BookVO> booksearch(String category);
	//페이징
	public int pagetotalCount(String category);
	public List<BookVO> mainRecommandList(String string);
	public List<BookVO> categoryBookList(int page, String category);
	public List<BookVO> getNewList();//메인페이지의 조회수 많은 순 리스트
	public List<BookVO> searchBookList(String bookCategory,String search,int page);
	public int getSearchPageCount(String bookCategory,String search);
	public List<BookVO> getNewBookList();//메인페이지에 나올 신간책리스트
	public List<BookVO> getBestSeller(Date monthFirst , Date monthLast);//mainpage 에서 사용하는 이번 달의 베스트 셀러 리스트
	public List<BookVO> getBestSellerSearchPage(Date monthFirst , Date monthLast,int page);
	public BookVO isbnCallBook(long isbn);
	public int getBestCount(Date monthFirst,Date monthLast);
	public List<BookVO> hitCountSearchPageList(String monthFirst , String monthLast,int page);
	public int hitCountCount(String monthFirst , String monthLast);
	public List<BookVO> getNewBookSearchPage(Date monthFirst , Date monthLast , int page);
	public int newBookCountSearch(Date monthFirst,Date monthLast);
	public BookVO selectBookSearch(long isbn);
	public List<BookVO>	bookStockPage(int page);
	public int getStockTotal();
	public boolean modifyStock(long isbn,int booknum);
	public List<BookVO> getUserCategoryList(String userCategory);
	public List<String> getBuyCheck(long isbn);
	public int plusHitCount(long isbn);
}
