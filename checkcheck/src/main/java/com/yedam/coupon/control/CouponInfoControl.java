package com.yedam.coupon.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.coupon.domain.CouponVO;
import com.yedam.coupon.service.CouponService;
import com.yedam.coupon.service.CouponServiceImpl;
import com.yedam.user.domain.UserVO;

public class CouponInfoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO vo= (UserVO)session.getAttribute("sesInfo");
		
		String pageStr = req.getParameter("page");
		pageStr = (pageStr == null) ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		CouponService service = new CouponServiceImpl();
		List<CouponVO> list = service.couponList(vo.getUserId(),page);
		int total = service.getCount(vo.getUserId());
		PageDTO dto = new PageDTO(page, total);
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		
		
		 return "myPage/couponInfo.tiles";
	}

}
