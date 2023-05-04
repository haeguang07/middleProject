package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class MypageUserInfoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getMethod().equals("GET")) {
			
			
			return "myPage/passwordCheck.tiles";
			
		}else if(req.getMethod().equals("POST")) {
			
			HttpSession session = req.getSession();
			UserVO vo= (UserVO)session.getAttribute("sesInfo");
			if(vo.getUserPw().equals(req.getParameter("pw"))) {
				return "myPage/modifyInfo.tiles";				
			}else {
				req.setAttribute("result", "false");
				return "myPageUserInfo.do";
			}
		}
		return null;
	}

}
