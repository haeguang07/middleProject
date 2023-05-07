package com.yedam.user.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;
import com.yedam.user.domain.UserVO;

public class UserReviewFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO vo= (UserVO)session.getAttribute("sesInfo");
		String uid= vo.getUserId();
		ReviewService service = new ReviewServiceImpl();
		List<ReviewVO> list= service.reviewList(uid);
		req.setAttribute("list", list);
		
		return "myPage/userReview.tiles";
	}

}
