package com.yedam.admin.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.order.domain.OrderVO;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;

public class ChulgoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderService service = new OrderServiceImpl();
		List<List<String>> listOfList = new ArrayList<>();
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null? "1": pageStr;
		int page = Integer.parseInt(pageStr);
		int total = service.chulgoTotal();
		PageDTO dto = new PageDTO(page,total);
		List<OrderVO> list = service.getChulgoList(page);
		for(OrderVO vo : list) {
			List<String> lit = service.getSubject(vo.getOrderId());
			listOfList.add(lit);
		}
		req.setAttribute("subjectList", listOfList);
		req.setAttribute("chulgoList", list);
		req.setAttribute("pageInfo", dto);
		return "admin/chulgo.tiles";
	}

}
