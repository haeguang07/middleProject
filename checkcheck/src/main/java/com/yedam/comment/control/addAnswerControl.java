package com.yedam.comment.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.comment.service.CommentService;
import com.yedam.comment.service.CommentServiceImpl;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class addAnswerControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO vo =(UserVO)session.getAttribute("sesInfo");
		String uid =  vo==null? "hbj04003": vo.getUserId();
		int boardId=Integer.parseInt(req.getParameter("bid"));
		String commentSubject=req.getParameter("subject");
		CommentService service = new CommentServiceImpl();
		Map<String,String> map = new HashMap<>();
		if(service.addComment(boardId, uid, commentSubject)) {
			map.put("retCode", "Success");
		}else {
			map.put("retCode", "Fail");			
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json+".json";
	}

}
