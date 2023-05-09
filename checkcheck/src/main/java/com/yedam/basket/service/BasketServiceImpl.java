package com.yedam.basket.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.basket.domain.BasketVO;
import com.yedam.basket.mapper.BasketMapper;
import com.yedam.common.DataSource;

public class BasketServiceImpl implements BasketService{
	SqlSession session = DataSource.getInstance().openSession(true);
	BasketMapper mapper = session.getMapper(BasketMapper.class);
	
	@Override
	public List<BasketVO> selectBasket(String userId) {
		return mapper.selectBasket(userId);
	}

	@Override
	public boolean addBasket(BasketVO vo) {
		return mapper.insertBasket(vo)==1;
	}

}
