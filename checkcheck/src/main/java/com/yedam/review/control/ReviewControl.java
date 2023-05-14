package com.yedam.review.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class ReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewService service = new ReviewServiceImpl();
		long isbn = Long.parseLong(req.getParameter("isbn"));
		String pageStr = req.getParameter("page");
		int page = pageStr == null? 1 : Integer.parseInt(pageStr); 
		int total = service.getReviewCount(isbn);
		PageDTO dto = new PageDTO(page,total);
		List<ReviewVO> list = service.getReviewPaging(page,isbn);
		System.out.println(list+"@@@@@@@@@@@@@@@@@@@@@@@@@");
		String json="";
		Map<String,Object> map = new HashMap<>();
		if(list != null) {
			map.put("retCode", "Success");
			map.put("DTO", dto);
			map.put("data", list);
			Gson gson = new GsonBuilder().create();
			json = gson.toJson(map);
		}else {
			map.put("retCode", "Fail");
		}
		return json+".json";
	}

}
