<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	a{
		text-decoration: none;
	}
</style>
<div style=" border: 1px black solid; margin: 5px; width:190px; background: linear-gradient(to top,#FFF8F2 80%,#19A7CE);margin: 0 auto; ">
	<br>
	<div style="text-align: center;">
	<p id="hoverkorea" style="display: inline-block; margin: 0 20px; color: #ffffff;font-size: 1.1em;"><b>마이페이지</b></p>
	</div>
	 <br>
	<ul id="mypage_sidebar" style="list-style: none; padding-left: 10px">
		<li>회원정보관리
			<ul> 
				<li><a href="myPageUserInfo.do">개인정보 수정</a></li>
				<li><a href="userReviewForm.do">마이리뷰</a></li>
			</ul>
		</li>
		<li>통장
			<ul>
				<li><a href="couponInfo.do">쿠폰 </a></li>
				<li><a href="pointInfo.do">포인트 </a></li>
			</ul>
		</li>
		
		<li>주문내역
			<ul>
				<li><a href="myPageMain.do">주문 조회</a></li>
				<li><a href="orderCancelForm.do">취소 주문 내역</a></li>
				<li><a href="orderPresentForm.do">선물 내역</a></li>
				<li><a href="myPageinquiry.do">문의내역</a></li>
			</ul>
		</li>
		
	</ul>
</div>
