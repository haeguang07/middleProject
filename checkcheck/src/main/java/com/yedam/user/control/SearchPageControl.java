package com.yedam.user.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.domain.BookVO;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;

public class SearchPageControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookService service = new BookServiceImpl();
		String category = req.getParameter("category");
		System.out.println(category);
		category=category == null ? "국내도서>과학" : category;
		System.out.println(category);
		List<BookVO> list = new ArrayList<>();
		
		
		String pageStr = req.getParameter("page");
		pageStr=pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int total = service.pagetotalCount(category);
		//페이징
		PageDTO dto = new PageDTO(page,total);
//		list = service.booksearch(category);
		list = service.searchbookList(page,category);
		System.out.println(list);
		System.out.println(dto);
		System.out.println(total);
		req.setAttribute("list", list);
		req.setAttribute("category", category);
		req.setAttribute("pageInfo", dto);
		return "searchpage.tiles";
	}

}
