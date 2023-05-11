package com.yedam.user.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class NickCheckControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nick= req.getParameter("nick");
		UserService service = new UserServiceImpl();
		UserVO vo = service.checkNick(nick);
		Map<String, String> map = new HashMap<>();
		if(vo!=null) {
			map.put("retCode", "Fail");
		}else {
			map.put("retCode", "Success");
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json+".json";
	}

}
