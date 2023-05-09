package com.yedam.basket.domain;

import lombok.Data;

@Data
public class BasketVO {
//	BASKET_ID NOT NULL NUMBER       
//	USER_ID   NOT NULL VARCHAR2(16) 
//	ISBN      NOT NULL NUMBER   
	private int basketId;
	private String userId;
	private Long isbn;
	private String bookName;
	private int bookPrice;
	private String cover;
	private int basketCount;
	
}
