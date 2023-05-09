package com.yedam.review.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class DeleteReviewContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rid= Integer.parseInt(req.getParameter("rid"));
		ReviewService service =new ReviewServiceImpl();
		String json ="";
		Map<String, Object> map= new HashMap<>();
		if(service.removeReview(rid)) {
			map.put("retCode", "Success");
		}else {
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
		json=gson.toJson(map);
		return json+".json";
	}

}
