<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- Navigation-->
<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<input type='checkbox' name='animal' value='selectall'
			onclick='selectAll(this)' style="padding-bottom:5px"/> <b>전체선택</b>
			<p></p>
			<p style="width:300px; text-align:right; display:inline-block">도서제목</p>
			<p style="width:150px; text-align:right; display:inline-block">가격</p>
			<p style="width:270px; text-align:right; display:inline-block">수량</p>
			<p style="width:260px; text-align:right; display:inline-block">삭제</p>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
		    <c:forEach var="i" items="${list }">
				<form action="" method="post"style="position: relative; width: 1100px; text-align:center">
					<table>
						<tr>
							<td><input type="checkbox" checked="checked" name="remember" style="margin: 15px"></td>
							<td rowspan="5"><img src="${i.cover }"
								style="width: 150px; height: 150px"></td>
							<td style="width: 200px" style="word-break:break-all">${i.bookName }
							</td>
							<td style="padding: 0 40px; width: 300px; word-break: break-all">정가
								: ${i.bookPrice }원<br>포인트 : ${i.bookPrice*0.05 }p
							</td>
							<td id="td" style="padding: 0 40px; width: 400px; word-break: break-all">
								<input type='button' onclick='count("plus")' value='+'/>
								<input type='button' onclick='count("minus")' value='-'/>
								<div id='buycount'>0</div>
							</td>
							<td style="padding: 0 40px; width: 200px; word-break: break-all">
								<input type="reset"></input>
							</td>
						</tr>
					</table>
				</form>
			</c:forEach>
		</div>
		<div class="container px-4 px-lg-5 mt-5" style="text-align: center">
			<div id="basketform"
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4"
				style="text-align: center; display: inline-block">
				<form class="form-inline center" role="form" action="" method="post"
					style="text-align: center; width: 500px;">
					<p>현재주소
						<input type="submit" value="변경" style="padding:5px 15px"></input><br>
						대구 광역시 중구 중앙대로 403 5층 예담 직업전문학교<br><br>
						총 상품 가격 : ${bookPrice }원<br>
						상품 포인트 : ${bookPrice*0.05 }p<br> 예상 총 포인트 : 9,467원<br><br>
						VIP : 3% VVIP : 5%<br><br>
						<input type="submit" value="주문" style="padding:5px 15px" onclick="waitpayment.do?"></input>
						<input type="submit" value="선물" style="padding:5px 15px"></input>
						<input type="submit" value="삭제" style="padding:5px 15px"></input>
					</p>
				</form>
			</div>
		</div>
	</div>
</section>
<div id="MOVE_TOP_BTN">
	<a href="#">
		<div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
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
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('buycount');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}

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