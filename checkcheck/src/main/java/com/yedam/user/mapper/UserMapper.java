package com.yedam.user.mapper;

import com.yedam.user.domain.UserVO;

public interface UserMapper {
	public UserVO selectUser(UserVO vo);
	public int insertUser(UserVO vo);
}
