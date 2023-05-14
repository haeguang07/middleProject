package com.yedam.event.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.event.domain.EventVO;
import com.yedam.event.mapper.EventMapper;

public class EventServiceImpl implements EventService {
	SqlSession session = DataSource.getInstance().openSession(true);
	EventMapper mapper = session.getMapper(EventMapper.class);
	
	@Override
	public List<EventVO> getEventList(String userId) {
		return mapper.selectEvent(userId);
	}

}
