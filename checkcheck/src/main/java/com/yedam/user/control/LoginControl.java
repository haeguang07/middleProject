package com.yedam.user.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.book.domain.BookVO;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class LoginControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get 방식은 login.jsp
		//post는 로그인 기능, 로그인 정보는 세션에 저장
		if(req.getMethod().equals("GET")){
			return "WEB-INF/views/user/login.jsp";
			
		}else if(req.getMethod().equals("POST")) {
			UserVO vo = new UserVO();
			vo.setUserId(req.getParameter("id"));
			vo.setUserPw(req.getParameter("pw"));
			UserService service = new UserServiceImpl();
			vo = service.login(vo);
			if(vo!=null) {
				HttpSession session = req.getSession();
				BookService bookServ = new BookServiceImpl();
				//로그인한 유저 장르 기입해서 상위 조회수 책 리스트 정보 가져오기
				String like = "%>"+vo.getUserCategory()+"%";
				List<BookVO> list = bookServ.mainRecommandList(like);
				session.setAttribute("sesInfo", vo);
				req.setAttribute("list", list);
				
				return "main.do";
			}else {
				return "{'reqCode':'fail'}.json";
			}
			
		};
		
		
		return null;
	}

}