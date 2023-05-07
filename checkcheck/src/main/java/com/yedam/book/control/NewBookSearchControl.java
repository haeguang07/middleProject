package com.yedam.book.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.domain.BookVO;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;

public class NewBookSearchControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String category = req.getParameter("category");
		BookService service = new BookServiceImpl();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		
		int year = time.getYear() + 1900;
		int month = time.getMonth()+1;
		int day = time.getDay();
		Calendar cal = Calendar.getInstance();
		cal.set(year , month , day);
		
		System.out.println(dateFormat.format(cal.getTime()));
		cal.set(cal.DAY_OF_MONTH, cal.getMinimum(Calendar.DAY_OF_MONTH));
		String monthFirst = dateFormat.format(cal.getTime());
		System.out.println(dateFormat.format(cal.getTime()));
		cal.set(cal.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		String monthLast = dateFormat.format(cal.getTime());
		System.out.println(dateFormat.format(cal.getTime()));
		
		String pageStr = req.getParameter("page");
		int page = pageStr == null ? 1 : Integer.parseInt(pageStr);
		int total = service.newBookCountSearch(monthFirst, monthLast);
		PageDTO dto = new PageDTO(page,total);
		
		List<BookVO> list = service.getNewBookSearchPage(monthFirst, monthLast, page);
		System.out.println(dto);
		System.out.println(total);
		req.setAttribute("list", list);
		System.out.println(list + "GET");
		req.setAttribute("category", category);
		System.out.println(category + "GET");
		req.setAttribute("pageInfo", dto);
		
		return "searchpage.tiles";
	}

}
