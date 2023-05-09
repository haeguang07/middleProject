package com.yedam.book.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.book.domain.BookVO;
import com.yedam.book.mapper.BookMapper;
import com.yedam.common.DataSource;

public class BookServiceImpl implements BookService{
	SqlSession session = DataSource.getInstance().openSession(true);
	BookMapper mapper = session.getMapper(BookMapper.class);
	
	@Override
	public boolean insertbook(BookVO vo) {
		return mapper.addbook(vo)==1;
	}

	@Override
	public List<BookVO> booksearch(String category) {
		//05-03 도서검색
		return mapper.searchbook(category);
	}

	@Override
	public int pagetotalCount(String category) {
		//05-03 페이징 
		return mapper.getpageCount(category);
	}
	public List<BookVO> mainRecommandList(String string) {
		return mapper.mainRecommand(string);
	}

	@Override
	public List<BookVO> categoryBookList(int page, String category) {
		return mapper.categoryBookList(page, category);
	}
	@Override
	public List<BookVO> getNewList() {
		return mapper.newList();
	}

	@Override
	public List<BookVO> searchBookList(String bookCategory,String search,int page) {
		return mapper.searchBookList(bookCategory,search ,page);
	}

	@Override
	public int getSearchPageCount(String bookCategory, String search) {
		return mapper.getSearchPageCount(bookCategory, search);
	}

	@Override
	public List<BookVO> getNewBookList() {
		return mapper.getNewBookList();
	}

	@Override
	public List<BookVO> getBestSeller(String monthFirst, String monthLast) {
		return mapper.bestSeller(monthFirst, monthLast);
	}

	@Override
	public List<BookVO> getBestSellerSearchPage(String monthFirst, String monthLast, int page) {
		return mapper.bestSellerSearchPage(monthFirst, monthLast, page);
	}

	@Override
	public BookVO isbnCallBook(long isbn) {
		return mapper.isbnCallOneBook(isbn);
	}

	@Override
	public int getBestCount(String monthFirst, String monthLast) {
		return mapper.bestSellerCount(monthFirst, monthLast);
	}

	@Override
	public List<BookVO> hitCountSearchPageList(String monthFirst , String monthLast,int page) {
		return mapper.hitCountSearchPage(monthFirst,monthLast, page);
	}

	@Override
	public int hitCountCount(String monthFirst , String monthLast) {
		return mapper.hitCountCount(monthFirst, monthLast);
	}

	@Override
	public List<BookVO> getNewBookSearchPage(String monthFirst, String monthLast, int page) {
		return mapper.newBookSearchPage(monthFirst, monthLast, page);
	}

	@Override
	public int newBookCountSearch(String monthFirst, String monthLast) {
		return mapper.newBookCount(monthFirst, monthLast);
	}

}
