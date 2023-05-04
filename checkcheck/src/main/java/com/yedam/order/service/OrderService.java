package com.yedam.order.service;

import java.util.List;

import com.yedam.order.domain.OrderVO;

public interface OrderService {
	public List<OrderVO> OrderList(String userId,int page);
	public List<OrderVO> OrderSearch(String orderId);
	public int gettotal(String userId);
}
