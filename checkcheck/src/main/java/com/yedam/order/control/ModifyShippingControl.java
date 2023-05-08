package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.order.domain.OrderVO;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;

public class ModifyShippingControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderVO vo = new OrderVO();
		vo.setOrderId(req.getParameter("id"));
		vo.setOrderName(req.getParameter("name")); 
		vo.setOrderName(req.getParameter("joinPost")); 
		vo.setOrderName(req.getParameter("joinAdr")+req.getParameter("joinAdr2")); 
		vo.setOrderName(req.getParameter("phone")); 
		OrderService service = new OrderServiceImpl();
		String json="";
		if(service.orderChange(vo)) {
			json="{'reqCode':'Success'}";
			Gson gson =new GsonBuilder().create();
			json += gson.toJson(vo);
		}else {
			json="{'reqCode':'Fail'}";
		}
		return json+".json";
	}

}