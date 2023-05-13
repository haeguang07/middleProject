package com.yedam.basket.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.basket.domain.BasketVO;
import com.yedam.common.Control;

public class BasketDeliveryControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		bookName=${bookName}&bookPrice=${bookPrice}&bookCount=${bookCount}
		//선물버튼 클릭시 가는 delivery.tiles
		System.out.println("delivery선물 컨트롤페이지 입니다.");
		String pre = req.getParameter("presentcheck");
		if(pre.equals("1")) {
			//받아와야되는거 isbn,bookName,bookPrice,basketCount
			String isbn=req.getParameter("isbn");
			String bookName=req.getParameter("bookName");
			String bookPrice=req.getParameter("bookPrice");
			String basketCount=req.getParameter("basketCount");
			System.out.println("presentcheck = "+pre);
			System.out.println("isbn = "+isbn);
			System.out.println("bookName = "+bookName);
			System.out.println("bookPrice = "+bookPrice);
			System.out.println("basketCount = "+basketCount);
			req.setAttribute("present", pre);
			req.setAttribute("bookName", bookName);
			req.setAttribute("bookPrice", bookPrice);
			req.setAttribute("basketCount", basketCount);
			req.setAttribute("state", "1");
		}else if(req.getParameter("presentcheck").equals("0")) {
			String[] remember = req.getParameterValues("remember");
			System.out.println(remember[0]);
			List<BasketVO> list = new ArrayList<>();
			for(int i=0;i<remember.length;i++) {
				BasketVO data = new Gson().fromJson(remember[i], BasketVO.class);
				System.out.println(data.getProAddress());
				System.out.println(data.getBasketId());
				list.add(data);
				System.out.println(list);
			}
			
			req.setAttribute("list", list);
			req.setAttribute("state", "1");
			req.setAttribute("present", pre);
			System.out.println("state");
		}
		return "delivery.tiles";
	}

}
