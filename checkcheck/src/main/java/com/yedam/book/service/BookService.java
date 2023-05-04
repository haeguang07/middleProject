package com.yedam.book.service;

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
	public List<BookVO> getNewList();
	public List<BookVO> searchBookList(String bookCategory,String search,int page);
	public int getSearchPageCount(String bookCategory,String search);
}
