<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<p style="width: 100px; text-align: right; display: inline-block">step02</p>
	<p style="width: 100px; text-align: right; display: inline-block; color: red; font-weight: 700">step03</p>
	<p style="width: 100px; text-align: right; display: inline-block">step04</p>
	<p></p>
	<p style="width: 705px; text-align: right; display: inline-block">장바구니</p>
	<p style="width: 100px; text-align: right; display: inline-block">배송정보</p>
	<p style="width: 100px; text-align: right; display: inline-block; color: red; font-weight: 700">결제정보</p>
	<p style="width: 100px; text-align: right; display: inline-block">주문완료</p>
</div>
<c:if test="${'0' eq check }">
	<form method="post"style="position: relative; width: 1100px;">
		<div>
			<input style="display:none" name="typecheck" value="0">
			<input type="text" style="display:none" name="userId" value="${userId }">
			<input type="text" style="display:none" name="userName" value="${userName }">
			<input type="text" style="display:none" name="userAddress" value="${address }">
			<input type="text" style="display:none" name="userPost" value="${post }">
			<input type="text" style="display:none" name="userPhone" value="${phone }">
			<input type="text" style="display:none" name="bookName" value="${bookName }">
			<input type="text" style="display:none" name="bookPrice" value="${bookPrice }">
			<input type="text" style="display:none" name="basketCount" value="${basketCount }">
			<select id="coupons" name="couponId" onchange=couponFuntion(this)>
			<option name="couponId" id="0" value="0">사용할쿠폰선택</option>
				<c:forEach var="i" items="${clist }">
					<option name="couponId" id="${i.discount }" value="${i.couponId }"><fmt:formatNumber value="${i.discount*100}"/>%할인쿠폰</option>
				</c:forEach>
			</select>
		</div>
		<div style="text-align: center; width:900px">
			<p style="display:inline-block">사용할포인트<input id="usepoint" name="usepoint" type="text" value="0" onchange=couponFuntion(this)></p>
			<p style="padding-left:200px; display:inline-block">현재 사용가능한 포인트 : ${userPoint }</p>
		</div>
		<div>
			<p>결제수단 결정</p>
		</div>
		<div style="margin:0 auto">
			<table>
				<tr>
					<td><input type="radio" name="remember" style="margin: 15px" value="카카오"><b>카카오</b></td>
					<td><input type="radio" name="remember" style="margin: 15px" value="네이버"><b>네이버</b></td>
					<td><input type="radio" name="remember" style="margin: 15px" value="토스"><b>토스</b></td>
				</tr><tr>
					<td><input type="radio" name="remember" style="margin: 15px" value="신용카드"><b>신용카드</b></td>
					<td><input type="radio" name="remember" style="margin: 15px" value="계좌이체"><b>계좌이체</b></td>
					<td><input type="radio" name="remember" style="margin: 15px" value="페이코"><b>페이코</b></td>
				</tr>
			</table>
		</div>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4" style="width:800px; margin:0 auto">
		  <table>
		  	<c:choose>
				<c:when test="${userGrade eq 'normal' }">
				<fmt:parseNumber var="totalSpoint" integerOnly="true" value= "${(totalPrice*0.01) }"/>
				</c:when>
				<c:when test="${userGrade eq 'VIP' }">
				<fmt:parseNumber var="totalSpoint" integerOnly="true" value= "${(totalPrice*0.03) }"/>
				</c:when>
				<c:when test="${userGrade eq 'VVIP' }">
				<fmt:parseNumber var="totalSpoint" integerOnly="true" value= "${(totalPrice*0.05) }"/>
				</c:when>
			</c:choose>
			<tr><td>총 가격 : <input type="text" id="totalPrice" name="totalPrice" style="width:100px;border:none" value="${(bookPrice*1)*(basketCount*1) }"></td></tr>
			<tr><td>적립금액 : <input type="text" id="totalSpoint" name="totalSpoint" style="width:100px;border:none" value="${(totalSpoint*1)*(basketCount*1) }"></td></tr>
			<tr><td>총할인금액 : <input type="text" id="totalSSpoint" style="width:150px;border:none" value=""></td></tr>
			<tr><td>결제금액 : <input type="text" name="totalPriceEnd" id="totalPriceCount" style="width:100px;border:none" value=""></td></tr>
		  </table>
		</div>
		<div style="text-align:right; padding-right:200px; padding-top:30px; padding-bottom:30px">
			<input id="payMent" type="submit" value="결제하기" style="padding:5px 15px" onclick="javascript: form.action='ordercomplete.do';"/>
		</div>
	</form>
