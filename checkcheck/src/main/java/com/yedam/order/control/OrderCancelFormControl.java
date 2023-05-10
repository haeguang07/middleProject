package com.yedam.order.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.order.domain.OrderVO;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.user.domain.UserVO;

public class OrderCancelFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO vo= (UserVO)session.getAttribute("sesInfo");
		String id = vo.getUserId();
		String pageStr = req.getParameter("page");
		pageStr = (pageStr == null) ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		OrderService service = new OrderServiceImpl();
		List<OrderVO> list = service.OrderCancelList(id, page);
		
		int total = service.getCancelTotal(id);

		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		return "myPage/orderCancel.tiles";
	}

}
