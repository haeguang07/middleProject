package com.yedam.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.order.domain.OrderVO;

public interface OrderMapper {
	public List<OrderVO> selectOrderUserId(@Param("userId") String userId,@Param("page") int page );
	public List<OrderVO> SelectOrderOrderId(String orderId);
	
	//마이페이지 유저의 주문총갯수(10개씩)
	public int getCount(String userId);
}
