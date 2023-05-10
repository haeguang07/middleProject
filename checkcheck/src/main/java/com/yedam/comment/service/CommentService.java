package com.yedam.comment.service;

import java.util.List;

import com.yedam.comment.domain.CommentVO;

public interface CommentService {
	public List<CommentVO> getComments(String boardId);
	public boolean addComment(int boardId, String userId,String commentSubject);
}
