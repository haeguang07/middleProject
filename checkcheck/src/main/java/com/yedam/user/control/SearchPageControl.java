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
		List<BookVO> list = new ArrayList<>();
		if (req.getParameter("select") != null) {
			String select = req.getParameter("select");
			String search = req.getParameter("search");

			select = select.equals("통합검색") ? "%도서" : (select.equals("국내도서") ? "국내" : "외국");
			String pageStr = req.getParameter("page");
			pageStr = pageStr == null ? "1" : pageStr;
			System.out.println(pageStr);
			int page = Integer.parseInt(pageStr);
			int total = service.getSearchPageCount(select, search);
			// 페이징
			PageDTO dto = new PageDTO(page, total);
			list = service.searchBookList(select, search, page);
			if (select.equals("%도서")) {
				select = "통합검색";
			} else {
				select += "도서";
			}
			req.setAttribute("list", list);
			req.setAttribute("select", select);
			req.setAttribute("pageInfo", dto);
			return "searchpage.tiles";
		}
		if(req.getParameter("search")!= null) {
			String category = req.getParameter("category");
			String search = req.getParameter("search");
			
			String pageStr = req.getParameter("page");
			pageStr = pageStr == null ? "1" : pageStr;
			int page = Integer.parseInt(pageStr);
			int total = service.getSearchPageCount(category, search);
			// 페이징
			PageDTO dto = new PageDTO(page, total);

			list = service.searchBookList(category, search, page);
			System.out.println(list);
			System.out.println(dto);
			System.out.println(total);
			req.setAttribute("list", list);
			req.setAttribute("category", category);
			req.setAttribute("pageInfo", dto);
			return "searchpage.tiles";
		}else {
		String category = req.getParameter("category");
		System.out.println(category);
		category = category == null ? "국내도서>과학" : category;
		System.out.println(category);

		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int total = service.pagetotalCount(category);
		// 페이징
		PageDTO dto = new PageDTO(page, total);

		list = service.categoryBookList(page, category);
		System.out.println(list);
		System.out.println(dto);
		System.out.println(total);
		req.setAttribute("list", list);
		req.setAttribute("category", category);
		req.setAttribute("pageInfo", dto);

		return "searchpage.tiles";
		}
	}

}
