package com.yedam.basket.control;

import java.io.IOException;
import java.util.HashMap;
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
		String bookName = req.getParameter("bookName");
		int bookPrice = Integer.parseInt(req.getParameter("bookPrice"));
		int bookCount = Integer.parseInt(req.getParameter("bookCount"));
		long isbn = Long.parseLong(req.getParameter("isbn"));
		String userId = req.getParameter("userId");
		BasketVO vo = new BasketVO();
		HttpSession session = req.getSession();
		UserVO uvo = (UserVO)session.getAttribute("sesInfo");
		String checkuserId = uvo.getUserId();
		String userAddress = uvo.getUserAddress();
		String userPoint = uvo.getUserPoint();
		req.setAttribute("userPoint", userPoint);
		return "delivery.tiles";
	}

}
