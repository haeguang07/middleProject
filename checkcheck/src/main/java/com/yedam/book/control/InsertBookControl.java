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
		if(req.getMethod().equals("POST")) {
			BookService service = new BookServiceImpl();
		String[] book = req.getParameterValues("name[]");
		System.out.println(book+"12");
		System.out.println(Arrays.toString(book));
		if(service.isbnCallBook(Long.parseLong(book[0])) != null) {
			return "{'retCode':'Success'}.json";
		}
		System.out.println(Arrays.toString(book)+"확인용");
		BookVO vo = new BookVO();
		vo.setIsbn(Long.parseLong(book[0]));
		vo.setBookName(book[1]);
		vo.setBookPrice(Integer.parseInt(book[2]));
		book[3] = book[3].equals("") ? "작가미상":book[3];
		vo.setAuthor(book[3]);
		vo.setPublisher(book[4]);
		vo.setBookCategory(book[5]);
		book[6] = book[6].equals("") ? "줄거리없음" : book[6];
		vo.setBookDetail(book[6]);
		vo.setBookCount(0);
		vo.setHitCount(0);
		vo.setBookStock(Integer.parseInt(book[7]));
		vo.setCover(book[10]);
		vo.setPubDate(book[11]);
		if(service.insertbook(vo)) {
			return "{'retCode':'Success'}.json";
		}else {
			return "{'retCode':'Fail'}.json";
		} 
		}
		return "admin/addBook.tiles";
}
}
