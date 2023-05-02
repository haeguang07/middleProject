<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 05-02 김영환 -->
<html lang="en"></html>
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
<div style="width:800px; margin:0 auto">
	<table>
		<tr style="display:inline-block">
			<td style="padding-left:20px; font-weight: 700">공지사항</td></tr>
			<tr style="display:inline-block; padding-left:600px"><td><button type="submit" value="공지작성">공지작성</button></td></tr>
	</table>
	<table id="normarborderstyle">
		<tr style="display:inline-block"><td style="padding:0 20px">번호</td></tr>
		<tr style="display:inline-block; padding-left:20px"><td style="padding:0 30px">작성자</td></tr>
		<tr style="display:inline-block; padding-left:30px"><td style="padding:0 155px">작성제목</td></tr>
		<tr style="display:inline-block; padding-left:30px"><td style="padding:0 50px">작성일</td></tr>
	</table>
	<table id="normarborderstyle">
		<tr id="normarborderstyle" style="display:inline-block"><td style="width:100px;text-align:left;padding:0 30px">3</td></tr>
		<tr id="normarborderstyle" style="display:inline-block; padding-left:10px"><td style="width:100px">김영환</td></tr>
		<tr id="normarborderstyle" style="display:inline-block; padding-left:10px"><td style="width:445px">이거왜안됨</td></tr>
		<tr id="normarborderstyle" style="display:inline-block; padding-left:10px"><td style="width:100px;text-align:right">2023-05-02</td></tr>
	</table>
	<table id="normarborderstyle">
		<tr id="normarborderstyle" style="display:inline-block"><td style="width:100px;text-align:left;padding:0 30px">2</td></tr>
		<tr id="normarborderstyle" style="display:inline-block; padding-left:10px"><td style="width:100px">김태연</td></tr>
		<tr id="normarborderstyle" style="display:inline-block; padding-left:10px"><td style="width:445px">제대로 만들어진게 맞나?</td></tr>
		<tr id="normarborderstyle" style="display:inline-block; padding-left:10px"><td style="width:100px;text-align:right">2022-05-02</td></tr>
	</table>
	<table id="normarborderstyle">
		<tr id="normarborderstyle" style="display:inline-block"><td style="padding:0 30px;width:100px;text-align:left">1</td></tr>
		<tr id="normarborderstyle" style="display:inline-block; padding-left:10px"><td style="width:100px">정해광</td></tr>
		<tr id="normarborderstyle" style="display:inline-block; padding-left:10px"><td style="width:445px">모양 대충 적용시킴</td></tr>
		<tr id="normarborderstyle" style="display:inline-block; padding-left:10px"><td style="width:100px;text-align:right">2022-02-01</td></tr>
	</table>
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