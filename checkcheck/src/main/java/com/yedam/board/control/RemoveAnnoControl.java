package com.yedam.board.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.common.Control;

public class RemoveAnnoControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService service = new BoardServiceImpl();
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		Map<String,Object> map = new HashMap<>();
		String json = "";
		if(service.removeAnno(boardId)) {
			map.put("retCode", "Success");
		}else {
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		return json+".json";
	}

}
