package com.yedam.user.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yedam.basket.domain.BasketVO;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class DeliveryControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//배송정보페이지
		
		String[] remember = req.getParameterValues("remember");
		System.out.println(remember[0]);
		List<BasketVO> list = new ArrayList<>();
		for(int i=0;i<remember.length;i++) {
			BasketVO data = new Gson().fromJson(remember[i], BasketVO.class);
			System.out.println(data.getProAddress());
			list.add(data);
			System.out.println(list);
		}
		
		req.setAttribute("list", list);
		return "delivery.tiles";
	}

}
