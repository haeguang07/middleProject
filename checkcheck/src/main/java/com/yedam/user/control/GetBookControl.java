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
import com.yedam.common.PageDTO;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class GetBookControl implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewService reviewServ = new ReviewServiceImpl();
		long isbn = Long.parseLong(req.getParameter("bookInfo"));
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int total = reviewServ.getReviewCount(isbn);
		PageDTO dto = new PageDTO(page , total);
		BookService service = new BookServiceImpl();
		BookVO vo=service.isbnCallBook(isbn);
		System.out.println(vo);
		List<ReviewVO> list = reviewServ.getReviewPaging(page,isbn);
		req.setAttribute("reviewList", list);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("book", vo);
		return "getBook.tiles";
	}
}
