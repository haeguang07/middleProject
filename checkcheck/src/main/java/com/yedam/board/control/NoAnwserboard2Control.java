package com.yedam.board.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.board.domain.BoardVO;
import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;

public class NoAnwserboard2Control implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<>();
		String pageStr = req.getParameter("page");
		pageStr = pageStr==null ? "1": pageStr;
		int page = Integer.parseInt(pageStr);
		BoardService service=new BoardServiceImpl();
		List<BoardVO> list = service.getInquiryList(page);
		int total = service.inquiryTotal();
		PageDTO dto = new PageDTO(page, total);
		if(list!=null) {
			map.put("retCode","Success");
			map.put("data",list);
			map.put("DTO", dto);			
		}else if(list==null) {
			map.put("retCode","Fail");
		}
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json+".json";
	}

}
