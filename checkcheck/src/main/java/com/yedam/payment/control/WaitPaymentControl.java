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
		if(req.getParameter("typecheck").equals("0")) {
			System.out.println("typecheck=0");
			System.out.println("1.waitpayment단일구매페이지");
			HttpSession session = req.getSession();
			UserVO uvo = (UserVO)session.getAttribute("sesInfo");
			System.out.println("user체크"+uvo);
			String name=req.getParameter("name");
			System.out.println("name"+name);
			String userId=uvo.getUserId();
			String userName=uvo.getUserName();
			System.out.println("2.waitpaymentcontrol 여기까지됨");
			String userPoint=uvo.getUserPoint();
			String userGrade=uvo.getUserGrade();
			String userAddress=uvo.getUserAddress();
			String userPhone=uvo.getUserPhone();
			String userPost=String.valueOf(uvo.getUserPost());
			System.out.println("3.waitpaymentcontrol 여기까지됨");
			String bookName = req.getParameter("bookName");
			String bookPrice = req.getParameter("bookPrice");
			System.out.println(bookName);
			System.out.println(bookPrice);
			CouponService service = new CouponServiceImpl();
			List<CouponVO> clist = new ArrayList<>();
			clist = service.ycouponList(userId);
			System.out.println(clist);
			if(userName.equals(name)) {
				req.setAttribute("userName", userName);
			}else {
				req.setAttribute("userName",name);
			}
			String check = "0";
			req.setAttribute("userId", userId);
			req.setAttribute("userPoint", userPoint);
			req.setAttribute("userGrade", userGrade);
			req.setAttribute("bookName", bookName);
			req.setAttribute("bookPrice", bookPrice);
			req.setAttribute("totalPrice", bookPrice);
			req.setAttribute("address", userAddress);
			req.setAttribute("phone", userPhone);
			req.setAttribute("post",userPost);
			req.setAttribute("check", check);
			
		}else if(req.getParameter("typecheck").equals("1")) {
			System.out.println("typecheck=1");
			System.out.println("WaitPaymentControl페이지");
			HttpSession session = req.getSession();
			UserVO uvo = (UserVO)session.getAttribute("sesInfo");
			System.out.println("1.waitpaymentcontrol 여기까지됨");
			String userId=uvo.getUserId();
			String userName=uvo.getUserName();
			System.out.println("2.waitpaymentcontrol 여기까지됨");
			String userPoint=uvo.getUserPoint();
			String userGrade=uvo.getUserGrade();
			System.out.println("3.waitpaymentcontrol 여기까지됨");
			String[] bookName = req.getParameterValues("bookName");
			String[] bookPrice = req.getParameterValues("bookPrice");
			System.out.println("4.waitpaymentcontrol 여기까지됨");
			String[] basketCount = req.getParameterValues("basketCount");
			System.out.println(basketCount);
			String[] basketId = req.getParameterValues("basketId");
			System.out.println(basketId);
			String totalPrice = req.getParameter("totalPrice");
			System.out.println("7.waitpaymentcontrol 여기까지됨");
			String name = req.getParameter("name");
			int post = Integer.parseInt(req.getParameter("post"));
			String address = req.getParameter("address");
			String phone = req.getParameter("phone");
			List<BasketVO> blist = new ArrayList<>();
			System.out.println("8.waitpaymentcontrol 여기까지됨");
			for(int i=0;i<bookName.length;i++) {
				BasketVO bvo = new BasketVO();
				System.out.println("9.waitpaymentcontrol 여기까지됨");
				int newbookPrice = Integer.parseInt(bookPrice[i]);
				int newbookCount = Integer.parseInt(basketCount[i]);
				System.out.println("10.waitpaymentcontrol 여기까지됨");
				int newbasketId = Integer.parseInt(basketId[i]);
				System.out.println("11.waitpaymentcontrol 여기까지됨");
				bvo.setBookName(bookName[i]);
				bvo.setBasketCount(newbookCount);
				bvo.setBookPrice(newbookPrice);
				System.out.println("12.waitpaymentcontrol 여기까지됨");
				bvo.setBasketId(newbasketId);
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
			String check = "1";
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
			req.setAttribute("check", check);
		}
		return "waitpayment.tiles";
	}

}
