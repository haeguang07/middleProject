package com.yedam.admin.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.common.Control;

public class AddAnnoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String subject = req.getParameter("summary");
		String userId = req.getParameter("userId");
		
		BoardService service = new BoardServiceImpl();
		if(service.addAnno(userId, title, subject) > 0) {
			return "announcement.do";
		}else {
			return "writeAnno.do";
		}
	}
}