</c:if>
<c:if test="${'1' eq check }">
	<form method="post"style="position: relative; width: 1100px;">
		<div>
			<input style="display:none" name="typecheck" value="1">
			<input type="text" style="display:none" name="userId" value="${userId }">
			<input type="text" style="display:none" name="userName" value="${userName }">
			<input type="text" style="display:none" name="userAddress" value="${address }">
			<input type="text" style="display:none" name="userPost" value="${post }">
			<input type="text" style="display:none" name="userPhone" value="${phone }">
			<c:forEach var="i" items="${blist }">
				<input type="text" style="display:none" name="bookName" value="${i.bookName }">
				<input type="text" style="display:none" name="basketCount" value="${i.basketCount }">
				<input type="text" style="display:none" name="bookPrice" value="${i.bookPrice }">
				<input type="text" style="display:none" name="basketId" value="${i.basketId }">
			</c:forEach>
			<select id="coupons" name="couponId" onchange=couponFuntion(this)>
			<option name="couponId" id="0" value="0">사용할쿠폰선택</option>
				<c:forEach var="i" items="${clist }">
					<option name="${i.discount }" id="${i.discount }" value="${i.couponId }"><fmt:formatNumber value="${i.discount*100}"/>%할인쿠폰</option>
				</c:forEach>
			</select>
		</div>
		<div style="text-align: center; width:900px">
			<p style="display:inline-block">사용할포인트<input id="usepoint" name="usepoint" type="text" value="0"  onchange=couponFuntion(this)></p>
			<p style="padding-left:200px; display:inline-block">현재 사용가능한 포인트 : ${userPoint }</p>
		</div>
		<div>
			<p>결제수단 결정</p>
		</div>
		<div style="margin:0 auto">
			<table>
				<tr>
					<td><input type="radio" name="remember" style="margin: 15px" value="카카오"><b>카카오</b></td>
					<td><input type="radio" name="remember" style="margin: 15px" value="네이버"><b>네이버</b></td>
					<td><input type="radio" name="remember" style="margin: 15px" value="토스"><b>토스</b></td>
				</tr><tr>
					<td><input type="radio" name="remember" style="margin: 15px" value="신용카드"><b>신용카드</b></td>
					<td><input type="radio" name="remember" style="margin: 15px" value="계좌이체"><b>계좌이체</b></td>
					<td><input type="radio" name="remember" style="margin: 15px" value="페이코"><b>페이코</b></td>
				</tr>
			</table>
		</div>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4" style="width:800px; margin:0 auto">
		  <table>
		  	<c:choose>
				<c:when test="${userGrade eq 'normal' }">
				<fmt:parseNumber var="totalSpoint" integerOnly="true" value= "${(totalPrice*0.01) }"/>
				</c:when>
				<c:when test="${userGrade eq 'VIP' }">
				<fmt:parseNumber var="totalSpoint" integerOnly="true" value= "${(totalPrice*0.03) }"/>
				</c:when>
				<c:when test="${userGrade eq 'VVIP' }">
				<fmt:parseNumber var="totalSpoint" integerOnly="true" value= "${(totalPrice*0.05) }"/>
				</c:when>
			</c:choose>
			<tr><td>총 가격 : <input type="text" id="totalPrice" name="totalPrice" style="width:100px;border:none" value="${totalPrice }"></td></tr>
			<tr><td>적립금액 : <input type="text" id="totalSpoint" name="totalSpoint" style="width:100px;border:none" value="${totalSpoint }"></td></tr>
			<tr><td>총할인금액 : <input type="text" id="totalSSpoint" style="width:150px;border:none" value=""></td></tr>
			<tr><td>결제금액 : <input type="text" name="totalPriceEnd" id="totalPriceCount" style="width:100px;border:none" value=""></td></tr>
		  </table>
		</div>
		<div style="text-align:right; padding-right:200px; padding-top:30px; padding-bottom:30px">
			<input id="payMent" type="submit" value="결제하기" style="padding:5px 15px" onclick="javascript: form.action='ordercomplete.do';"/>
		</div>
	</form>
</c:if>
<div id="MOVE_TOP_BTN">
	<a href="#"><div style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
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
const result = document.getElementById('totalSSpoint');
const resultPrice = document.getElementById('totalPriceCount');
let totalPriceCount = document.getElementById('totalPriceCount');
console.log(result);
function couponFuntion(coupons){
	console.log(coupons);
	var coupons = document.getElementById('coupons');
    var option = coupons.options[coupons.selectedIndex];
    let value = option.value;
    console.log(value);
    let text = option.text;
    console.log(text);
	let id = option.id;
	console.log(id);
	let totalSSpoint = document.getElementById('totalSSpoint').value;
	let totalSpoint = document.getElementById('totalSpoint').value;
	let usePoint = document.getElementById('usepoint').value;
	usePoint = usePoint== ""? 0: usePoint;
	console.log(usePoint);
	totalSSpoint = 0;
	result.value = 0;
	let totalPrice = document.getElementById('totalPrice').value;
	console.log(totalPrice);
	totalSSpoint = ((totalPrice*id)*1)+(usePoint*1);
	console.log(totalSSpoint);
	result.value = totalSSpoint;
	resultPrice.value = (totalPrice*1)-(totalSSpoint*1);
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