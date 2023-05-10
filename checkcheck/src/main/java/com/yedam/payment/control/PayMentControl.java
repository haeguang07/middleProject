package com.yedam.payment.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class PayMentControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String name = req.getParameter("userName");
		String address = req.getParameter("userAddress");
		String post = req.getParameter("userPost");
		String[] bookName = req.getParameterValues("bookName");
		String[] basketCount = req.getParameterValues("basketCount");
		String[] bookPrice = req.getParameterValues("bookPrice");
		System.out.println(userId);
		System.out.println(name);
		System.out.println(address);
		System.out.println(post);
		for(int i=0;i<bookName.length;i++) {
			System.out.println("책이름 : "+bookName[i]);
			System.out.println("담은 개수 : "+basketCount[i]);
		}
		return "payMent.tiles";
	}

}
