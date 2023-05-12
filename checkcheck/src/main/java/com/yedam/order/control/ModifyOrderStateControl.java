package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.yedam.common.Control;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;

public class ModifyOrderStateControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderService service = new OrderServiceImpl();
		
		String orderIdList = req.getParameter("orderId");
		JSONArray jsonArray =  new JSONArray(orderIdList);
		for(int i=0;i<jsonArray.length() ; i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			System.out.println(jsonObject.get("orderId"));
			service.modifyOrderState((Long)jsonObject.get("orderId"));
		}
		
			return "{\"retCode\":\"Success\"}.json";
		
	}
}
