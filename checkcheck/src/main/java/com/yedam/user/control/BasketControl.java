package com.yedam.user.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.basket.domain.BasketVO;
import com.yedam.basket.service.BasketService;
import com.yedam.basket.service.BasketServiceImpl;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class BasketControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BasketService service = new BasketServiceImpl();
		List<BasketVO> list = new ArrayList<>();
		BasketVO vo = new BasketVO();
		HttpSession session = req.getSession();
		UserVO uvo= (UserVO)session.getAttribute("sesInfo");
		String userId=uvo.getUserId();
		String userAddress = uvo.getUserAddress();
		int userPost = uvo.getUserPost();
		String userGrade = uvo.getUserGrade();
		String userPoint = uvo.getUserPoint();
		System.out.println("userId =  "+userId);
		list = service.selectBasket(userId);
		req.setAttribute("list", list);
		System.out.println(list);
		return "basket.tiles";
	}

}
