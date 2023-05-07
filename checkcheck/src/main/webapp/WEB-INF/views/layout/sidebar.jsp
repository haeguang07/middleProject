<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div
	style=" border: 1px black solid; margin: 5px; height: 500px; float: left; display: block;">
	<p id="hoverkorea" style="display: inline-block; margin: 0 20px">마이페이지</p>
	<ul id="mypage_sidebar" style="list-style: none;">
		<li>회원정보관리</li>
		<li><a href="myPageUserInfo.do">개인정보 수정</a></li>
		<li><a href="userReviewForm.do">마이리뷰</a></li>
		<li>통장</li>
		<li><a href="couponInfo.do">쿠폰 </a>${coupon }장</li>
		<li><a href="pointInfo.do">포인트 </a>${sesInfo.userPoint }p</li>
		<li>주문내역</li>
		<li><a href="myPageMain.do">주문 조회</a></li>
		<li><a href="#!">취소 주문 내역</a></li>
		<li><a href="#!">선물 내역</a></li>
		<li><a href="inquiryInfo.do">문의내역</a></li>
	</ul>
</div>