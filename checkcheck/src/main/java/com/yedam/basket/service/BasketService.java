package com.yedam.basket.service;

import java.util.List;

import com.yedam.basket.domain.BasketVO;

public interface BasketService {
	public List<BasketVO> selectBasket(String userId);
}
