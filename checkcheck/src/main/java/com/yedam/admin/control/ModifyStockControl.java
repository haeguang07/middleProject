package com.yedam.admin.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;

public class ModifyStockControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getMethod().equals("POST")) {
		String[] updateList = req.getParameterValues("book");
		System.out.println(updateList);
		int booknum = Integer.parseInt(req.getParameter("booknum"));
		BookService service = new BookServiceImpl();
		
		for(int i = 0 ; i < updateList.length ; i++) {
			long isbn = Long.parseLong(updateList[i]);
			service.modifyStock(isbn,booknum);
		}
		return "{\"retCode\":\"Success\"}.json";
		}
		return null;
	}

}
