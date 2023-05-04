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
		// TODO Auto-generated method stub
		return mapper.selectOrderUserId(userId, page);
	}
	@Override
	public List<OrderVO> OrderSearch(String orderId) {
		// TODO Auto-generated method stub
		return mapper.selectOrderOrderId(orderId);
	}
	@Override
	public int gettotal(String userId) {
		
		return mapper.getCount(userId);
	}
	
	

}
