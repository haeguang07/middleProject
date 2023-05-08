package com.yedam.board.control;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;

public class InquiryControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String savePath = req.getServletContext().getRealPath("image");
		String fileName = "";
		String fileUrl ="";
		
		MultipartRequest multi = new MultipartRequest(req, savePath,
				1024*1024*10, "utf-8",new DefaultFileRenamePolicy());
		
		Enumeration<?> files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String file = (String) files.nextElement();
			fileName = multi.getFilesystemName(file);
		}
		fileUrl = req.getContextPath() + "/image/" + fileName;
		
		//ckeditor 정보를 확인. 에디터 부분에 출력.
		JsonObject json = new JsonObject();
		json.addProperty("uploaded", 1); //따옴표안에는 고정값.  
		json.addProperty("fileName", fileName);
		json.addProperty("url", fileUrl);
		
		return json + ".json";
	}

}
