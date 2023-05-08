package com.yedam.review.service;

import java.util.List;

import com.yedam.review.domain.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewList(String userId);
	public boolean removeReview(int reviewId);
	public List<ReviewVO> getBookReview(long isbn);
	public int modifyReview(String reviewSubject,int reviewId);
	public int addReview(ReviewVO vo);
}
