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
		// TODO Auto-generated method stub
		 return mapper.selectUser(vo);
	}


	@Override
	public boolean createUser(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertUser(vo)==1;
	}
	
	

}
