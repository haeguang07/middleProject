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
<!-- Navigation-->
<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
<c:if test="${empty list }"><div style="width:100%;height:300px;line-height:300px;text-align:center"><p style="font-size:1.2em"><b>현재 장바구니에 담아둔 도서가 없습니다!!</b></p></div></c:if>
		    <c:if test="${not empty list }">
		<input type='checkbox' name='selectall' value='selectall'
			onclick='selectAll(this)' style="padding-bottom:5px"/> <b>전체선택</b>
			<p></p>
			<p style="width:300px; text-align:right; display:inline-block">도서제목</p>
			<p style="width:150px; text-align:right; display:inline-block">가격</p>
			<p style="width:270px; text-align:right; display:inline-block">수량</p>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
		    <c:forEach var="i" items="${list }" varStatus="vs">
				<form method="post"style="position: relative; width: 1100px; text-align:center;">
					<filedset style="width:1000px;">
					<table>
						<tr>
						<input style="display:none" name="presentcheck" value="0">
							<td><input id="${vs.index }" class="remember" type="checkbox" onclick=checkSelectAll() name="remember" value="{'bookName':'${i.bookName }','bookPrice':'${i.bookPrice }','isbn':'${i.isbn }','proAddress':'${i.proAddress }','basketId':'${i.basketId }'" style="margin: 15px"></td>
							<td rowspan="5"><img src="${i.cover }"
								style="width: 150px; height: 150px"></td>
							<td><input name="bookName" style="border:none;word-break:break-all; border:none"value="${i.bookName }" readonly><br></td>
							<td><input id="bookPrice" name="bookPrice" style="border:none;padding: 0 40px; word-break: break-all" value="${i.bookPrice }" readonly></td>
							<td><input id="bookPoint" name="bookPoint" style="border:none;display:none" value="0" readonly></td>
							<td id="td" style="padding: 0 40px; width: 400px; word-break: break-all">
								<input class="evt" type='button'  value='+'/>
								<input class="evt" type='button'  value='-'/>
								<input value=${i.basketCount } id="bookCount" class="bookCount" name="bookCount" readonly>
								<p style="display:inline-block;">최대수량 : </p>
								<div style="display:inline-block;" id="bookstock">10</div>
							</td>
							<td><input id="resetlabel" style="display:none" name="resetlabel" value="초기화" type="text" onclick=resetLabel(this) /></td>
							<td><input style="display:none" id="isbn" name="isbn" value=${i.isbn }></td>
							<td style="display:none"><input type="text" id="basketId" name="basketId" style="display:none" value="${i.basketId }"></td>
						</tr>
						</table>
					</filedset>
			</c:forEach>
			</div>
			</c:if>
			<div id="basketform"
				class="" style="text-align: center; border:solid 1px black;">
				<filedset class="form-inline center" role="form" action="delivery.do" method="post"
					style="text-align: center; width: 500px; ">
					<p>현재주소<input type="submit" value="변경" style="padding:5px 15px"></input><br></p>
						<input id="proaddress" class="proaddress" name="proaddress" style="border:none; width:400px" type="text" value="${address }" readonly><br><br>
						총 상품 가격 : <input id="totalprice" name="totalprice" style="border:none" type="text" value="0" readonly>원<br>
						상품 포인트 : <input id="productpoint" name="productpoint" style="border:none" type="text" value="0" readonly>p<br>
						고객님의 등급 : <input id="userGrade" name="grade" type="text" style="border:none" value="${userGrade }" readonly><br>
						<p>normal : 1%   VIP : 3%   VVIP : 5%<br><br></p>
						<input type="text" style="display:none" id="userPoint" name="userPoint" value="${userPoint }">
						<input id="Bespeak" type="submit" value="주문" style="padding:5px 15px" onclick="javascript: form.action='delivery.do';"/>
						<input id="present" type="submit" value="선물" style="padding:5px 15px" onclick="javascript: form.action='basketDelivery.do';"/>
						<input id="delete" type="submit" value="삭제" style="padding:5px 15px" onclick="javascript: form.action='basketDelete.do';"/>
				</filedset>
				</form>
		</div>
</section>
<c:choose>
<c:when test="${sesInfo eq null }">
<div id="MOVE_TOP_BTN">
	
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p
				style="font-size: 16px; position: absolute; top: 15px; left: 15px;color:black;margin-left:7px;margin-top:5px"><a href="#" style="text-decoration: none;color:black;">top</a></p>
		</div>
	 
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;color:black;margin-left:8px;margin-top:7px"><a href="login.do" style="text-decoration: none;color:black;">로그인</a></p>
		</div>
	
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;margin-left:3px;margin-top:5px"><a href="joinForm.do" style="text-decoration: none;color:black;">회원가입</a></p>
		</div>
	
