package com.yedam.review.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

public class AddReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewService service = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		//작성일
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date today = new Date();
		String date = format1.format(today);
		
		int reviewId = service.getAddRid();
		String rviewSubject = req.getParameter("reviewSubject");
		long isbn = Long.parseLong(req.getParameter("isbn"));
		int starcount = Integer.parseInt(req.getParameter("starcount"));
		String userId = req.getParameter("id");
		String nickname = req.getParameter("nickname");
		vo.setNickname(nickname);
		vo.setReviewId(reviewId);
		vo.setUserId(userId);
		vo.setStarcount(starcount);
		vo.setReviewDate(date);
		vo.setReviewSubject(rviewSubject);
		vo.setIsbn(isbn);
		Map<String,Object> map = new HashMap<>();
		String json = "";
		if(service.addReview(vo) > 0) {
			map.put("retCode", "Success");
			map.put("data", vo);

		}else {
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		return json+".json";
	}

}
