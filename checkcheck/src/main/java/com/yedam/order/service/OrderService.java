package com.yedam.order.service;

import java.util.List;

import com.yedam.order.domain.OrderVO;

public interface OrderService {
	public List<OrderVO> OrderList(String userId,int page);
	public List<OrderVO> OrderCancelList(String userId,int page);
	public List<OrderVO> OrderPresentList(String userId,int page);
	public List<OrderVO> OrderSearch(String orderId);
	public int getTotal(String userId);
	public int getCancelTotal(String userId);
	public int getPresentTotal(String userId);
	
	public boolean orderCancel(String orderId);
	public boolean orderChange(OrderVO vo);
	public List<OrderVO> getChulgoList(int page);
	public int chulgoTotal();
	public List<String> getSubject(String orderId);
	public int modifyOrderState(long orderIdList);
}
