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
	public List<ReviewVO> reviewList(String userId,int page) {
		
		return mapper.searchReview(userId,page);
	}
	@Override
	public int getReviewCountId(String userId) {
		return mapper.reviewCountId(userId);
	}
	@Override
	public boolean removeReview(int reviewId) {
		
		return mapper.deleteReview(reviewId)==1;
	}
	@Override
	public List<ReviewVO> getBookReview(long isbn) {
		return mapper.bookReview(isbn);
	}
	@Override
	public int modifyReview(String reviewSubject, int reviewId) {
		return	mapper.updateReview(reviewSubject, reviewId);
	}
	@Override
	public int addReview(ReviewVO vo) {
		return mapper.insertReview(vo);
	}
	@Override
	public int getAddRid() {
		return mapper.maxReviewIdPlusOne();
	}
	@Override
	public ReviewVO getReview(int reviewId) {
		return mapper.selectReviewId(reviewId);
	}
	@Override
	public List<ReviewVO> getReviewPaging(int page,long isbn) {
		return mapper.bookReviewPaging(page,isbn);
	}
	@Override
	public int getReviewCount(long isbn) {
		return mapper.reviewCount(isbn);
	}
	
	

}
