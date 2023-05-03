package com.yedam.user.service;

import com.yedam.user.domain.UserVO;

public interface UserService {
	public UserVO login(UserVO vo);
	public boolean createUser(UserVO vo);
}
