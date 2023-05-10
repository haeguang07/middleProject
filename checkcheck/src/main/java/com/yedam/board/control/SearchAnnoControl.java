package com.yedam.board.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.domain.BoardVO;
import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.common.Control;

public class SearchAnnoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService service = new BoardServiceImpl();
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		BoardVO vo = service.getOneAnno(boardId);
		req.setAttribute("board", vo);
		return "searchAnno.tiles";
	}

}
