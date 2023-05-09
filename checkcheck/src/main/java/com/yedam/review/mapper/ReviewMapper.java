package com.yedam.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.review.domain.ReviewVO;

public interface ReviewMapper {
	public List<ReviewVO> searchReview(@Param("userId") String userId,@Param("page") int page);
	public int reviewCountId(String userId);
	public int deleteReview(int reviewId);
	public List<ReviewVO> bookReview(@Param("isbn")long isbn);
	public int updateReview(@Param("reviewSubject")String reviewSubject , @Param("reviewId")int reviewId);
	public int insertReview(ReviewVO vo	);
	public int maxReviewIdPlusOne();
	public ReviewVO selectReviewId(int reviewId);
	public List<ReviewVO> bookReviewPaging(@Param("page")int page,@Param("isbn")long isbn);
	public int reviewCount(long isbn);
}
