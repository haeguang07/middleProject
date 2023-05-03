package com.yedam.book.control;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.domain.BookVO;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;

public class InsertBookControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] book = req.getParameterValues("name[]");
		System.out.println(Arrays.toString(book));
		BookVO vo = new BookVO();
		vo.setIsbn(Long.parseLong(book[0]));
		vo.setBookName(book[1]);
		vo.setBookPrice(Integer.parseInt(book[2]));
		vo.setAuthor(book[3]);
		vo.setPublisher(book[4]);
		vo.setBookCategory(book[5]);
		if(book[6]==null) {
			book[6]="줄거리 없음";
			vo.setBookDetail(book[6]);
		}else {
		vo.setBookDetail(book[6]);
		}
		vo.setBookCount(0);
		vo.setHitCount(0);
		vo.setBookStock(0);
		vo.setCover(book[10]);
		BookService service = new BookServiceImpl();
		if(service.insertbook(vo)) {
			return "{'retCode':'Success'}.json";
		}
		return null;
	}

}
