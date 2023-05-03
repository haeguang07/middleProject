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
	public List<BookVO> mainRecommandList() {
		return mapper.mainRecommand();
	}

}
