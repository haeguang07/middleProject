package com.yedam.user.service;

import org.apache.ibatis.session.SqlSession;

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
	
	

}
