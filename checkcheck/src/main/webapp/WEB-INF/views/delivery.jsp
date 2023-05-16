<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<style>
		#Address{
			width:400px;
		}
		.left td{
			text-align: left;
		}
	</style>
</head>
<div style="width: 1100px;">
	<p></p>
	<p style="width: 700px; text-align: right; display: inline-block">step01</p>
	<p
		style="width: 100px; text-align: right; display: inline-block; color: red; font-weight: 700">step02</p>
	<p style="width: 100px; text-align: right; display: inline-block">step03</p>
	<p style="width: 100px; text-align: right; display: inline-block">step04</p>
	<p></p>
	<p style="width: 705px; text-align: right; display: inline-block">장바구니</p>
	<p
		style="width: 100px; text-align: right; display: inline-block; color: red; font-weight: 700">배송정보</p>
	<p style="width: 100px; text-align: right; display: inline-block">결제정보</p>
	<p style="width: 100px; text-align: right; display: inline-block">주문완료</p>
</div>
<div style="width: 1100px; text-align: center">
<c:if test="${'0' eq check }">
<form method="post"
	style="position: relative; text-align: center; display: inline-block">
	<fieldset>
		<div style="text-align: center; margin: 0 auto">
			<div id="divdelivery" style="margin: 0 auto">
			<input style="display:none" name="typecheck" value="0">
			<input style="display:none" name="presentcheck" value="0">
				<table style="width: 900px; margin: 0 auto">
					<tr>
						<td style="width: 40%; text-align: center;">상품명</td>
						<td style="width: 30%; text-align: center;">가격/포인트</td>
						<td style="width: 30%; text-align: center;">수량</td>
					</tr>
						<tr>
							<td><input type="text" name="bookName" id="bookName" readonly value="${bookName }"></td>
							<td style="text-align:center"><input type="text" name="bookPrice" id="bookPrice" style="text-align: center;border:none;width:80px" value="${bookPrice }">/
							<c:if test="${'normal' eq grade }">
								<input type="text" style="text-align: center;border:none;width:50px" value="${(bookPrice*0.01)*1 }"></td>
							</c:if>
							<c:if test="${'VIP' eq grade }">
								<input type="text" style="text-align: center;border:none;width:50px" value="${(bookPrice*0.03)*1 }"></td>
							</c:if>
							<c:if test="${'VVIP' eq grade }">
								<input type="text" style="text-align: center;border:none;width:50px" value="${(bookPrice*0.05)*1 }"></td>
							</c:if>
							<td style="text-align:center"><input type="number" name="basketCount" id="basketCount" style="text-align: center;margin-right:10px" value="${basketCount }" ></td>
						</tr>
				</table>
			</div>
		</div>
	</fieldset>
	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4"
			style="margin: 40px auto ;width:1000px;text-align:center">
			<table>
				<tr><td style="width: 250px" style="word-break:break-all">배송지 정보<br></td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">주문인</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">우편번호</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">주소</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">휴대전화번호</td></tr>

			</table>
			<c:choose>
				<c:when test="${state eq '1'}">
					<table class="left">
						<tr><td style="width: 200px; height: 30px"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input id="Name" name="name"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input id="Post" name="post"></td>
							<td><input id="postchange" type="button" style="padding:20px 80px;margin-left:50px;" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
						</tr>
						<tr><td style="width: 400px; height: 50px; word-break: break-all"><input id="Address" name="address"></td></tr>
						<tr><td style="width: 400px; height: 55px; word-break: break-all"><input id="Phone" name="phone"></td></tr>
					</table>
				</c:when>
				<c:otherwise>
					<table class="left">
						<tr><td style="width: 200px; height: 30px"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input
								id="Name" name="name" value="${sesInfo.userName }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 400px; height: 50px; word-break: break-all"><input
								id="Post" name="post" value="${sesInfo.userPost }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 800px; height: 50px; word-break: break-all"><input
								id="Address" name="address" value="${sesInfo.userAddress }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 400px; height: 55px; word-break: break-all"><input
								id="Phone" name="phone" value="${sesInfo.userPhone }" style="border: none"
								readonly></td></tr>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	<div style="margin:0 auto; text-align:right"><input type="submit" style="padding: 15px 25px;margin:50px" onclick="javascript: form.action='waitpayment.do';" value="결제하기"></div>
