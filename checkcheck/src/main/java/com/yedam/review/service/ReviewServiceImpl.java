package com.yedam.review.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.mapper.ReviewMapper;

public class ReviewServiceImpl implements ReviewService {
	SqlSession session = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = session.getMapper(ReviewMapper.class);
	@Override
	public List<ReviewVO> reviewList(String userId) {
		
		return mapper.searchReview(userId);
	}
	@Override
	public boolean removeReview(int reviewId) {
		
		return mapper.deleteReview(reviewId)==1;
	}
	@Override
	public List<ReviewVO> getBookReview(long isbn) {
		return mapper.bookReview(isbn);
	}
	
	

}
