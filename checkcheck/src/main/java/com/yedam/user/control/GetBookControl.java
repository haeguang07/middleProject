package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.domain.BookVO;
import com.yedam.common.Control;

public class GetBookControl implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookVO vo = (BookVO)req.getAttribute("bookInfo");
		return "getBook.tiles";
	}
}
