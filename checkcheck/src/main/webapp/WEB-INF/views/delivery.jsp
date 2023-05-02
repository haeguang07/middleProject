<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 05-02 김영환 -->
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
</head>
<div style="width: 1100px;">
	<p></p>
	<p style="width: 700px; text-align: right; display: inline-block">step01</p>
	<p style="width: 100px; text-align: right; display: inline-block; color: red; font-weight: 700">step02</p>
	<p style="width: 100px; text-align: right; display: inline-block">step03</p>
	<p style="width: 100px; text-align: right; display: inline-block">step04</p>
	<p></p>
	<p style="width: 705px; text-align: right; display: inline-block">장바구니</p>
	<p style="width: 100px; text-align: right; display: inline-block; color: red; font-weight: 700">배송정보</p>
	<p style="width: 100px; text-align: right; display: inline-block">결제정보</p>
	<p style="width: 100px; text-align: right; display: inline-block">주문완료</p>
</div>
<div style="text-align: center;margin: 0 auto">
	<div id="divdelivery" style="margin: 0 auto">
		<table style="width: 900px;margin: 0 auto">
			<tr>
				<td style="width: 500px; text-align: center; display: inline-block">상품명</td>
				<td style="width: 180px; text-align: center; display: inline-block">가격/포인트</td>
				<td style="width: 150px; text-align: center; display: inline-block">수량</td>
			</tr>
			<tr>
				<td style="width: 500px; text-align: center; display: inline-block">셰임 머신 - 수치심이 탄생시킨 혐오 시대, 그 이면의 거대 산업 생태계</td>
				<td style="width: 180px; text-align: center; display: inline-block">16,650원/832p</td>
				<td style="width: 150px; text-align: center; display: inline-block">1</td>
			</tr>
		</table>
	</div>
	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4" style="margin: 0 auto">

		<form action="" method="post"
			style="position: relative; width: 300px; text-align: center; display: inline-block">
			<table>
				<tr>
					<td style="width: 250px" style="word-break:break-all">배송지 정보<br></td></tr>
					<tr><td style="width: 250px;height:50px;word-break: break-all">주문인</td></tr>
					
					<tr><td style="width: 250px;height:50px;word-break: break-all">주소</td></tr>
					<tr><td style="width: 250px;height:50px;word-break: break-all">나머지주소</td></tr>
					<tr><td style="width: 250px;height:50px;word-break: break-all">휴대전화번호</td>
				</tr>
				
			</table>
		</form>
		<form action="" method="post"
			style="position: relative; width: 500px; text-align: center; display: inline-block;margin: 0 auto">
			<table>
				<tr><td style="width: 200px;height:30px"></td></tr>
				<tr><td style="width: 200px;height:40px;word-break:break-all">김영환</td></tr>
				<tr><td style="width: 400px;height:50px;word-break:break-all">대구 광역시 중구 중앙대로 403</td></tr>
				<tr><td style="width: 400px;height:50px;word-break:break-all">5층 예담 직업전문학교</td></tr>
				<tr><td style="width: 400px;height:55px;word-break:break-all">010-1234-5678</td></tr>
			</table>
		</form>
	</div>
</div>
<div id="MOVE_TOP_BTN">
	<a href="#"><div
			style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
			<p style="font-size: 12px; position: absolute; top: 15px; left: 15px;">top</p>
		</div></a> <a href="#"><div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
			<p style="font-size: 12px; position: absolute; top: 15px; left: 5px;">로그인</p>
		</div></a> <a href="#"><div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
			<p style="font-size: 10px; position: absolute; top: 15px; left: 5px;">회원가입</p>
		</div></a>
</div>
<!-- Footer-->
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
	function selectAll(selectAll)  {
		  const checkboxes 
		     = document.querySelectorAll('input[type="checkbox"]');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
</script>