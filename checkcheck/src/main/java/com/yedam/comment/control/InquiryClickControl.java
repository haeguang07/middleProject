package com.yedam.comment.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.domain.BoardVO;
import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.comment.domain.CommentVO;
import com.yedam.comment.service.CommentService;
import com.yedam.comment.service.CommentServiceImpl;
import com.yedam.common.Control;

public class InquiryClickControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardId = req.getParameter("boardId");
		int intBoardId = Integer.parseInt(boardId);
		CommentService cmservice = new CommentServiceImpl();
		BoardService bdservice = new BoardServiceImpl();
		BoardVO vo = bdservice.getOneAnno(intBoardId);
		List<CommentVO> list = cmservice.getComments(boardId); 
		System.out.println(list.size() ==0);
		if(list.size()==0) {
			CommentVO cvo = new CommentVO();
			cvo.setCommentSubject("미답변");
			list.add(cvo);
			System.out.println(list+"1");
		req.setAttribute("inquiryCM", list);
		}else {
		req.setAttribute("inquiryCM", list);
		System.out.println(list+"2");
		}
		req.setAttribute("inquiry", vo);
		
		return "myPage/inquirydetail.tiles";
	}

}
