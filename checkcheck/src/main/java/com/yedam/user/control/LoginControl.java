package com.yedam.user.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.book.domain.BookVO;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;
import com.yedam.coupon.service.CouponService;
import com.yedam.coupon.service.CouponServiceImpl;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class LoginControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get 방식은 login.jsp
		//post는 로그인 기능, 로그인 정보는 세션에 저장
		Map<String, String> map = new HashMap<>();
		if(req.getMethod().equals("GET")){
			return "WEB-INF/views/user/login.jsp";
			
		}else if(req.getMethod().equals("POST")) {
			UserVO vo = new UserVO();
			vo.setUserId(req.getParameter("id"));
			vo.setUserPw(req.getParameter("pw"));
			UserService service = new UserServiceImpl();
			vo = service.login(vo);
			System.out.println(vo);
			if(vo!=null) {
				HttpSession session = req.getSession();
				BookService bookServ = new BookServiceImpl();
				CouponService se = new CouponServiceImpl();
				int couponCount = se.getCount(vo.getUserId());
				//로그인한 유저 장르 기입해서 상위 조회수 책 리스트 정보 가져오기
				String like = vo.getUserCategory();
				if(like.indexOf(",") != -1) {
					String[] likeArr = like.split(", ");
					int random = (int) (Math.random()*likeArr.length);
					like = likeArr[random];
				}
				System.out.println(like);
				List<BookVO> userList =bookServ.getUserCategoryList(like);
				System.out.println(userList);
				session.setAttribute("sesInfo", vo);
				session.setAttribute("list", userList);
				session.setAttribute("coupon", couponCount);
				map.put("retCode", "Success");
			}else {
				
				map.put("retCode", "Fail");
			}
			
		};
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		
		return json+".json";
		
		
	}

}
