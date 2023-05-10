package com.yedam.board.domain;

import lombok.Data;

@Data
public class BoardVO {
//	BOARD_ID      NOT NULL NUMBER         
//	USER_ID       NOT NULL VARCHAR2(16)   
//	BOARD_KIND    NOT NULL NUMBER         
//	BOARD_TITLE   NOT NULL VARCHAR2(50)   
//	BOARD_SUBJECT NOT NULL VARCHAR2(4000) 
//	BOARD_FILE             VARCHAR2(100)  
//	BOARD_DATE    NOT NULL DATE           
//	CHECKS                 VARCHAR2(1) 
	private int boardId;
	private String UserId;
	private String boardKind;//공지 : 1 문의 : 2
	private String boardTitle;
	private String boardSubject;
	private String boardFile;
	private String boardDate;
	private String checks;//답변여부
	//users join해서 작성자 가져오기
	private String userName;
}
