package com.yedam.book.service;

import java.util.List;

import com.yedam.book.domain.BookVO;

public interface BookService {
	public boolean insertbook(BookVO vo);
	public List<BookVO> mainRecommandList(String string);
}
