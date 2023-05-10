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

public class AnnounceForAjaxControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService service = new BoardServiceImpl();
		int page = Integer.parseInt(req.getParameter("page"));
		List<BoardVO> list = service.getAnnouncementPage(page);
		Map<String , Object> map = new HashMap<>();
		String json = "";
		if(list != null) {
			map.put("retCode", "Success");
			map.put("data", list);
		}else {
			map.put("retCode","Fail");
		}
		
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		
		return json+".json";
	}

}
