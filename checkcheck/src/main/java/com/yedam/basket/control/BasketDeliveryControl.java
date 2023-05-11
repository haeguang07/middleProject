package com.yedam.basket.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.basket.domain.BasketVO;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class BasketDeliveryControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		bookName=${bookName}&bookPrice=${bookPrice}&bookCount=${bookCount}
		//선물버튼 클릭시 가는 delivery.tiles
		System.out.println("delivery선물 컨트롤페이지 입니다.");
		String[] remember = req.getParameterValues("remember");
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
		req.setAttribute("state", "1");
		System.out.println("state");
		return "delivery.tiles";
	}

}
