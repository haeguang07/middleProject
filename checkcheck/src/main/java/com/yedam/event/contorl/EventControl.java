package com.yedam.event.contorl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.event.domain.EventVO;
import com.yedam.event.service.EventService;
import com.yedam.event.service.EventServiceImpl;
import com.yedam.user.domain.UserVO;

public class EventControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EventService service = new EventServiceImpl();
		HttpSession session = req.getSession();
		UserVO vo = (UserVO)session.getAttribute("sesInfo");
		List<EventVO> list = service.getEventList(vo.getUserId());
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		
		return json+".json";
	}

}
