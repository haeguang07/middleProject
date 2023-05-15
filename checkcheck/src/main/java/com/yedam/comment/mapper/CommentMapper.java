package com.yedam.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.comment.domain.CommentVO;

public interface CommentMapper {
	public List<CommentVO> selectComments(String boardId);
	public int insertComment(@Param("boardId")int boardId,@Param("userId")String userId,@Param("commentSubject")String commentSubject);
	public int updateCM(int boardId);
}