</form>
</c:if>
<c:if test="${'1' eq check }">
<form method="post"
	style="position: relative; text-align: center; display: inline-block">
	<fieldset>
		<div style="text-align: center; margin: 0 auto">
			<div id="divdelivery" style="margin: 0 auto">
			<input style="display:none" name="typecheck" value="1">
			<input style="display:none" name="presentcheck" value="1">
				<table class="table" style="width: 900px; margin: 0 auto">
					<tr >
						<th  style="width: 30%; text-align: center;">상품명</th>
						<th  style="width: 35%; text-align: center;">가격 / 포인트</th>
						<th style="width: 35%; text-align: center;">수량</th>
					</tr>
					<c:set var="total" value="0"></c:set>
					<c:forEach var="i" items="${list }">
						<c:set var="total" value="${i.bookPrice*i.basketCount + total }"></c:set>
						<tr>
							<td style="text-align:left"><input type="text" name="bookName" id="bookName" style="text-align: center;border:none;width:400px" value="${i.bookName }"></td>
							<td style="text-align:left"><input type="text" name="bookPrice" id="bookPrice" style="text-align: center;border:none;width:80px" value="${i.bookPrice }">/<input type="text"
							style="text-align: center;border:none;width:50px" value="${i.bookPrice/100 }"></td>
							<td style="text-align:left"><input type="text" name="basketCount" id="basketCount" style="text-align: center;border:none" value="${i.basketCount }"></td>
							<c:choose>
								<c:when test="${empty i.basketId }">
								</c:when>
								<c:when test="${not empty i.basketId }">
									<td style="display:none"><input type="text" id="basketId" name="basketId" style="display:none" value="${i.basketId }"></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3">총가격 : <input type="text" name="totalPrice" id="totalPrice" style="width: 80px; text-align: center; display: inline-block;border:none" value="${total }">원</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4"
			style="margin: 40px auto ;width:1000px;text-align:center">
			<table>
				<tr><td style="width: 250px" style="word-break:break-all">배송지 정보<br></td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">주문인</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">우편번호</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">주소</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">휴대전화번호</td></tr>

			</table>
			<c:choose>
				<c:when test="${state eq '1'}">
					<table class="left">
						<tr><td style="width: 200px; height: 30px"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input id="Name" name="name"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input id="Post" name="post"></td>
							<td><input id="postchange" type="button" style="padding:20px 80px;margin-left:50px;" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
						</tr>
						<tr><td style="width: 400px; height: 50px; word-break: break-all"><input id="Address" name="address"></td></tr>
						<tr><td style="width: 400px; height: 55px; word-break: break-all"><input id="Phone" name="phone"></td></tr>
					</table>
				</c:when>
				<c:otherwise>
					<table>
						<tr><td style="width: 200px; height: 30px"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input
								id="Name" name="name" value="${sesInfo.userName }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 400px; height: 50px; word-break: break-all"><input
								id="Post" name="post" value="${sesInfo.userPost }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 800px; height: 50px; word-break: break-all"><input
								id="Address" name="address" value="${sesInfo.userAddress }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 400px; height: 55px; word-break: break-all"><input
								id="Phone" name="phone" value="${sesInfo.userPhone }" style="border: none"
								readonly></td></tr>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</fieldset>
	<div style="margin:0 auto; text-align:right"><input type="submit" style="padding: 15px 25px;margin:50px" value="결제하기" onclick="javascript: form.action='waitpayment.do';"></div>
