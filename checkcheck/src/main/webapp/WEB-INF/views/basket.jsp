<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- 05-02 김영환 -->
<html lang="en">
<head>
  <script src="send.js" defer></script>
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
		<input type='checkbox' name='selectall' value='selectall'
			onclick='selectAll(this)' style="padding-bottom:5px"/> <b>전체선택</b>
			<p></p>
			<p style="width:300px; text-align:right; display:inline-block">도서제목</p>
			<p style="width:150px; text-align:right; display:inline-block">가격</p>
			<p style="width:270px; text-align:right; display:inline-block">수량</p>
			<p style="width:260px; text-align:right; display:inline-block">초기화</p>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
		    <c:forEach var="i" items="${list }" varStatus="vs">
				<form action="delivery.do" method="post"style="position: relative; width: 1100px; text-align:center">
					<filedset style="width:1000px">
					<table>
						<tr>
							<td><input name="checkboxindex" id=${vs.index } type="checkbox" onclick='checkSelectAll()' name="remember" style="margin: 15px"></td>
							<td rowspan="5"><img src="${i.cover }"
								style="width: 150px; height: 150px"></td>
							<input name="selectbookName"  style="width:900px;word-break:break-all; border:none"value="${i.bookName }"><br>
							
							<td style="padding: 0 40px; width: 300px; word-break: break-all">정가
								: ${i.bookPrice }원<br>포인트 : ${i.bookPrice*0.05 }p
							</td>
							<td id="td" style="padding: 0 40px; width: 400px; word-break: break-all">
								<input class="evt" type='button'  value='+'/>
								<input class="evt" type='button'  value='-'/>
								<div id='buycount'>0</div>
								<p style="display:inline-block;">최대수량 : </p>
								<div style="display:inline-block;" id="bookstock">10</div>
							</td>
							<td style="padding: 0 40px; width: 200px; word-break: break-all">
								<input type="reset"></input>
							</td>
						</tr>
						</table>
					</filedset>
			</c:forEach>
			<div id="basketform"
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4"
				style="text-align: center; display: inline-block">
				<filedset class="form-inline center" role="form" action="delivery.do" method="post"
					style="text-align: center; width: 500px;">
					<p>현재주소<input type="submit" value="변경" style="padding:5px 15px"></input><br></p>
						<input name="proaddress" style="border:none; width:200px" type="text" value=${address }><br><br>
						<input name="totalprice" style="border:none" type="text" value="총 상품 가격 : ${total }원"><br>
						<input name="productpoint" style="border:none" type="text" value="상품 포인트 : ${total*0.05 }p"><br>
						<input name="totalpoint" style="border:none; width:200px" type="text" value="예상 총 포인트 : ${userPoint+(total*0.05) }원"><br><br>
						<input name="grade" type="text" style="border:none" value="고객님의 등급 : ${userGrade }"><br>
						<p>VIP : 3% VVIP : 5%<br><br></p>
						<input id="Bespeak" type="submit" value="주문" style="padding:5px 15px"></input>
						<input id="present" type="submit" value="선물" style="padding:5px 15px"></input>
						<input id="delete" type="submit" value="삭제" style="padding:5px 15px"></input>
				</filedset>
				</form>
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
let evt =document.getElementsByClassName('evt');
let queryevt =document.querySelectorAll('.evt');
console.log(queryevt); 
console.log(evt);
		queryevt.forEach(item => {item.addEventListener('click',function (){
	  // 결과를 표시할 element
	  const resultElement = this.parentElement.children[2];
	  console.log(this.value);
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(this.value === '+') {
	    number = parseInt(number) + 1;
	    if(number > this.parentElement.children[4].innerText){
	    	alert('재고량 이상 주문 불가합니다.');
	    	number = this.parentElement.children[4].innerText;
	    }
	  }else if(this.value === '-')  {
	    number = parseInt(number) - 1;
	    if(number < 0){
	    	alert('0권 이하 주문 불가합니다.');
	    	number =0;
	    }
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}

	)
}
)

	
	
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
	
	function checkSelectAll()  {
		  // 전체 체크박스
		  const checkboxes 
		    = document.querySelectorAll('input[name="remember"]');
		  // 선택된 체크박스
		  const checked 
		    = document.querySelectorAll('input[name="remember"]:checked');
		  // select all 체크박스
		  const selectAll 
		    = document.querySelector('input[name="selectall"]');
		  
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		  }else {
		    selectAll.checked = false;
		  }

		}

		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('remember');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
</script>