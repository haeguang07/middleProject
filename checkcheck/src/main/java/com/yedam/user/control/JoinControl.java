package com.yedam.user.control;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class JoinControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserVO vo = new UserVO();
		vo.setUserId(req.getParameter("joinId"));
		vo.setUserPw(req.getParameter("joinPw"));
		vo.setUserPost(Integer.parseInt(req.getParameter("joinPost")));
		vo.setUserAddress(req.getParameter("joinAdr")+" "+req.getParameter("joinAdr2"));
		vo.setUserGender(req.getParameter("gender"));
		vo.setUserPhone(req.getParameter("joinPhone"));
		vo.setEmail(req.getParameter("joinEmail"));
		vo.setNickname(req.getParameter("nickname"));
		
		vo.setUserBirth(req.getParameter("birth"));
		vo.setUserName(req.getParameter("joinName"));
		vo.setUserCategory((Arrays.toString(req.getParameterValues("check1"))).replaceAll("\\[","").replaceAll("\\]",""));
		
		UserService service =new UserServiceImpl();
		boolean result = service.createUser(vo);
		
		if(result) {
			return "main.do";
			
		}else {
			req.setAttribute("result", "Fail");
			return "joinForm.do";
		}
		
		
	}

}