</form>
</c:if>
<c:if test="${'1' eq present }">
<form method="post"
	style="position: relative; text-align: center; display: inline-block">
	<fieldset>
		<div style="text-align: center; margin: 0 auto">
			<div id="divdelivery" style="margin: 0 auto">
			<input style="display:none" name="typecheck" value="0">
			<input style="display:none" name="presentcheck" value="1">
				<table style="width: 900px; margin: 0 auto">
					<tr>
						<td style="width: 50%; text-align: center;">상품명</td>
						<td style="width: 25%; text-align: center;">가격</td>
						<td style="width: 25%; text-align: center;">수량</td>
					</tr>
					<c:set var="total" value="0"></c:set>
						<c:set var="total" value="${bookPrice*basketCount + total }"></c:set>
						<tr>
							<td style="text-align:center;"><input type="text" name="bookName" id="bookName" style="text-align: center;border:none" value="${bookName }"></td>
							<td style="text-align:center;"><input type="text" name="bookPrice" id="bookPrice" style="text-align: center;border:none;width:80px" value="${bookPrice }">/<input type="text"
							style="text-align: center;border:none;width:50px" value="${bookPrice/100 }"></td>
							<td style="text-align:center;"><input type="number" name="basketCount" id="basketCount" style="text-align: center;border:none" value="${basketCount }"></td>
						</tr>
					<tr>
						<td>총가격 : <input type="text" name="totalPrice" id="totalPrice" style="width: 80px; text-align: center;border:none" value="${total }">원</td>
					</tr>
				</table>
			</div>
		</div>
	</fieldset>
	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4"
			style="margin: 40px auto ;width:1000px;text-align:center">
			<table>
				<tr><td style="width: 250px" style="word-break:break-all">배송지 정보<br></td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">주문인</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">우편번호</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">주소</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">휴대전화번호</td></tr>

			</table>
			<c:choose>
				<c:when test="${state eq '1'}">
					<table class="left">
						<tr><td style="width: 200px; height: 30px"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input id="Name" name="name"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input id="Post" name="post"></td>
							<td><input id="postchange" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
						</tr>
						<tr><td style="width: 400px; height: 50px; word-break: break-all"><input id="Address" name="address"></td></tr>
						<tr><td style="width: 400px; height: 55px; word-break: break-all"><input id="Phone" name="phone"></td></tr>
					</table>
				</c:when>
				<c:otherwise>
					<table>
						<tr><td style="width: 200px; height: 30px"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input
								id="Name" name="name" value="${sesInfo.userName }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 400px; height: 50px; word-break: break-all"><input
								id="Post" name="post" value="${sesInfo.userPost }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 800px; height: 50px; word-break: break-all"><input
								id="Address" name="address" value="${sesInfo.userAddress }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 400px; height: 55px; word-break: break-all"><input
								id="Phone" name="phone" value="${sesInfo.userPhone }" style="border: none"
								readonly></td></tr>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	<div style="margin:0 auto; text-align:right"><input type="submit" style="padding: 15px 25px;margin:50px" value="결제하기" onclick="javascript: form.action='waitpayment.do';"/></div>
