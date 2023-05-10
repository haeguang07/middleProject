package com.yedam.payment.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.basket.domain.BasketVO;
import com.yedam.common.Control;
import com.yedam.coupon.domain.CouponVO;
import com.yedam.coupon.service.CouponService;
import com.yedam.coupon.service.CouponServiceImpl;
import com.yedam.user.domain.UserVO;

public class WaitPaymentControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//결제페이지
		//둘다처리 -> 주문 : html에서 받아오는 post
		//선물 : 가격,포인트,도서개수,장바구니번호 - ajax로 호출
		//onclick location.href = waitpayment.do로
		System.out.println("WaitPaymentControl페이지");
		HttpSession session = req.getSession();
		UserVO uvo = (UserVO)session.getAttribute("sesInfo");
		String userId=uvo.getUserId();
		String userName=uvo.getUserName();
		String userPoint=uvo.getUserPoint();
		String userGrade=uvo.getUserGrade();
		String[] bookName = req.getParameterValues("bookName");
		String[] bookPrice = req.getParameterValues("bookPrice");
		String[] basketCount = req.getParameterValues("basketCount");
		String totalPrice = req.getParameter("totalPrice");
		String name = req.getParameter("name");
		int post = Integer.parseInt(req.getParameter("post"));
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");
		List<BasketVO> blist = new ArrayList<>();
		for(int i=0;i<bookName.length;i++) {
			BasketVO bvo = new BasketVO();
			int newbookPrice = Integer.parseInt(bookPrice[i]);
			int newbookCount = Integer.parseInt(basketCount[i]);
			bvo.setBookName(bookName[i]);
			bvo.setBasketCount(newbookCount);
			bvo.setBookPrice(newbookPrice);
			blist.add(bvo);
		}
		System.out.println(blist);
		CouponService service = new CouponServiceImpl();
		List<CouponVO> clist = new ArrayList<>();
		clist = service.ycouponList(userId);
		System.out.println(clist);
		if(userName.equals(name)) {
			req.setAttribute("userName", userName);
		}else {
			req.setAttribute("userName",name);
		}
		req.setAttribute("userId", userId);
		req.setAttribute("userPoint", userPoint);
		req.setAttribute("userGrade", userGrade);
		req.setAttribute("bookName", bookName);
		req.setAttribute("bookPrice", bookPrice);
		req.setAttribute("basketCount", basketCount);
		req.setAttribute("totalPrice", totalPrice);
		req.setAttribute("address", address);
		req.setAttribute("phone", phone);
		req.setAttribute("post",post);
		req.setAttribute("clist", clist);
		req.setAttribute("blist", blist);
		return "waitpayment.tiles";
	}

}
