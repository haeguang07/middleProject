package com.yedam.event.contorl;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.coupon.domain.CouponVO;
import com.yedam.coupon.service.CouponService;
import com.yedam.coupon.service.CouponServiceImpl;
import com.yedam.event.service.EventService;
import com.yedam.event.service.EventServiceImpl;
import com.yedam.user.domain.UserVO;

public class AddEventControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String eventDate = req.getParameter("date");
		HttpSession session = req.getSession();
		UserVO vo = (UserVO)session.getAttribute("sesInfo");
		String uid = vo.getUserId();
		EventService service = new EventServiceImpl();
		Map<String,String> map= new HashMap<>();
		String[] week = week(eventDate);
	System.out.println(week[0]+week[1]);
		if(service.addEvent(uid, eventDate)) {
			if(service.checkEvent(week[0], week[1], uid)) {
				CouponService cs =new CouponServiceImpl();
				CouponVO vo2 = new CouponVO();
				vo2.setDiscount(0.01);
				vo2.setUserId(uid);
				if(cs.addCoupon(vo2)) map.put("coupon", "Success");
			}
			map.put("retCode", "Success");
		}else {
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json+".json";
	}
	
	public String[] week(String today) {
		 //범위 검색용 날짜
        String startDt = today;
        //년, 월, 일 분리
        String[] dateArray = startDt.split("-");
        //날짜 표시 포멧 지정
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        //캘린더 생성
        Calendar cal = Calendar.getInstance();
        //검색용 날짜 세팅
        cal.set(Integer.parseInt(dateArray[0]), (Integer.parseInt(dateArray[1]) - 1), Integer.parseInt(dateArray[2]));
        //일주일의 첫날 선택
        cal.setFirstDayOfWeek(Calendar.SUNDAY);
        //해당 주차 시작일과의 차이 구하기용
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK) - cal.getFirstDayOfWeek();
        //해당 주차의 첫날 세팅
        cal.add(Calendar.DAY_OF_MONTH, - dayOfWeek);
        //해당 주차의 첫일자
        String stDt = formatter.format(cal.getTime());
        //해당 주차의 마지막 세팅
        cal.add(Calendar.DAY_OF_MONTH, 6); 
        //해당 주차의 마지막일자
        String edDt = formatter.format(cal.getTime());
        String[] week = {stDt,edDt};
        return week;
	}

}
