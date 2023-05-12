package com.yedam.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.user.domain.UserVO;

public interface UserMapper {
	public UserVO selectUser(UserVO vo);
	public int insertUser(UserVO vo);
	public int nickUpdate(@Param("nickname")String nickname,@Param("userId")String userid);
	public int adrUpdate(@Param("address")String address,@Param("post")int post,@Param("userId")String userid);
	public int pwUpdate(@Param("pw")String pw,@Param("userId")String userid);
	public UserVO selectUserId(String userId);
	public UserVO selectNickname(String nickname);
	public List<UserVO> selectUserList();
	public List<UserVO> selectGenderPayment(int year);
	public List<UserVO> selectGendercategory(String gender);
	public List<UserVO> selectCategoryTop5();

}
