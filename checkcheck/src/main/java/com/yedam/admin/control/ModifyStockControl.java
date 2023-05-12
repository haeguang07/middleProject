package com.yedam.admin.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;

public class ModifyStockControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getMethod().equals("POST")) {
		BookService service = new BookServiceImpl();
		int booknum = Integer.parseInt(req.getParameter("booknum"));
		String updateList = req.getParameter("book");
		System.out.println(updateList);
		
		JSONArray jsonArray =  new JSONArray(updateList);
		for(int i=0;i<jsonArray.length() ; i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			System.out.println(jsonObject.get("isbn"));
			service.modifyStock(jsonObject.getLong("isbn"), booknum);
		}
		
		
//		for(int i = 0 ; i < updateList.length ; i++) {
//			long isbn = Long.parseLong(updateList[i]);
//			service.modifyStock(isbn,booknum);
//		}
		Map<String,Object> map = new HashMap<>();
		map.put("retCode", "Success");
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json + ".json";
		}
		return null;
	}

}
