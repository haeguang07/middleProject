package com.yedam.user.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.basket.domain.BasketVO;
import com.yedam.book.domain.BookVO;
import com.yedam.common.Control;

public class DeliveryControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//배송정보페이지
		System.out.println("delivery컨트롤페이지 입니다.");
		if(req.getMethod().equals("GET")) {
			System.out.println("check");
			int isbn = Integer.parseInt(req.getParameter("isbn"));
			System.out.println(isbn);
			BookVO bvo = new BookVO();
			
		}
		else if(req.getMethod().equals("POST")) {
			String[] remember = req.getParameterValues("remember");
			if(remember.length!=0){
				System.out.println(remember[0]);
				
				List<BasketVO> list = new ArrayList<>();
				for(int i=0;i<remember.length;i++) {
					BasketVO data = new Gson().fromJson(remember[i], BasketVO.class);
					System.out.println(data.getProAddress());
					System.out.println(data.getBasketId());
					list.add(data);
					System.out.println(list);
				}
				req.setAttribute("list", list);
			}
		}
		return "delivery.tiles";
	}

}
