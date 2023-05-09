package com.yedam.basket.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.basket.domain.BasketVO;
import com.yedam.basket.service.BasketService;
import com.yedam.basket.service.BasketServiceImpl;
import com.yedam.common.Control;

public class AddBasketControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long isbn = Long.parseLong(req.getParameter("isbn"));
		String userId = req.getParameter("userId");
		int count = Integer.parseInt(req.getParameter("count"));
		BasketVO vo = new BasketVO();
		vo.setIsbn(isbn);
		vo.setBasketCount(count);
		vo.setUserId(userId);
		BasketService service = new BasketServiceImpl();
		Map<String , Object> map = new HashMap<>();
		String json ="";
		if(service.addBasket(vo)) {
			map.put("retCode", "Success");
		}else {
			map.put("retCode", "Fail");
		}
		
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		return json+".json";
	}

}
