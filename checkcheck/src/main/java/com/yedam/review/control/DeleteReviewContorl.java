package com.yedam.review.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class DeleteReviewContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rid= Integer.parseInt(req.getParameter("rid"));
		ReviewService service =new ReviewServiceImpl();
		String json ="";
		if(service.removeReview(rid)) {
			json ="{'reqCode':'Success'}";
			
		}else {
			json="{'reqCode':'Fail'}";
		}
		return json+".json";
	}

}
