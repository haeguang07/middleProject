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

public class HitCountControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		
		
		if(req.getMethod().equals("POST")) {
			String shWeek = req.getParameter("sh_week");
			String shMonth = req.getParameter("sh_month");
			String shYear = req.getParameter("sh_year");
			
			System.out.println(shWeek);
			String[] dateArr = shWeek.split("\\|");
			monthFirst = dateArr[0];
			monthLast = dateArr[1];
			String pageStr = req.getParameter("page");
			pageStr = pageStr == null ? "1" : pageStr;
			int page = Integer.parseInt(pageStr);
			int total = service.hitCountCount(monthLast , monthFirst);
			// 페이징
			PageDTO dto = new PageDTO(page, total);
			
			List<BookVO> list = service.hitCountSearchPageList(monthFirst, monthLast, page);
			req.setAttribute("list", list);
			System.out.println(list + "post");
			req.setAttribute("category", "화제의책");
			req.setAttribute("pageInfo", dto);
			req.setAttribute("shYear", shYear);
			req.setAttribute("shMonth", shMonth);
			req.setAttribute("shWeek", shWeek);
			System.out.println("post");
			return "searchpage.tiles";
		}else if(req.getMethod().equals("GET")){
		String category = req.getParameter("category");
		System.out.println(category);
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		String monthFirst2 = req.getParameter("monthFirst");
		monthFirst2 = monthFirst2 == null ? monthFirst : monthFirst2;
		String monthLast2 = req.getParameter("monthLast");
		monthLast2 = monthLast2 == null ? monthLast : monthLast2;
		System.out.println(monthFirst2 + "  " + monthLast2);
		int total = service.hitCountCount(monthLast , monthFirst);
		// 페이징
		PageDTO dto = new PageDTO(page, total);
		
		List<BookVO> list = service.hitCountSearchPageList(monthFirst2, monthLast2, page);
		List<BookVO> listTest = service.hitCountSearchPageList("2023-05-01", "2023-05-31", 1);
		System.out.println(listTest);
		System.out.println(dto);
		System.out.println(total);
		req.setAttribute("list", list);
		System.out.println(list + "GET");
		req.setAttribute("category", category);
		System.out.println(category + "GET");
		req.setAttribute("pageInfo", dto);
		//https://blog.munilive.com/posts/create-weekly-selectbox-with-javascript.html
		System.out.println("GET");
		return "searchpage.tiles";
		}
		System.out.println("적용안됨");
		return "searchpage.tiles";
	}

}
