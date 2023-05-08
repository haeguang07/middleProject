package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;

public class CancelOrderControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		OrderService service = new OrderServiceImpl();
		if(service.orderCancel(id)) {
			return "myPage/mypage.tiles";			
		}else {
			req.setAttribute("id", id);
			return "modifyShippingForm.do";
		}
	}

}
