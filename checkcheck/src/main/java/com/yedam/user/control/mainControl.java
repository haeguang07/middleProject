package com.yedam.user.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.domain.BookVO;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;

public class mainControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookService service = new BookServiceImpl();
		List<BookVO> list = service.mainRecommandList("%>%");
		List<BookVO> newlist = service.getNewList();
		List<BookVO> newBookList = service.getNewList();
		req.setAttribute("normalList", list);
		req.setAttribute("newList", newlist);
		req.setAttribute("newBookList", newBookList);
		
		return "main.tiles";
	}

}
