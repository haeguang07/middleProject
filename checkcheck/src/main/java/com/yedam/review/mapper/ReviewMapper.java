package com.yedam.review.mapper;

import java.util.List;

import com.yedam.review.domain.ReviewVO;

public interface ReviewMapper {
	public List<ReviewVO> searchReview(String userId);
	public int deleteReview(int reviewId);
}
