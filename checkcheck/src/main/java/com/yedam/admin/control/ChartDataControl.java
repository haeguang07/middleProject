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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class ChartDataControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService service = new UserServiceImpl();
		List<UserVO> list = service.userList();
		int[] genderCount = new int[2];
		int[] ageCount =new int[6];
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
		for (UserVO vo : list) {
			//남녀 성비
			if(vo.getUserGender().equals("M")) genderCount[0] += 1;
			else genderCount[1] += 1;
			//나이 분보
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
		
		//올해기준으로 5년
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int[] years = {year-4,year-3,year-2,year-1,year};
		//년도별 매출
		List<Map> plist = new ArrayList<>();
		for (int y: years) {
			Map<String,Integer> map = new HashMap<>();
			List<UserVO> ulist= service.getGenderPayment(y);
			//해당 년도에 매출이 null이면 0으로
			if(ulist == null) {
				map.put("M", 0);
				map.put("F", 0);
			}else {
				for(UserVO vo : ulist) 
					map.put(vo.getUserGender(), vo.getPayment());
				plist.add(map);				
			}
		}
		//매출 상위 5개장르 구하기
		List<UserVO> cate5 =service.getCategoryTop5();//장르와 매출
		String[] category5 = new String[5];//장르만 따로 저장(map의 키값)
		for(int i=0;i<5;i++) category5[i]=cate5.get(i).getCategory();
		//남녀 장르매출
		List<UserVO> mcList =service.getGenderCategoryRate("M");
		List<UserVO> fcList =service.getGenderCategoryRate("F");
		//map<장르,매출>형태로 변환
		Map<String,Integer> mcMap = new HashMap<>();
		Map<String,Integer> fcMap = new HashMap<>();
		Map<String,Integer> cate5Map = new HashMap<>();
		for (UserVO vo: mcList) mcMap.put(vo.getCategory(), vo.getRate());
		for (UserVO vo: fcList) fcMap.put(vo.getCategory(), vo.getRate());
		for (UserVO vo: cate5) cate5Map.put(vo.getCategory(), vo.getRate());
		
		//연령별 장르 매출
		//나이로 생년월일 범위
		List<String> ageArr = new ArrayList<>();
		for(int i=0;i<70;i+=10) {
			now = LocalDate.now();
			String age = (now.getYear()-i)+"-"+now.getMonthValue()+"-"+now.getDayOfMonth();		
			ageArr.add(age);
		}
		//각 연령별 매출
		Map<String,Map<String,Integer>> ageMap = new HashMap<>();//<연령,<카테고리,매출>>
		for(int i=0;i<ageArr.size();i++) {
			Map<String,Integer> ageCateMap = new HashMap<>();
			List<UserVO> aList =new ArrayList<>();
			if(i==ageArr.size()-1) {
				aList = service.getAgePayment60(ageArr.get(i));
			}else {
				aList = service.getAgePayment(ageArr.get(i+1),ageArr.get(i));
			}
			for(UserVO vo: aList) ageCateMap.put(vo.getCategory(), vo.getRate());				
			ageMap.put((i+"0대"), ageCateMap);
		}
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("genderCount", genderCount);
		map.put("ageCount", ageCount);
		map.put("years", years);
		map.put("plist", plist);
		map.put("cate5Map", cate5Map);
		map.put("category5", category5);
		map.put("mcMap", mcMap);
		map.put("fcMap", fcMap);
		map.put("ageMap", ageMap);
		
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json+".json";
	}

	
	//나이 구하는 메소드
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
