package com.yedam.review.domain;

import lombok.Data;

@Data
public class ReviewVO {
//	REVIEW_ID      NOT NULL NUMBER         
//	ISBN           NOT NULL NUMBER         
//	USER_ID        NOT NULL VARCHAR2(16)   
//	REVIEW_SUBJECT NOT NULL VARCHAR2(1000) 
//	STARCOUNT      NOT NULL NUMBER    
	private int reviewId;
	private long isbn;
	private String userId;
	private String reviewSubject;
	private int starcount;
	// join해서 책이름 입력용 필드
	private String bookName;
	private String reviewDate;
	
}
