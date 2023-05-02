package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.yedam.common.Control;

import com.yedam.user.control.joinControl;

import com.yedam.user.control.BasketControl;
import com.yedam.user.control.DeliveryControl;
import com.yedam.user.control.WaitPaymentControl;
import com.yedam.user.control.loginControl;
import com.yedam.user.control.myPageOrderControl;
import com.yedam.user.control.MypageUserInfoControl;

public class FrontController extends HttpServlet{
	private Map<String, Control> map;
	String encoding;
	public FrontController() {
		map = new HashMap<>();
	}
	@Override
	public void init(ServletConfig config) throws ServletException{
		encoding = config.getInitParameter("enc");
		map.put("/main.do", new mainControl());
		//관리자 재고관리 기능
		map.put("/bookStock.do",new BookStockControl());
		//검색 기능
		map.put("/search.do", new SearchPageControl());
		//상세페이지 기능
		map.put("/getBook.do", new GetBookControl());
		//로그인 기능(get:화면으로, post:로그인 기능)
		map.put("/login.do", new loginControl());
		//05-02 장바구니페이지 김영환 - css더 다듬어야함 기능넣어야함
		map.put("/basket.do", new BasketControl());
		//05-02 배송정보페이지 김영환 - css더 다듬어야함 기능넣어야됨
		map.put("/delivery.do", new DeliveryControl());
		//05-02 결제페이지 김영환 - 둘다해야됨
		map.put("/waitpayment.do", new WaitPaymentControl());
		
		map.put("/login.do", new loginControl());
		//05-02회원가입 기능(get:화면1, post:화면2)
		map.put("/joinForm.do", new joinControl());
		//05-02로그인 기능
		map.put("/join.do", new joinControl());
		//05-02마이페이지 이동(주문 조회로)
		map.put("/myPageMain.do", new myPageOrderControl());
		//05-02개인정보수정(get:화면1(비밀번호입력), post:화면2(수정페이지))
		map.put("/myPageUserInfo.do", new MypageUserInfoControl() );

		//05-02 장바구니페이지
		map.put("/basket.do", new BasketControl());
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());
		System.out.println(path);
		
		//페이지 정보 받는곳
		Control control = map.get(path);
		String viewPage = control.execute(req, resp);
		System.out.println(viewPage);
		
		if(viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage);
			return;
		}
		if(viewPage.endsWith(".json")) {
			resp.setContentType("text/json;charset=UTF-8");
			resp.getWriter().print(viewPage.substring(0,viewPage.length()-5));
			return;
		}
		//페이지 포워딩 넣어야됨 (json,.do형태다 사용)
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
		
	}
	
}
