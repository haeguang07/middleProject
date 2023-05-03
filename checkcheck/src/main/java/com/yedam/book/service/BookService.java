package com.yedam.book.service;

import java.util.List;

import com.yedam.book.domain.BookVO;

public interface BookService {
	//관리자 도서 추가
	public boolean insertbook(BookVO vo);
	//사용자 도서검색
	public List<BookVO> booksearch(String category);
	//페이징
	public int pagetotalCount();
	public List<BookVO> mainRecommandList(String string);
}
