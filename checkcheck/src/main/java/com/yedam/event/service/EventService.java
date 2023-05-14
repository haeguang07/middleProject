package com.yedam.event.service;

import java.util.List;

import com.yedam.event.domain.EventVO;

public interface EventService {
	public List<EventVO> getEventList(String userId);
}
