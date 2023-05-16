package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.admin.control.AddAnnoControl;
import com.yedam.admin.control.AddBookControl;
import com.yedam.admin.control.AdminInquiryInfoControl;
import com.yedam.admin.control.AnnoUploadControl;
import com.yedam.admin.control.BookStockControl;
import com.yedam.admin.control.ChartControl;
import com.yedam.admin.control.ChartDataControl;
import com.yedam.admin.control.ChulgoControl;
import com.yedam.admin.control.InquiryAnswerFormControl;
import com.yedam.admin.control.ModifyStockControl;
import com.yedam.admin.control.WriteAnnoControl;
import com.yedam.basket.control.AddBasketControl;
import com.yedam.basket.control.BasketControl;
import com.yedam.basket.control.BasketDeleteControl;
import com.yedam.basket.control.BasketDeliveryControl;
import com.yedam.board.control.AnnounceForAjaxControl;
import com.yedam.board.control.AnnouncementControl;
import com.yedam.board.control.CkeditorControl;
import com.yedam.board.control.InquiryAddControl;
import com.yedam.board.control.MypageinquiryControl;
import com.yedam.board.control.NoAnwserboard2Control;
import com.yedam.board.control.RemoveAnnoControl;
import com.yedam.board.control.SearchAnnoControl;
import com.yedam.board.control.inquiryInfoControl;
import com.yedam.book.control.BestSellerControl;
import com.yedam.book.control.GetStockCountControl;
import com.yedam.book.control.HitCountControl;
import com.yedam.book.control.InsertBookControl;
import com.yedam.book.control.NewBookSearchControl;
import com.yedam.comment.control.InquiryClickControl;
import com.yedam.comment.control.addAnswerControl;
import com.yedam.coupon.control.CouponInfoControl;
import com.yedam.event.contorl.AddEventControl;
import com.yedam.event.contorl.EventControl;
import com.yedam.event.contorl.EventFormControl;
import com.yedam.order.control.CancelOrderControl;
import com.yedam.order.control.ModifyOrderStateControl;
import com.yedam.order.control.ModifyShippingControl;
import com.yedam.order.control.ModifyShippingFormControl;
import com.yedam.order.control.OrderCancelFormControl;
import com.yedam.order.control.OrderPresentFormControl;
import com.yedam.order.control.PointInfoControl;
import com.yedam.order.control.ShipingInfoControl;
import com.yedam.order.control.myPageOrderControl;
import com.yedam.ordercomplete.control.OrderCompleteControl;
import com.yedam.payment.control.WaitPaymentControl;
import com.yedam.review.control.AddReviewControl;
import com.yedam.review.control.DeleteReviewContorl;
import com.yedam.review.control.ModifyReviewControl;
import com.yedam.review.control.ReviewControl;
import com.yedam.review.control.UserReviewFormControl;
import com.yedam.user.control.AdrChageContorl;
import com.yedam.user.control.BoardControl;
import com.yedam.user.control.BoardDetailControl;
import com.yedam.user.control.CheckEmailControl;
import com.yedam.user.control.DeliveryControl;
import com.yedam.user.control.GetBookControl;
import com.yedam.user.control.JoinControl;
import com.yedam.user.control.JoinFormControl;
import com.yedam.user.control.LoginControl;
import com.yedam.user.control.MypageUserInfoControl;
import com.yedam.user.control.NickChageContorl;
import com.yedam.user.control.NickCheckControl;
import com.yedam.user.control.PresentControl;
import com.yedam.user.control.PwChageContorl;
import com.yedam.user.control.SearchPageControl;
import com.yedam.user.control.UserIdCheckControl;
import com.yedam.user.control.idPwFindContorl;
import com.yedam.user.control.logoutContorl;
import com.yedam.user.control.mainControl;
import com.yedam.user.control.modifyUserFormControl;

