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

public class BestSellerControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookService service = new BookServiceImpl();
		String category = req.getParameter("category");
		System.out.println(category);
		

		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int total = service.pagetotalCount(category);
		// 페이징
		PageDTO dto = new PageDTO(page, total);
		//날짜 구하기
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		
		int year = time.getYear() + 1900;
		int month = time.getMonth();
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
		
		String monthFirst2 = req.getParameter("monthFirst");
		monthFirst2 = monthFirst2 == null ? monthFirst : monthFirst2;
		String monthLast2 = req.getParameter("monthLast");
		monthLast2 = monthLast2 == null ? monthLast : monthLast2;
		List<BookVO> list = service.getBestSellerSearchPage(monthFirst2, monthLast2, page);
		System.out.println(list);
		System.out.println(dto);
		System.out.println(total);
		req.setAttribute("list", list);
		req.setAttribute("category", category);
		req.setAttribute("pageInfo", dto);

		return "searchpage.tiles";
	}

}
