package com.yedam.user.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class AdrChageContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO vo = (UserVO) session.getAttribute("sesInfo");
		String userId = vo.getUserId();
		String adr = req.getParameter("adr");
		int post = Integer.parseInt(req.getParameter("post"));
		Map<String, Object> map = new HashMap<>();
		UserService service = new UserServiceImpl();
		String json = "";
		if (service.modifyAdr(adr, post, userId)) {
			vo = service.login(vo);
			session.setAttribute("sesInfo", vo);
			map.put("retCode", "Success");
			map.put("data", vo);
		} else {
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		return json + ".json";
	}

}
