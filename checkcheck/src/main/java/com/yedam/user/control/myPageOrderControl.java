package com.yedam.user.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.order.domain.OrderVO;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;

public class myPageOrderControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		String pageStr = req.getParameter("page");
		pageStr = (pageStr == null) ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		System.out.println(id+99+page);
		OrderService service = new OrderServiceImpl();
		List<OrderVO> list = service.OrderList(id, page);
		
		int total = service.gettotal(id);

		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		return "myPage/mypage.tiles";
	}

}
