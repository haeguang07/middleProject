package com.yedam.basket.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import com.yedam.ordercomplete.service.CompleteService;
import com.yedam.ordercomplete.service.CompleteServiceImpl;
import com.yedam.user.domain.UserVO;

public class BasketDeleteControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("basketDeletepage입니다");
		String[] remember = req.getParameterValues("remember");
		if(remember.length!=0) {
			System.out.println(remember[0]);
			
			for(int i=0;i<remember.length;i++) {
				BasketVO data = new Gson().fromJson(remember[i],BasketVO.class);
				System.out.println(i+"번째 basketId : "+data.getBasketId());
				int basketId = data.getBasketId();
				System.out.println("확인용 basketId : "+basketId);
				CompleteService service = new CompleteServiceImpl();
				service.deleteBasket(basketId);
			}
			HttpSession session = req.getSession();
			UserVO uvo= (UserVO)session.getAttribute("sesInfo");
			req.setAttribute("sesInfo", uvo);
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
			int month = time.getMonth()+1;
			int day = time.getDay();
			Calendar cal = Calendar.getInstance(Locale.KOREA);
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
		}else {
			System.out.println("제거할 장바구니목록을 받아오지 못했습니다.");
		}
		return "basket.do";
	}

}
