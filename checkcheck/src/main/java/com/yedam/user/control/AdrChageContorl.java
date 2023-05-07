package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class AdrChageContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO vo= (UserVO)session.getAttribute("sesInfo");
		String userId= vo.getUserId();
		String adr = req.getParameter("adr");
		int post = Integer.parseInt(req.getParameter("post"));
		
		UserService service= new UserServiceImpl();
		if(service.modifyAdr(adr, post, userId)) {
			vo= service.login(vo);
			session.setAttribute("sesInfo", vo);
			String json="{'reqCode':'Success'}";
			Gson gson = new GsonBuilder().create();
			json += gson.toJson(vo);
			return  json+".json";
		}else {
			return  "{'reqCode':'Fail'}.json";
		}
	}

}
