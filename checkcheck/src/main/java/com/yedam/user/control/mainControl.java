package com.yedam.user.control;

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

public class mainControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookService service = new BookServiceImpl();
		List<BookVO> list = service.mainRecommandList("%>%");
		List<BookVO> newlist = service.getNewList();
		List<BookVO> newBookList = service.getNewBookList();
		req.setAttribute("normalList", list);
		req.setAttribute("newList", newlist);
		req.setAttribute("newBookList", newBookList);
		
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
		
		List<BookVO> bestSellerList = service.getBestSeller(monthFirst, monthLast);
		req.setAttribute("bestSeller", bestSellerList);
		return "main.tiles";
	}

}
