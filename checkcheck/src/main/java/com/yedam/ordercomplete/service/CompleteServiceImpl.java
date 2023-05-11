package com.yedam.ordercomplete.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.book.domain.BookVO;
import com.yedam.common.DataSource;
import com.yedam.history.domain.HistoryVO;
import com.yedam.order.domain.OrderVO;
import com.yedam.ordercomplete.mapper.CompleteMapper;
import com.yedam.user.domain.UserVO;

public class CompleteServiceImpl implements CompleteService{
	SqlSession session = DataSource.getInstance().openSession(true);
	CompleteMapper mapper = session.getMapper(CompleteMapper.class);
	
	@Override
	public boolean insertOrder(OrderVO vo) {
		return mapper.insertOrder(vo)==1;
	}

	@Override
	public int updateBook(BookVO vo) {
		return mapper.updateBook(vo);
	}

	@Override
	public int updateUser(int userPoint, String userId) {
		return mapper.updateUser(userPoint,userId);
	}

	@Override
	public int deleteCoupon(int couponId) {
		return mapper.deleteCoupon(couponId);
	}

	@Override
	public int deleteBasket(int basketId) {
		return mapper.deleteBasket(basketId);
	}

	@Override
	public BookVO selectbook(String bookName) {
		return mapper.selectbook(bookName);
	}

	@Override
	public boolean insertHistory(HistoryVO vo) {
		return mapper.insertHistory(vo)==1;
	}

}