public class FrontController extends HttpServlet {
	private Map<String, Control> map;
	String encoding;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		encoding = config.getInitParameter("enc");
		map.put("/main.do", new mainControl());
		// 관리자 통계페이지
		map.put("/chart.do", new ChartControl());
		//관리자 통계 데이터(json)
		map.put("/chartData.do", new ChartDataControl());
		// 관리자 출고상태 변경기능
		map.put("/chulgo.do", new ChulgoControl());
		map.put("/modifyOrderState.do", new ModifyOrderStateControl());
		// 관리자 도서 추가 기능
		map.put("/addBook.do", new AddBookControl());
		// 관리자 도서추가기능
		map.put("/insertbook.do", new InsertBookControl());
		// 관리자 재고관리 기능
		map.put("/bookStock.do", new BookStockControl());
		map.put("/modifyStock.do",new ModifyStockControl());
		map.put("/getStockCount.do", new GetStockCountControl());
		// 05-03 관리자 문의내용 페이지
		map.put("/adminInquiryInfo.do", new AdminInquiryInfoControl());
		//문의내용 미답변기능
		map.put("/noAnwserboard2.do", new NoAnwserboard2Control());
		// 05-03 관리자 문의작성 페이지
		map.put("/inquiryAnswerForm.do", new InquiryAnswerFormControl());
		//관리자 문의 답변 기능
		map.put("/addAnswer.do", new addAnswerControl());
		// 05-05 nav 의 베스트셀러 항목 누를시 베스트셀러 보여줌
		map.put("/bestSeller.do", new BestSellerControl());
		// 05-07 화제의책 searchpage
		map.put("/hitCount.do", new HitCountControl());
		// 05-07 신간 searchpage
		map.put("/newBookSearch.do", new NewBookSearchControl());
		// 검색 기능
		map.put("/search.do", new SearchPageControl());
		// 상세페이지 기능
		map.put("/getBook.do", new GetBookControl());
		map.put("/review.do", new ReviewControl());
		map.put("/modifyReview.do", new ModifyReviewControl());
		map.put("/addReview.do", new AddReviewControl());

		//공지사항 페이지
		map.put("/announcement.do",new AnnouncementControl());
		map.put("/announceForAjax.do", new AnnounceForAjaxControl());
		map.put("/removeAnno.do",new RemoveAnnoControl());
		map.put("/searchAnno.do", new SearchAnnoControl());
		map.put("/writeAnno.do", new WriteAnnoControl());
		map.put("/annoUpload.do", new AnnoUploadControl());
		map.put("/addAnno.do", new AddAnnoControl());
		
		//05-02 장바구니페이지 김영환 - css더 다듬어야함 기능깔끔하게 넣어야함
		map.put("/basket.do", new BasketControl());
		// 05-02 배송정보페이지 김영환 - css더 다듬어야함 기능넣어야됨
		map.put("/delivery.do", new DeliveryControl());
		// 05-02 결제페이지 김영환 - css더 다듬어야함 기능넣어야됨
		map.put("/waitpayment.do", new WaitPaymentControl());
		
		//이벤트화면
		map.put("/eventForm.do", new EventFormControl());
		//이벤트 리스트
		map.put("/event.do", new EventControl());
		//출석체크
		map.put("/addEvent.do", new AddEventControl());
		
		// 로그인 기능(get:화면으로, post:로그인 기능)
		map.put("/login.do", new LoginControl());
		// 로그아웃 기능
		map.put("/logout.do", new logoutContorl());
		// 05-02회원가입 기능
		map.put("/joinForm.do", new JoinFormControl());
		//아이디 중복체크
		map.put("/userIdCheck.do", new UserIdCheckControl());
		//닉네임 중복체크
		map.put("/nickCheck.do", new NickCheckControl());
		// 05-03회원가입의 이메일보내기
		map.put("/checkEmail.do", new CheckEmailControl());
		// 05-02회원가입 기능
		map.put("/join.do", new JoinControl());
		//아이디 패스워드 찾기
		map.put("/idPwFind.do", new idPwFindContorl());

