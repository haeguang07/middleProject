package com.yedam.user.service;

import java.util.List;

import com.yedam.basket.domain.BasketVO;
import com.yedam.user.domain.UserVO;

public interface UserService {
	public UserVO login(UserVO vo);
	public boolean createUser(UserVO vo);
}
