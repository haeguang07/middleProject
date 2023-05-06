package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.domain.BookVO;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;

public class GetBookControl implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long isbn = Long.parseLong(req.getParameter("bookInfo"));
		System.out.println(isbn);
		BookService service = new BookServiceImpl();
		BookVO vo=service.isbnCallBook(isbn);
		System.out.println(vo);
		req.setAttribute("book", vo);
		return "getBook.tiles";
	}
}