</div>
</c:when>
<c:otherwise>
<div id="MOVE_TOP_BTN">
	
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p
				style="font-size: 16px; position: absolute; top: 15px; left: 15px;color:black;margin-left:7px;margin-top:5px"><a href="#" style="text-decoration: none;color:black;">top</a></p>
		</div>
	 
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;color:black;margin-left:2px;margin-top:7px"><a href="login.do" style="text-decoration: none;color:black;">로그아웃</a></p>
		</div>
	 
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;color:black;margin-left:2px;margin-top:7px"><a href="basket.do" style="text-decoration: none;color:black;">장바구니</a></p>
		</div>
	
	
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;color:black;margin-left:4px;margin-top:5px"><a href="myPageMain.do" style="text-decoration: none;color:black;">My Page</a></p>
		</div>
	
</div>
</c:otherwise>
</c:choose>
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
	  let resultElement = this.parentElement.children[2];
	  console.log(this.value);
	  // 현재 화면에 표시된 값
	  let number = resultElement.value;
	  console.log('1 : '+number);
	  let userGrade = document.getElementById('userGrade');
	  // 더하기/빼기
	  let bookprice = this.parentElement.parentElement.children[3].children[0].value;
	  let total = document.querySelector('#totalprice').value;
	  let isbn = this.parentElement.parentElement.children[7].children[0].value;
	  let bookName = this.parentElement.parentElement.children[2].children[0].value;
	  let proAddress = document.querySelector('#proaddress').value;
	  let basketId = this.parentElement.parentElement.children[8].children[0].value;
	  console.log(basketId);
	  let checkprice = this.parentElement.parentElement.children[3].children[0].value;
	  let checkcount = this.parentElement.parentElement.children[5].children[2].value;
	  let totalcheck = (checkprice*1)*(checkcount*1);
	  let productpoint = document.querySelector('#productpoint');
			
	  if(this.value === '+') {
	    number = parseInt(number) + 1;
	    if(number > this.parentElement.children[4].innerText){
	    	alert('재고량 이상 주문 불가합니다.');
	    	number = this.parentElement.children[4].innerText;
	    	let propoint = (productpoint*1*0.01);
		    console.log('check = '+propoint);
		    document.querySelector('#productpoint').value = propoint;
	    }else{
	    	if(this.parentElement.parentElement.children[0].children[0].checked){
		  		  document.querySelector('#totalprice').value = (total*1+(bookprice*1));
		  		  console.log(document.querySelector('#totalprice').value);
		  		  productpoint = document.querySelector('#totalprice').value;
		  		  console.log('productpoint = '+productpoint);
		  	 	}
	    }
	  }else if(this.value === '-')  {
	    number = parseInt(number) - 1;
	    if(number < 0){
	    	alert('0권 이하 주문 불가합니다.');
	    	number =0;
	    	let propoint = 0;
	    	document.querySelector('#productpoint').value = propoint;
	    	
	    }else{
	    	if(this.parentElement.parentElement.children[0].children[0].checked){
	    		document.querySelector('#totalprice').value = (total*1-bookprice*1);
	    		 productpoint = document.querySelector('#totalprice').value;
	    		 if(userGrade.value === "normal"){
	    			  	let propoint = (productpoint*1*0.01);
	    			    console.log('check = '+propoint);
	    			    document.querySelector('#productpoint').value = propoint;
    			  }else if(userGrade.value ==="VIP"){
	    				let propoint = (productpoint*1*0.03);
	    				console.log('check = '+propoint);
	    				document.querySelector('#productpoint').value = propoint;
    			  }else if(userGrade.value ==="VVIP"){
	    				let propoint = (productpoint*1*0.05);
	    				console.log('check = '+propoint);
	    				document.querySelector('#productpoint').value = propoint;
    			  }
	    	}
	    }
	  }
	  // 결과 출력
	  resultElement.value = number;
	  let checkbox = this.parentElement.parentElement.children[0].children[0];
	  checkbox.value = "{'bookName':'"+bookName+"','bookPrice':'"+bookprice+"','isbn':'"+isbn+"','basketCount':'"+number+"','proAddress':'"+proAddress+"','basketId':'"+basketId+"'}";
	  console.log(checkbox.value);
	  console.log('장바구니아이디'+basketId);
	  console.log(proAddress);	
	  if(userGrade.value === "normal"){
	  	let propoint = (productpoint*1*0.01);
	  console.log('check = '+propoint);
	  document.querySelector('#productpoint').value = propoint;
	  }else if(userGrade.value ==="VIP"){
		let propoint = (productpoint*1*0.03);
		console.log('check = '+propoint);
		document.querySelector('#productpoint').value = propoint;
	  }else if(userGrade.value ==="VVIP"){
		let propoint = (productpoint*1*0.05);
		console.log('check = '+propoint);
		document.querySelector('#productpoint').value = propoint;
	  }
	  console.log( document.querySelector('#productpoint'));
	})})
	
	
	
	//개별 추가
	let remember = document.querySelectorAll('.remember');
	remember.forEach(item => item.addEventListener('change',function(){
		let bookName = this.parentElement.parentElement.children[2].children[0].value;
		let isbn = this.parentElement.parentElement.children[7].children[0].value;
		let proAddress = document.querySelector('#proaddress').value;
		console.log(isbn);
		console.log(bookName);
		let basketId = this.parentElement.parentElement.children[8].children[0].value;
		console.log(basketId);
		let bookprice = this.parentElement.parentElement.children[3].children[0].value;
		console.log(bookprice);
		let basketCount = this.parentElement.parentElement.children[5].children[2].value;
		console.log(basketCount);
			console.log(this);
			let checkprice = this.parentElement.parentElement.children[3].children[0].value;
			let checkcount = this.parentElement.parentElement.children[5].children[2].value;
			let productpoint = document.getElementById('productpoint');
			let userGrade = document.getElementById('userGrade');
				let total = document.querySelector('#totalprice').value;
			if(this.checked){
				console.log('가격'+checkprice);
				console.log('개수'+checkcount);
				let totalcheck = (checkprice*1)*(checkcount*1);
				console.log(checkprice);
				console.log(checkcount);
				document.querySelector('#totalprice').value = (total*1+(checkprice*checkcount));
				console.log(document.querySelector('#totalprice').value);
				this.value = "{'bookName':'"+bookName+"','bookPrice':'"+bookprice+"','isbn':'"+isbn+"','basketCount':'"+basketCount+"','proAddress':'"+proAddress+"','basketId':'"+basketId+"'}";
				if(userGrade.value ==='normal'){
					let protest = document.querySelector('#totalprice').value;
					console.log('protest = '+protest)
					let propoint = protest*0.01;
					document.querySelector('#productpoint').value = propoint;
					console.log('propoint = '+propoint);
				}else if(userGrade.value ==='VIP'){
					let protest = document.querySelector('#totalprice').value;
					console.log('protest = '+protest)
					let propoint = protest*0.03;
					document.querySelector('#productpoint').value = propoint;
				}else if(userGrade.value ==='VVIP'){
					let protest = document.querySelector('#totalprice').value;
					console.log('protest = '+protest)
					let propoint = protest*0.05;
					document.querySelector('#productpoint').value = propoint;
				}
				console.log(this.value);
				
			}else{
				console.log('가격'+checkprice);
				console.log('개수'+checkcount);
				let total = document.querySelector('#totalprice').value;
				document.querySelector('#totalprice').value = (total*1-(checkprice*checkcount));
				console.log(document.querySelector('#totalprice').value);
				this.value=0;
				productpoint.value = 0;
				console.log(this.value);
			}
	}))
	
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
		  let checkboxes 
		    = document.querySelectorAll('input[name="remember"]');
		  // 선택된 체크박스
		  let checked 
		    = document.querySelectorAll('input[name="remember"]:checked');
		  // select all 체크박스
		  let selectAll 
		    = document.querySelector('input[name="selectall"]');
		  
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		    console.log('hello');
		  }else {
		    selectAll.checked = false;
		    console.log('bye');
		  }

	}

	function selectAll(selectAll)  {
		  let checkboxes 
		     = document.getElementsByName('remember');
		  let totalMoney =0;
		  let total = document.querySelector('#totalprice');
		  let productpoint = document.getElementById('productpoint');
		  let userGrade = document.getElementById('userGrade');
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		    let checkprice = checkbox.parentElement.parentElement.children[3].children[0].value;
			let checkcount = checkbox.parentElement.parentElement.children[5].children[2].value;
			totalMoney += checkprice*checkcount;
			checkbox.value += ",'basketCount':'"+checkcount+"'}";
			if(userGrade.value ==='normal'){
				productpoint.value = totalMoney*0.01;
			}else if(userGrade.value==='VIP'){
				productpoint.value = totalMoney*0.03;
			}else if(userGrade.value==='VVIP'){
				productpoint.value = totalMoney*0.05;
			}
			if(selectAll.checked == false){
				totalMoney =0;
				productpoint.value = 0;
			}
		  })
		  total.value = totalMoney;
	}
</script>