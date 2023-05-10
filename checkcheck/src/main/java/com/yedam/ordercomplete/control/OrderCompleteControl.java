package com.yedam.ordercomplete.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.basket.domain.BasketVO;
import com.yedam.common.Control;

public class OrderCompleteControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("ordercomplete페이지입니다.");
		String userId = req.getParameter("userId");						//ok
		int totalPrice = Integer.parseInt(req.getParameter("totalPrice"));//ok
		String name = req.getParameter("userName");						//ok
		String address = req.getParameter("userAddress");				//ok
		String post = req.getParameter("userPost");						//ok
		String method = req.getParameter("remember");					//ok
		String phone = req.getParameter("userPhone");
		int totalSpoint = Integer.parseInt(req.getParameter("totalSpoint"));
		String[] basketCount = req.getParameterValues("basketCount");
		String[] bookPrice = req.getParameterValues("bookPrice");
		String[] bookName = req.getParameterValues("bookName");	
		int couponId = Integer.parseInt(req.getParameter("couponId"));
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
		System.out.println(userId);
		System.out.println(name);
		System.out.println(address);
		System.out.println(post);
		System.out.println(totalPrice);
		System.out.println(phone);
		System.out.println(totalSpoint);
		System.out.println("결제방식 : "+method);
		System.out.println("쿠폰번호 : "+couponId);
		//만들어야하는 query문
		//orders table값 넣기, historys table값 넣기 <<insert문
		//books bookstock값 수정, userpoint 사용한거빼고 쌓이는 포인트 추가 <<update
		//coupons table 사용한 쿠폰 제거, baskets table 구매한 도서 제거 <<delete
		return "ordercomplete.tiles";
	}

}
