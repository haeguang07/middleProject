package com.yedam.admin.control;

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

public class InquiryAnswerFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bid= req.getParameter("bid");
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		Integer page = Integer.parseInt(pageStr) ;
		BoardService service = new BoardServiceImpl();
		BoardVO vo =service.getOneAnno(Integer.parseInt(bid));
		CommentService csv = new CommentServiceImpl();
		List<CommentVO> list = csv.getComments(bid);
		req.setAttribute("vo", vo);
		req.setAttribute("page", page);
		req.setAttribute("co", list);
		
		return "admin/inquiryAnswer.tiles";
	}

}
