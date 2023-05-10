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
<div style="height:800px">
	<div style="width: 1100px;">
		<p></p>
		<p style="width: 700px; text-align: right; display: inline-block">step01</p>
		<p style="width: 100px; text-align: right; display: inline-block">step02</p>
		<p style="width: 100px; text-align: right; display: inline-block">step03</p>
		<p style="width: 100px; text-align: right; display: inline-block; color: red; font-weight: 700">step04</p>
		<p></p>
		<p style="width: 705px; text-align: right; display: inline-block">장바구니</p>
		<p style="width: 100px; text-align: right; display: inline-block">배송정보</p>
		<p style="width: 100px; text-align: right; display: inline-block">결제정보</p>
		<p style="width: 100px; text-align: right; display: inline-block; color: red; font-weight: 700">주문완료</p>
	</div>
	<div style="padding-top:100px">
	<div id="normarborderstyle" style="width:600px;height:200px;margin:0 auto">
		<table style="margin:0 auto">
			<tr>
				<td style="padding-top:70px;text-align:center">결재가 성공적으로 완료되었습니다</td></tr>
	 			<tr><td style="text-align:center">상세정보는 마이페이지><a href='myPageMain.do'>주문정보</a>에서 확인할 수 있습니다</td>
			</tr>
		</table>
	</div>
	</div>
	<div style="text-align:right; padding-right:200px; padding-top:30px; padding-bottom:30px">
		<button type="button" value="홈으로" onclick="location.href='main.do';">홈으로</button>
	</div>
	<div id="MOVE_TOP_BTN">
		<a href="#"><div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
				<p style="font-size: 12px; position: absolute; top: 15px; left: 15px;">top</p>
			</div></a> <a href="#"><div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
				<p style="font-size: 12px; position: absolute; top: 15px; left: 5px;">로그인</p>
			</div></a> <a href="#"><div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
				<p style="font-size: 10px; position: absolute; top: 15px; left: 5px;">회원가입</p>
			</div></a>
	</div>
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