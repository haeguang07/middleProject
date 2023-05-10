package com.yedam.comment.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.comment.domain.CommentVO;
import com.yedam.comment.mapper.CommentMapper;
import com.yedam.common.DataSource;

public class CommentServiceImpl implements CommentService{
	SqlSession session = DataSource.getInstance().openSession(true);
	CommentMapper mapper = session.getMapper(CommentMapper.class);
	
	@Override
	public List<CommentVO> getComments(String boardId) {
		return mapper.selectComments(boardId);
	}
	@Override
	public boolean addComment(int boardId, String userId, String commentSubject) {
		return mapper.insertComment(boardId, userId, commentSubject)==1;
	}

}
