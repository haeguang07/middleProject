package com.yedam.basket.mapper;

import java.util.List;

import com.yedam.basket.domain.BasketVO;

public interface BasketMapper {
	public List<BasketVO> selectBasket(String userId);
}
