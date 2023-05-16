package com.yedam.ordercomplete.control;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.book.domain.BookVO;
import com.yedam.common.Control;
import com.yedam.history.domain.HistoryVO;
import com.yedam.order.domain.OrderVO;
import com.yedam.ordercomplete.service.CompleteService;
import com.yedam.ordercomplete.service.CompleteServiceImpl;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class OrderCompleteControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("ordercomplete페이지입니다.");
		if(req.getParameter("typecheck").equals("0")) {
			System.out.println("check=0");
			Date date = new Date();
			String orderId = String.valueOf(date.getTime());
			String userId = req.getParameter("userId");						//ok
			int payment = Integer.parseInt(req.getParameter("totalPrice"));//ok
			int orderPoint = Integer.parseInt(req.getParameter("totalSpoint"));
			int usePoint = Integer.parseInt(req.getParameter("usepoint"));
			int totalPriceEnd = Integer.parseInt(req.getParameter("totalPriceEnd"));
			System.out.println(totalPriceEnd);
			System.out.println("usePoint : "+usePoint);
			//배송상태(배송전중후)
			//orderdate
			int orderPost = Integer.parseInt(req.getParameter("userPost"));						//ok
			System.out.println("ordercheck1");
			String orderAddress = req.getParameter("userAddress");				//ok
			String orderName = req.getParameter("userName");						//ok
			System.out.println("ordercheck2");
			String orderPhone = req.getParameter("userPhone");
			String orderMethod = req.getParameter("remember");
			System.out.println("ordercheck3");
			String bookName = req.getParameter("bookName");
			System.out.println(bookName);
			String bookPrice = req.getParameter("bookPrice");
			int bookStock = Integer.parseInt(req.getParameter("basketCount"));
			if(bookStock == 1) {
				bookStock = 1;
			}
			System.out.println("bookStock = "+bookStock);
			System.out.println("ordercheck4");
			String coupon = req.getParameter("couponId");
			OrderVO vo = new OrderVO();
			System.out.println("ordercheck5");
			vo.setOrderId(orderId);
			vo.setUserId(userId);
			vo.setPayment(totalPriceEnd);
			vo.setOrderPoint(usePoint);
			//state,date
			vo.setOrderPost(orderPost);
			vo.setOrderAddress(orderAddress);
			vo.setOrderName(orderName);
			vo.setOrderPhone(orderPhone);
			vo.setMethod(orderMethod);
			CompleteService service = new CompleteServiceImpl();
			service.insertOrder(vo);
			BookVO bvo = new BookVO();
			bvo = service.selectbook(bookName);
			System.out.println(bvo);
			System.out.println(bookName);
			bvo.setBookStock(bookStock);
			service.updateBook(bvo);
			int userPoint = Integer.parseInt(req.getParameter("totalSpoint"));
			service.updateUser(userPoint,userId);
			service.updateUser((-usePoint), userId);
			//사용한 쿠폰 제거하는부분
			if(coupon!=null) {
				int couponId = Integer.parseInt(coupon);
				System.out.println("쿠폰 : "+couponId+" 이 사용되었습니다.");
				service.deleteCoupon(couponId);
			}else {
				System.out.println("쿠폰이 사용되지 않았습니다.");
			}
			bvo = service.selectbook(bookName);
			long isbn = bvo.getIsbn();
			int historyCount = bookStock;
			HistoryVO hvo = new HistoryVO();
			hvo.setOrderId(orderId);
			hvo.setIsbn(isbn);
			hvo.setHistoryCount(historyCount);
			service.insertHistory(hvo);
			System.out.println("단건구매완료");
		}else if(req.getParameter("typecheck").equals("1")) {
			System.out.println("check=1");
			Date date = new Date();
			String orderId = String.valueOf(date.getTime());
			String userId = req.getParameter("userId");						//ok
			int payment = Integer.parseInt(req.getParameter("totalPrice"));//ok
			int orderPoint = Integer.parseInt(req.getParameter("totalSpoint"));
			String usePoint1 = req.getParameter("usepoint");
			int usePoint =usePoint1== "" ? 0: Integer.parseInt(usePoint1);
			int totalPriceEnd = Integer.parseInt(req.getParameter("totalPriceEnd"));
			System.out.println(totalPriceEnd);
			System.out.println("usePoint : "+usePoint);
			//배송상태(배송전중후)
			//orderdate
			int orderPost = Integer.parseInt(req.getParameter("userPost"));						//ok
			String orderAddress = req.getParameter("userAddress");				//ok
			String orderName = req.getParameter("userName");						//ok
			String orderPhone = req.getParameter("userPhone");
			String orderMethod = req.getParameter("remember");
			//장바구니 id받아와야함
			String[] basketCount = req.getParameterValues("basketCount");
			String[] bookPrice = req.getParameterValues("bookPrice");
			String[] bookName = req.getParameterValues("bookName");	
			String[] basketsId = req.getParameterValues("basketId");
			String coupon = req.getParameter("couponId");
			int[] newbookPrice = new int[bookPrice.length];
			int[] basketId = new int[basketsId.length];
			int[] newbasketCount = new int[basketCount.length];
			for(int i=0;i<bookName.length;i++) {
				newbookPrice[i] = Integer.parseInt(bookPrice[i]);
				newbasketCount[i] = Integer.parseInt(basketCount[i]);
				System.out.println("책이름 : "+bookName[i]);
				String bookNames = bookName[i];
				System.out.println(bookNames);
			}
			OrderVO vo = new OrderVO();
			vo.setOrderId(orderId);
			vo.setUserId(userId);
			vo.setPayment(totalPriceEnd);
			vo.setOrderPoint(usePoint);
			//state,date
			vo.setOrderPost(orderPost);
			vo.setOrderAddress(orderAddress);
			vo.setOrderName(orderName);
			vo.setOrderPhone(orderPhone);
			vo.setMethod(orderMethod);
			CompleteService service = new CompleteServiceImpl();
			service.insertOrder(vo);
			service.updateUser(orderPoint,userId);
			service.updateUser((-usePoint), userId);
			//bookstock- 하는부분 updateBook
			for(int i=0;i<bookName.length;i++) {
				BookVO bvo = new BookVO();
				String bookNames = bookName[i];
				bvo = service.selectbook(bookNames);
				int bookStock = newbasketCount[i];
				bvo.setBookStock(bookStock);
				service.updateBook(bvo);
			}
			//userSpoint 업데이트 하는부분 updateUser
			UserVO uvo = new UserVO();
			int userPoint = Integer.parseInt(req.getParameter("totalSpoint"));
			service.updateUser(userPoint,userId);
			//사용한 쿠폰 제거하는부분
			if(coupon!=null) {
				int couponId = Integer.parseInt(coupon);
				System.out.println("쿠폰 : "+couponId+" 이 사용되었습니다.");
				service.deleteCoupon(couponId);
			}else {
				System.out.println("쿠폰이 사용되지 않았습니다.");
			}
			//구매한 장바구니 제거하는 부분
			if(basketId.length != 0) {
				for(int i=0;i<basketsId.length;i++) {
					basketId[i] = Integer.parseInt(basketsId[i]);
					service.deleteBasket(basketId[i]);
				}
			}
			//history insert작성 history_count > 구매한 도서개수
			//순서 : orderId, isbn, basketcount 가 여러개 쌓여야함
			if(basketCount.length != 0) {
				for(int i=0;i<basketCount.length;i++) {
					BookVO bvo = new BookVO();
					String bookNames = bookName[i];
					bvo = service.selectbook(bookNames);
					long isbn = bvo.getIsbn();
					int historyCount = Integer.parseInt(basketCount[i]);
					HistoryVO hvo = new HistoryVO();
					hvo.setOrderId(orderId);
					hvo.setIsbn(isbn);
					hvo.setHistoryCount(historyCount);
					service.insertHistory(hvo);
				}
			}
		}
		//만들어야하는 query문
		//orders table값 넣기, historys table값 넣기 <<insert문
		//books bookstock값 수정, userpoint 사용한거빼고 쌓이는 포인트 추가 <<update
		//coupons table 사용한 쿠폰 제거, baskets table 구매한 도서 제거 <<delete
		HttpSession session = req.getSession();
		UserVO vo = (UserVO) session.getAttribute("sesInfo");
		session.removeAttribute("sesInfo");
		UserService service = new UserServiceImpl();
		vo = service.login(vo);
		session.setAttribute("sesInfo", vo);
		return "ordercomplete.tiles";
	}

}
