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
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class MypageUserInfoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getMethod().equals("GET")) {
			
			
			return "myPage/passwordCheck.tiles";
			
		}else if(req.getMethod().equals("POST")) {
			String json = "";
			Map<String, Object> map = new HashMap<>();
			HttpSession session = req.getSession();
			UserVO vo= (UserVO)session.getAttribute("sesInfo");
			if(vo.getUserPw().equals(req.getParameter("pw"))) {
				map.put("retCode", "Success");				
			}else {
				map.put("retCode", "Fail");
			}
			Gson gson = new GsonBuilder().create();
			json = gson.toJson(map);
			return json + ".json";
		}
		return "main.do";
	}

}
