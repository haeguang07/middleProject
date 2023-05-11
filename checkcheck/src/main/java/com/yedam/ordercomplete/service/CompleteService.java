package com.yedam.ordercomplete.service;

import com.yedam.book.domain.BookVO;
import com.yedam.history.domain.HistoryVO;
import com.yedam.order.domain.OrderVO;

public interface CompleteService {
	public boolean insertOrder(OrderVO vo);
	
	public int updateBook(BookVO vo);
	
	public int updateUser(int userPoint, String userId);
	
	public int deleteCoupon(int couponId);
	
	public int deleteBasket(int basketId);
	
	public BookVO selectbook(String bookName);
	
	public boolean insertHistory(HistoryVO vo);
}
