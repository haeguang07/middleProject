package com.yedam.order.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.order.domain.OrderVO;
import com.yedam.order.mapper.OrderMapper;

public class OrderServiceImpl implements OrderService {
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);
	
	@Override
	public List<OrderVO> OrderList(String userId,int page) {
		return mapper.selectOrderUserId(userId, page);
	}
	@Override
	public List<OrderVO> OrderSearch(String orderId) {
		return mapper.selectOrderOrderId(orderId);
	}
	@Override
	public int getTotal(String userId) {
		return mapper.getCount(userId);
	}
	@Override
	public int getCancelTotal(String userId) {
		return mapper.getCancleCount(userId);
	}
	@Override
	public int getPresentTotal(String userId) {
		return mapper.getPresentCount(userId);
	}
	@Override
	public boolean orderCancel(String orderId) {
		return mapper.cancelUpdate(orderId)==1;
	}
	@Override
	public boolean orderChange(OrderVO vo) {
		return mapper.adrUpdate(vo)==1;
	}
	@Override
	public List<OrderVO> OrderCancelList(String userId, int page) {
		return mapper.selectOrderCancel(userId, page);
	}
	@Override
	public List<OrderVO> OrderPresentList(String userId, int page) {
		return mapper.selectOrderPresent(userId, page);
	}
	
	

}
