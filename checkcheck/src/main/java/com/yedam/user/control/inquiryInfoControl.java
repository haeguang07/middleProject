package com.yedam.user.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.board.domain.BoardVO;
import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class inquiryInfoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =req.getSession();
		UserVO vo = (UserVO)session.getAttribute("sesInfo");
		BoardService service = new BoardServiceImpl();
		List<BoardVO> list = service.getInquiryList(vo.getUserId());
		
		req.setAttribute("list", list);
		
		return "myPage/inquiry.tiles";
	}

}
