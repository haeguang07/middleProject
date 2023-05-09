package com.yedam.review.service;

import java.util.List;

import com.yedam.review.domain.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewList(String userId, int page);
	public int getReviewCountId(String userId);
	public boolean removeReview(int reviewId);
	public List<ReviewVO> getBookReview(long isbn);
	public int modifyReview(String reviewSubject,int reviewId);
	public int addReview(ReviewVO vo);
	public int getAddRid();
	public ReviewVO getReview(int reviewId);
	public List<ReviewVO> getReviewPaging(int page,long isbn);
	public int getReviewCount(long isbn);
}
