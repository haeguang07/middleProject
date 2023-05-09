package com.yedam.board.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.board.service.BoardService;
import com.yedam.board.service.BoardServiceImpl;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class InquiryAddControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		UserVO vo =(UserVO)session.getAttribute("sesInfo");
		BoardService service = new BoardServiceImpl();

		String userId = vo.getUserId();
		String subject = req.getParameter("subject");
		String title = req.getParameter("title");
		String attach=null;
		Map<String, String> map = new HashMap<>();
		if(service.addInquiry(userId, title, subject, attach)) {
			map.put("retCode" , "Success");
		}else {
			map.put("retCode" , "Fail");		
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json+".json";
		
	}

}
