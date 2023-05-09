package com.yedam.board.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.board.domain.BoardVO;
import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;

public class AnnouncementControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService service = new BoardServiceImpl();
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int total = service.announceTotal();
		PageDTO dto = new PageDTO(page,total);
		List<BoardVO> list = service.getAnnouncementPage(page);
		System.out.println(list);
		req.setAttribute("board", list);
		req.setAttribute("pageInfo", dto);
		return "announcement.tiles";
	}

}
