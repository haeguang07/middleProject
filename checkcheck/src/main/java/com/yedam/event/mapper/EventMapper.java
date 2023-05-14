package com.yedam.event.mapper;

import java.util.List;

import com.yedam.event.domain.EventVO;

public interface EventMapper {
	public List<EventVO> selectEvent(String userId);

}
