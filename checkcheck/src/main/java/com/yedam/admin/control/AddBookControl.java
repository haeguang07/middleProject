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
import com.yedam.book.service.BookService;
import com.yedam.book.service.BookServiceImpl;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;

public class AddBookControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getMethod().equals("POST")) {
			BookService service = new BookServiceImpl();
			String[] formData = req.getParameterValues("name");
			List<BookVO> list = new ArrayList<>();
			String pageStr = req.getParameter("pageInfo");
			String[] pageArr = pageStr.split("@");
			String query = req.getParameter("query");
			System.out.println("쿼리입니다. "+query);
			int page = Integer.parseInt(pageArr[0]);
			System.out.println("페이지 입니다 "+page);
			int total = Integer.parseInt(pageArr[1]);
			System.out.println("전체 개수입니다 "+total);
			
			for(int i =0;i<formData.length ; i++) {
				if(formData[i].equals("undefined")) {
					break;
				}
				BookVO vo = new BookVO();
				JSONObject jsonObj = new JSONObject(formData[i]);
				Map<String,Object> map = jsonObj.toMap();
//				System.out.println(map);
				String[] strArr = {"title" , "publisher", "cover" ,"author" , "priceStandard" , "isbn13" , "categoryName" ,"pubDate","description"};
					
					vo.setBookName((String) map.get(strArr[0]));
					vo.setPublisher((String) map.get(strArr[1]));
					vo.setCover((String) map.get(strArr[2]));
					vo.setAuthor((String) map.get(strArr[3]));
					vo.setBookPrice((Integer) map.get(strArr[4]));
					if(map.get(strArr[5]).equals("")) {
						String isbn =(String)map.get("isbn");
						if(isbn.charAt(0)==75) {
							isbn = isbn.substring(1);
						}
						vo.setIsbn(Long.parseLong(isbn));
					}else {
					vo.setIsbn(Long.parseLong((String) map.get(strArr[5])));
					}
					vo.setBookCategory((String) map.get(strArr[6]));
					vo.setPubDate((String) map.get(strArr[7]));
					vo.setBookDetail((String) map.get(strArr[8]));
					if(((String)map.get("isbn13")).equals("")) {
						String isbnStr = (String)map.get("isbn");
						if(isbnStr.charAt(0)==75) {
							isbnStr = isbnStr.substring(1);
							long isbn = Long.parseLong(isbnStr);
							if(service.isbnCallBook(isbn) != null) {
								vo.setCheck("be");
							}else {
								vo.setCheck("notBe");
							}
						}else {
							int isbn = Integer.parseInt(isbnStr);
							if(service.isbnCallBook(isbn)!=null) {
								vo.setCheck("be");
							}else {
								vo.setCheck("notBe");
							}
						}
					}else {
						String isbnStr = (String)map.get("isbn13");
						long isbn = Long.parseLong(isbnStr);
						 if(service.isbnCallBook(isbn) != null) {
							 vo.setCheck("be");
						 }else {
							 vo.setCheck("notBe");
						 }
					}
					list.add(vo);
			}
			
			PageDTO dto = new PageDTO(page,total);
			System.out.println(list);
			req.setAttribute("booklist", list);
			req.setAttribute("pageInfo", dto);
			req.setAttribute("test", "test");
			req.setAttribute("query", query);
			return "admin/addBook.tiles";
		}
		return "admin/addBook.tiles";
	}

}
