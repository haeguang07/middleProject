package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class WaitPaymentControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//결제페이지
		//둘다처리 -> 주문 : html에서 받아오는 post
		//선물 : 가격,포인트,도서개수,장바구니번호 - ajax로 호출
		//onclick location.href = waitpayment.do로
		return "waitpayment.tiles";
	}

}
