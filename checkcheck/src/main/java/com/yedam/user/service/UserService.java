package com.yedam.user.service;

import com.yedam.user.domain.UserVO;

public interface UserService {
	public UserVO login(UserVO vo);
	public boolean createUser(UserVO vo);
	public boolean modifyNick(String nickname, String userId);
	public boolean modifyAdr(String adr, int post,String userId);
	public boolean modifyPw(String pw, String userId);
}
