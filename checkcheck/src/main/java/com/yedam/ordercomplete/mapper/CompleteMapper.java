package com.yedam.ordercomplete.mapper;

import org.apache.ibatis.annotations.Param;

import com.yedam.book.domain.BookVO;
import com.yedam.history.domain.HistoryVO;
import com.yedam.order.domain.OrderVO;

public interface CompleteMapper {
	public int insertOrder(OrderVO vo);
	
	public int updateBook(BookVO vo);

	public int updateUser(@Param("userPoint") int userPoint,@Param("userId") String userId);
	
	public int deleteCoupon(int couponId);
	
	public int deleteBasket(int basketId);
	
	public BookVO selectbook(String bookName);
	
	public int insertHistory(HistoryVO vo);
}
