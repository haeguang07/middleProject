package com.yedam.user.service;

import java.util.List;

import com.yedam.user.domain.UserVO;

public interface UserService {
	public UserVO login(UserVO vo);
	public boolean createUser(UserVO vo);
	public boolean modifyNick(String nickname, String userId);
	public boolean modifyAdr(String adr, int post,String userId);
	public boolean modifyPw(String pw, String userId);
	public UserVO checkUid(String userId);
	public UserVO checkNick(String nickname);
	public List<UserVO> userList();
	public List<UserVO> getGenderPayment(int year);
	public List<UserVO> getGenderCategoryRate(String gender);
	public List<UserVO> getCategoryTop5();
	public List<UserVO> getAgePayment(String birth,String birth10);
	public List<UserVO> getAgePayment60(String birth60);
}
