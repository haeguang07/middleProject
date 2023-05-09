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
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class ModifyReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewService service = new ReviewServiceImpl();
		Map<String,Object> map = new HashMap<>();
		int reviewId = Integer.parseInt(req.getParameter("rid"));
		String nickname = req.getParameter("nickname");
		String json ="";
		if(service.modifyReview(req.getParameter("reviewSubject"), reviewId)>0) {
			map.put("retCode", "Success");
			ReviewVO vo = service.getReview(reviewId);
			vo.setNickname(nickname);
			map.put("data",vo);
		}else {
			map.put("retCode","Fail");
		}
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		return json+".json";
	}

}
