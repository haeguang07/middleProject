package com.yedam.user.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yedam.basket.domain.BasketVO;
import com.yedam.book.domain.BookVO;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class DeliveryControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//배송정보페이지
		System.out.println("delivery컨트롤페이지 입니다.");
		if(req.getMethod().equals("GET")) {
			System.out.println("GET방식입니다.");
			long isbn1 = Long.parseLong(req.getParameter("isbn"));
			int bookStock = Integer.parseInt(req.getParameter("bookStock"));
			System.out.println(isbn1);
			BookVO bvo = new BookVO();
			BookService service = new BookServiceImpl();
			bvo = service.selectBookSearch(isbn1);
			System.out.println("isbn : "+bvo.getIsbn());
			String isbn = String.valueOf(isbn1);
			String bookName = bvo.getBookName();
			String bookPrice = String.valueOf(bvo.getBookPrice());
			String basketCount = req.getParameter("bookCount");
			System.out.println("basketCount="+basketCount);
			System.out.println(isbn);
			System.out.println("책이름 : "+bvo.getBookName());
			System.out.println("책가격 : "+bvo.getBookPrice());
			System.out.println("갯수 : "+bookStock);
			String check="0";
			req.setAttribute("check", check);
			req.setAttribute("isbn", isbn);
			req.setAttribute("bookName", bookName);
			req.setAttribute("bookPrice", bookPrice);
			HttpSession session = req.getSession();
			UserVO uvo = (UserVO)session.getAttribute("sesInfo");
			System.out.println(uvo);
			String grade = uvo.getUserGrade();
			req.setAttribute("sesInfo", uvo);
			req.setAttribute("grade", grade);
			req.setAttribute("basketCount", basketCount);
			req.setAttribute("bookStock", bookStock);
//			String userId = uvo.getUserId();
//			String userName = uvo.getUserName();
//			String userAddress = uvo.getUserAddress();
//			String userPost = String.valueOf(uvo.getUserPost());
//			String userPhone = uvo.getUserPhone();
//			req.setAttribute("userId", userId);
//			req.setAttribute("userName", userName);
//			req.setAttribute("userPost", userPost);
//			req.setAttribute("userAddress", userAddress);
//			req.setAttribute("userPhone", userPhone);
			
		}
		else if(req.getMethod().equals("POST")) {
			System.out.println("POST방식입니다.");
			String[] remember = req.getParameterValues("remember");
			if(remember.length!=0){
				System.out.println(remember[0]);
				
				List<BasketVO> list = new ArrayList<>();
				for(int i=0;i<remember.length;i++) {
					BasketVO data = new Gson().fromJson(remember[i], BasketVO.class);
					System.out.println(data.getProAddress());
					System.out.println(data.getBasketId());
					list.add(data);
					System.out.println(list);
				}
				String check="1";
				req.setAttribute("list", list);
				req.setAttribute("check", check);
			}
		}
		return "delivery.tiles";
	}

}
