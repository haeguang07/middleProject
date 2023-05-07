package com.yedam.user.mapper;

import java.util.List;

import com.yedam.basket.domain.BasketVO;
import com.yedam.user.domain.UserVO;

public interface UserMapper {
	public UserVO selectUser(UserVO vo);
	public int insertUser(UserVO vo);
}
