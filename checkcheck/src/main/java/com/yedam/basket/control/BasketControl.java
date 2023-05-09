package com.yedam.basket.control;

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
import com.yedam.book.domain.BookVO;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class BasketControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BasketService service = new BasketServiceImpl();
		List<BasketVO> list = new ArrayList<>();
		List<UserVO> userlist = new ArrayList<>();
		HttpSession session = req.getSession();
		UserVO uvo= (UserVO)session.getAttribute("sesInfo");
		String userId=uvo.getUserId();
		System.out.println("userId =  "+userId);
		list = service.selectBasket(userId);
		String userGrade = uvo.getUserGrade();
		String address = uvo.getUserAddress();
		String userPoint = uvo.getUserPoint();
		req.setAttribute("list", list);
		req.setAttribute("address", address);
		req.setAttribute("userPoint", userPoint);
		req.setAttribute("userGrade", userGrade);
		int total=0;
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getBookPrice());
			total += list.get(i).getBookPrice();
		}
		req.setAttribute("total", total);
		System.out.println(total);
		System.out.println(list);
		return "basket.tiles";
	}

}
