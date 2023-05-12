package com.yedam.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.basket.domain.BasketVO;
import com.yedam.common.DataSource;
import com.yedam.user.domain.UserVO;
import com.yedam.user.mapper.UserMapper;

public class UserServiceImpl implements UserService {
	SqlSession session = DataSource.getInstance().openSession(true);
	UserMapper mapper = session.getMapper(UserMapper.class);
	
	
	@Override
	public UserVO login(UserVO vo) {
		 return mapper.selectUser(vo);
	}


	@Override
	public boolean createUser(UserVO vo) {
		return mapper.insertUser(vo)==1;
	}


	@Override
	public boolean modifyNick(String nickname, String userId) {
		return mapper.nickUpdate(nickname, userId)==1;
	}


	@Override
	public boolean modifyAdr(String adr, int post, String userId) {
		return mapper.adrUpdate(adr, post, userId)==1;
	}


	@Override
	public boolean modifyPw(String pw, String userId) {
		return mapper.pwUpdate(pw, userId)==1;
	}


	@Override
	public UserVO checkUid(String userId) {
		return mapper.selectUserId(userId);
	}


	@Override
	public UserVO checkNick(String nickname) {
		return mapper.selectNickname(nickname);
	}


	@Override
	public List<UserVO> userList() {
		return mapper.selectUserList();
	}


	@Override
	public List<UserVO> getGenderPayment(int year) {
		return mapper.selectGenderPayment(year);
	}
	@Override
	public List<UserVO> getGenderCategoryRate(String gender) {
		return mapper.selectGendercategory(gender);
	}
	@Override
	public List<UserVO> getCategoryTop5() {
		return mapper.selectCategoryTop5();
	}

}
