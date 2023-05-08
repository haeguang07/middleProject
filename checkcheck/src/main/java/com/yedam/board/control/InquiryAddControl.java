package com.yedam.board.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		String saveDir=req.getServletContext().getRealPath("images");
		int maxSize = 20* 1024*1024;
		String encoding="UTF-8";
		DefaultFileRenamePolicy rn= new DefaultFileRenamePolicy();
		MultipartRequest multi= new MultipartRequest(req, saveDir,maxSize,encoding,rn);
		String userId = vo.getUserId();
		String subject = multi.getParameter("subject");
		String title = multi.getParameter("title");
		String attach = multi.getFilesystemName("attach");
		if(service.addInquiry(userId, title, subject, attach)) {
			req.setAttribute("result", "Success");
			return "inquiryInfo.do";
		}else {
			return "main.do";			
		}
		
		
	}

}
