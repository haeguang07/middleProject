package com.yedam.user.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.order.domain.OrderVO;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;

public class ShipingInfoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id= req.getParameter("id");
		OrderService service = new OrderServiceImpl();
		List<OrderVO> list= service.OrderSearch(id);
		
		req.setAttribute("list", list);
		req.setAttribute("vo", list.get(0));
		return "myPage/shippingInfo.tiles";
	}

}