		// 05-02마이페이지 이동(주문 조회로)
		map.put("/myPageMain.do", new myPageOrderControl());
		// 05-02개인정보수정(get:화면1), post:(비밀번호확인용)
		map.put("/myPageUserInfo.do", new MypageUserInfoControl());
		// 개인정보 수정페이지
		map.put("/modifyUserForm.do", new modifyUserFormControl());
		// 개인정보수정-닉네임
		map.put("/nickChange.do", new NickChageContorl());
		// 개인정보수정-주소
		map.put("/adrChange.do", new AdrChageContorl());
		// 개인정보수정-비밀번호
		map.put("/pwChange.do", new PwChageContorl());
		// 05-03 마이페이지->주문조회 상세
		map.put("/shippingInfo.do", new ShipingInfoControl());
		// 마이페이지->주문조회-> 변경/취소 회면
		map.put("/modifyShippingForm.do", new ModifyShippingFormControl());
		// 마이페이지->주문조회-> 변경/취소 회면->변경기능
		map.put("/modifyShipping.do", new ModifyShippingControl());
		// 마이페이지->주문조회-> 변경/취소 회면->취소기능
		map.put("/cancleOrder.do", new CancelOrderControl());
		// 마이페이지 -> 취소 주문조회
		map.put("/orderCancelForm.do", new OrderCancelFormControl());
		// 마이페이지 -> 취소 주문조회
		map.put("/orderPresentForm.do", new OrderPresentFormControl());

		// 05-03 마이페이지->마이리뷰
		map.put("/userReviewForm.do", new UserReviewFormControl());
		// 마이리뷰-> 리뷰삭제기능
		map.put("/deleteReview.do", new DeleteReviewContorl());
		// 05-03 마이페이지->쿠폰 정보
		map.put("/couponInfo.do", new CouponInfoControl());
		// 05-03 마이페이지->포인트정보
		map.put("/pointInfo.do", new PointInfoControl());
		// 05-03 마이페이지->문의내역
		map.put("/inquiryInfo.do", new inquiryInfoControl());

		// ckeditor fileUpload
		map.put("/ckeditor.do", new CkeditorControl());

		// 05-02 주문완료페이지 - css더 다듬어야함 기능(홈으로 누르면 메인페이지가는 링크, 주문정보 누르면 다른페이지로 이동하는링크)
		// 05-03 마이페이지->쿠폰 정보
		map.put("/couponInfo.do", new CouponInfoControl());
		// 05-03 마이페이지->포인트정보
		map.put("/pointInfo.do", new PointInfoControl());
		// 05-03 마이페이지->문의내역 페이지 이동
		map.put("/myPageinquiry.do", new MypageinquiryControl());
		// 마이페이지 문의 내역(페이징)
		map.put("/inquiryInfo.do", new inquiryInfoControl());
		// 문의내역 추가
		map.put("/inquiryAdd.do", new InquiryAddControl());
		map.put("/inquiryClick.do", new InquiryClickControl());
		

		// 05-02 장바구니페이지
		map.put("/basket.do", new BasketControl());
		// 05-02 주문완료페이지 - css더 다듬어야함 기능(홈으로 누르면 메인페이지가는 링크, 주문정보 누르면 다른페이지로 이동하는링크)
		map.put("/ordercomplete.do", new OrderCompleteControl());
		// 05-02 공지사항목록페이지
		map.put("/board.do", new BoardControl());
		// 05-03 공지상세페이지
		map.put("/boarddetail.do", new BoardDetailControl());
		// 05-09 선물페이지
		map.put("/present.do", new PresentControl());
		// 장바구니 추가
		map.put("/addBasket.do", new AddBasketControl());
		//배송지,장바구니데이터
		map.put("/basketDelivery.do", new BasketDeliveryControl());
		//장바구니 목록제거
		map.put("/basketDelete.do", new BasketDeleteControl());
	}
	


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());
		System.out.println(path);

		// 페이지 정보 받는곳
		Control control = map.get(path);
		String viewPage = control.execute(req, resp);
		System.out.println("프론트컨트롤러의 service입니다" + viewPage);

		if (viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage);
			return;
		}
		if (viewPage.endsWith(".json")) {
			resp.setContentType("text/json;charset=UTF-8");
			resp.getWriter().print(viewPage.substring(0, viewPage.length() - 5));
			return;
		}
		// 페이지 포워딩 넣어야됨 (json,.do형태다 사용)
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);

	}

}
