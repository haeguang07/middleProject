package com.yedam.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.yedam.user.domain.UserVO;

public interface UserMapper {
	public UserVO selectUser(UserVO vo);
	public int insertUser(UserVO vo);
	public int nickUpdate(@Param("nickname")String nickname,@Param("userId")String userid);
	public int adrUpdate(@Param("address")String address,@Param("post")int post,@Param("userId")String userid);
	public int pwUpdate(@Param("pw")String pw,@Param("userId")String userid);

}
