package com.yedam.admin.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.yedam.book.domain.BookVO;
import com.yedam.common.Control;

public class AddBookControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getMethod().equals("POST")) {
			String[] formData = req.getParameterValues("name");
			List<BookVO> list = new ArrayList<>();
			
			for(int i =0;i<formData.length ; i++) {
				BookVO vo = new BookVO();
				JSONObject jsonObj = new JSONObject(formData[i]);
				Map<String,Object> map = jsonObj.toMap();
				System.out.println(map);
				String[] strArr = {"title" , "publisher", "cover" ,"author" , "priceStandard" , "isbn13" , "categoryName" ,"pubDate","description"};
				
					vo.setBookName((String) map.get(strArr[0]));
					vo.setPublisher((String) map.get(strArr[1]));
					vo.setCover((String) map.get(strArr[2]));
					vo.setAuthor((String) map.get(strArr[3]));
					vo.setBookPrice((Integer) map.get(strArr[4]));
					vo.setIsbn(Long.parseLong((String) map.get(strArr[5])));
					vo.setBookCategory((String) map.get(strArr[6]));
					vo.setPubDate((String) map.get(strArr[7]));
					vo.setBookDetail((String) map.get(strArr[8]));
					list.add(vo);
			}
			System.out.println(list);
			req.setAttribute("booklist", list);
			req.setAttribute("test", "test");
			return "admin/addBook.tiles";
		}
		return "admin/addBook.tiles";
	}

}
