package com.yedam.admin.control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class ChartControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService service = new UserServiceImpl();
		List<UserVO> list = service.userList();
		int[] genderCount = new int[2];
		int[] ageCount =new int[6];
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
		for (UserVO vo : list) {
			if(vo.getUserGender().equals("M")) genderCount[0] += 1;
			else genderCount[1] += 1;
			Date birth = new Date();
			try {
				 birth = formatter.parse(vo.getUserBirth());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			int age = getAge(birth.getYear()+1900,birth.getMonth()+1,birth.getDate());
			if(age>=10&& age<20)ageCount[0]++; if(age>=20&& age<30)ageCount[1]++; if(age>=30&& age<40)ageCount[2]++; 
			if(age>=40&& age<50)ageCount[3]++; if(age>=50&& age<60)ageCount[4]++; if(age>=60)ageCount[5]++; 
		}
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int[] years = {year-4,year-3,year-2,year-1,year};
		List<Map> plist = new ArrayList<>();
		for (int y: years) {
			Map<String,Integer> map = new HashMap<>();
			List<UserVO> ulist= service.getGenderPayment(y);
			if(ulist == null) {
				map.put("M", 0);
				map.put("F", 0);
			}else {
				for(UserVO vo : ulist) 
					map.put(vo.getUserGender(), vo.getPayment());
				plist.add(map);				
			}
		}
		
		
		
		req.setAttribute("genderCount", genderCount);
		req.setAttribute("ageCount", ageCount);
		req.setAttribute("years", years);
		req.setAttribute("plist", plist);
		return "admin/chart.tiles";
	}
	
	
	
	
	
	 public static int getAge(int birthYear, int birthMonth, int birthDay){
	         Calendar current = Calendar.getInstance();
	         int currentYear  = current.get(Calendar.YEAR);
	         int currentMonth = current.get(Calendar.MONTH) + 1;
	         int currentDay   = current.get(Calendar.DAY_OF_MONTH);
	         int age = currentYear - birthYear;
	         if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) {
	        	 age--;	        	 
	         }
	         return age;
	 }

}
