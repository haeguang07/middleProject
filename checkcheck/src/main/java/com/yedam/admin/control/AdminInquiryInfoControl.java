package com.yedam.admin.control;

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

public class AdminInquiryInfoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pageStr=req.getParameter("page");
		pageStr = pageStr==null ? "1": pageStr;
		int page = Integer.parseInt(pageStr);
		
		BoardService service = new BoardServiceImpl();
		int total = service.inquiryTotal();
		
		List<BoardVO> list = service.getInquiryList(page);
		PageDTO dto = new PageDTO(page, total);
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		
		
		
		return "admin/inquiry.tiles";
	}

}
