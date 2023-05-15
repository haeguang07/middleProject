package com.yedam.event.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.event.domain.EventVO;

public interface EventMapper {
	public List<EventVO> selectEvent(String userId);
	public int insertEvent(@Param("userId") String userId, @Param("eventDate") String eventDate);
	public int eventWeekCount(@Param("weekStart")String weekStart,@Param("weekEnd")String weekEnd,@Param("userId")String userId);
}