</form>
</c:if>
<c:if test="${'0' eq present }">
<form method="post"
	style="position: relative; text-align: center; display: inline-block">
	<fieldset>
		<div style="text-align: center; margin: 0 auto">
			<div id="divdelivery" style="margin: 0 auto">
			<input style="display:none" name="typecheck" value="1">
			<input style="display:none" name="presentcheck" value="1">
				<table style="width: 900px; margin: 0 auto">
					<tr>
						<td style="width: 50%; text-align: center;">상품명</td>
						<td style="width: 25%; text-align: center;">가격</td>
						<td style="width: 25%; text-align: center;">수량</td>
					</tr>
					<c:set var="total" value="0"></c:set>
					<c:forEach var="i" items="${list }">
						<c:set var="total" value="${i.bookPrice*i.basketCount + total }"></c:set>
						<tr>
							<td style="text-align:center;"><input type="text" name="bookName" id="bookName" style="text-align: center;border:none" value="${i.bookName }"></td>
							<td style="text-align:center;"><input type="text" name="bookPrice" id="bookPrice" style="text-align: center;border:none;width:80px" value="${i.bookPrice }">/<input type="text"
							style="text-align: center;border:none;width:50px" value="${i.bookPrice/100 }"></td>
							<td style="text-align:center;"><input type="text" name="basketCount" id="basketCount" style="text-align: center;border:none" value="${i.basketCount }"></td>
							<c:choose>
								<c:when test="${empty i.basketId }">
								</c:when>
								<c:when test="${not empty i.basketId }">
									<td style="display:none"><input type="text" id="basketId" name="basketId" style="display:none" value="${i.basketId }"></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
					<tr>
						<td>총가격 : <input type="text" name="totalPrice" id="totalPrice" style="width: 80px; text-align: center; display: inline-block;border:none" value="${total }">원</td>
					</tr>
				</table>
			</div>
		</div>
	</fieldset>
	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4"
			style="margin: 40px auto ;width:1000px;text-align:center">
			<table>
				<tr><td style="width: 250px" style="word-break:break-all">배송지 정보<br></td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">주문인</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">우편번호</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">주소</td></tr>
				<tr><td style="width: 250px; height: 50px; word-break: break-all">휴대전화번호</td></tr>

			</table>
			<c:choose>
				<c:when test="${state eq '1'}">
					<table class="left">
						<tr><td style="width: 200px; height: 30px"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input id="Name" name="name"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input id="Post" name="post"></td>
							<td><input id="postchange" type="button" 	 onclick="execDaumPostcode()" value="우편번호 찾기"></td>
						</tr>
						<tr><td colspan="2" style="width: 400px; height: 50px; word-break: break-all"><input id="Address" name="address"></td></tr>
						<tr><td style="width: 400px; height: 55px; word-break: break-all"><input id="Phone" name="phone"></td></tr>
					</table>
				</c:when>
				<c:otherwise>
					<table>
						<tr><td style="width: 200px; height: 30px"></td></tr>
						<tr><td style="width: 200px; height: 40px; word-break: break-all"><input
								id="Name" name="name" value="${sesInfo.userName }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 400px; height: 50px; word-break: break-all"><input
								id="Post" name="post" value="${sesInfo.userPost }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 800px; height: 50px; word-break: break-all"><input
								id="Address" name="address" value="${sesInfo.userAddress }" style="border: none"
								readonly></td></tr>
						<tr><td style="width: 400px; height: 55px; word-break: break-all"><input
								id="Phone" name="phone" value="${sesInfo.userPhone }" style="border: none"
								readonly></td></tr>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	<div style="margin:0 auto; text-align:right"><input type="submit" style="padding: 15px 25px;margin:50px" value="결제하기" onclick="javascript: form.action='waitpayment.do';"></div>
</form>
</c:if>
</div>

<!-- Footer-->
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
function execDaumPostcode() {
    daum.postcode.load(function () {
      new daum.Postcode({
        oncomplete: function (data) {
          // 예제를 참고하여 다양한 활용법을 확인해 보세요.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수
          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
          }
          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if (data.userSelectedType === 'R') {
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
              extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraAddr !== '') {
              extraAddr = ' (' + extraAddr + ')';
            }
          }
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('Post').value = data.zonecode;
          document.getElementById("Address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("Address").focus();
        }
      }).open();
    });
  }
  
	 document.querySelector('#basketCount').addEventListener('change',function(){
		if(this.value < 1){
			alert('1권이하 주문 불가합니다');
			this.value =1;
		}
		let stock = "${bookStock}";
		console.log(stock);
		if(this.value > stock){
			alert('재고량 이상으로 주문 불가합니다');
			this.value = stock;
		}
	}) 
</script>