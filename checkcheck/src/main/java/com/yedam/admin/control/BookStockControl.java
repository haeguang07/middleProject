package com.yedam.admin.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.domain.BookVO;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;

public class BookStockControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookService service = new BookServiceImpl();
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ?  "1":pageStr;
		int page = Integer.parseInt(pageStr);
		int total = service.getStockTotal();
		PageDTO dto = new PageDTO(page,total);
		List<BookVO> list = service.bookStockPage(page);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("stockWarningList", list);
		req.setAttribute("total", total);
		
		
		return "admin/bookStock.tiles";
	}

}
