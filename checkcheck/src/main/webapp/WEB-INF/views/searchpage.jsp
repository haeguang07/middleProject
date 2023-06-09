<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.pagination2 {
	display: inline-block;
	text-align: center;
}

.pagination2 a {
	color: black;
	float: left;
	padding: 15px 30px;
	text-decoration: none;
}

.pagination2 a.active1 {
	background-color: #4CAF50;
	color: white;
}

.pagination2 a:hover:not(.active1) {
	background-color: #ddd;
}

#normarborderstyle {
	border: solid black 1px;
}

.btnLightBlue.btnPush {
  box-shadow: 0px 5px 0px 0px #1E8185;
}
.btnPush:hover {
  margin-top: 15px;
  margin-bottom: 5px;
}
.btnLightBlue.btnPush:hover {
  box-shadow: 0px 0px 0px 0px #1E8185;
}
.btnLightBlue.btnBorder {
  box-shadow: 0px 0px 0px 0px #01939A;
}
.btnLightBlue.btnBorder:hover {
  box-shadow: 0px 0px 0px 5px #01939A;
}

input.button {
  display: block;
  float: left;
  width: 120px;
  padding: 0;
  font-weight: 600;
  text-align: center;
  line-height: 50px;
  color: #FFF;
  border-radius: 5px;
  transition: all 0.2s ;
}
.btnLightBlue {
  background: #5DC8CD;
}

</style>
<section style="display: flex">
	<div
		style="flex: 1; border: 1px black solid; margin: 5px; height: 700px;">
		<p id="hoverkorea" style="display: inline-block; margin: 0 20px">국내도서</p>
		<p id="hoverforeign" style="display: inline-block;">외국도서</p>
		<ul id="korea" style="list-style: none;">
			<li><a href="search.do?category=국내도서>경제경영">경제경영</a></li>
			<li><a href="search.do?category=국내도서>과학">과학</a></li>
			<li><a href="search.do?category=국내도서>건강/취미">건강/취미</a></li>
			<li><a href="search.do?category=국내도서>수험서/자격증">수험서/자격증</a></li>
			<li><a href="search.do?category=국내도서>달력/기타">달력/기타</a></li>
			<li><a href="search.do?category=국내도서>대학교재">대학교재</a></li>
			<li><a href="search.do?category=국내도서>만화">만화</a></li>
			<li><a href="search.do?category=국내도서>사회과학">사회과학</a></li>
			<li><a href="search.do?category=국내도서>소설/시/희곡">소설/시/희곡</a></li>
			<li><a href="search.do?category=국내도서>여행">여행</a></li>
			<li><a href="search.do?category=국내도서>역사">역사</a></li>
			<li><a href="search.do?category=국내도서>예술">예술/대중문화</a></li>
		</ul>
		<ul id="foreign" style="display: none; list-style: none;">
			<li><a href="search.do?category=외국도서>ELT/어학/사전">ELT/어학/사전</a></li>
			<li><a href="search.do?category=외국도서>가정/원예/인테리어">가정/원예/인테리어</a></li>
			<li><a href="search.do?category=외국도서>건강/스포츠">건강/스포츠</a></li>
			<li><a href="search.do?category=외국도서>경제경영">경제경영</a></li>
			<li><a href="search.do?category=외국도서>공예/취미/수집">공예/취미/수집</a></li>
			<li><a href="search.do?category=외국도서>만화">만화</a></li>
			<li><a href="search.do?category=외국도서>소설/시/희곡">소설/시/희곡</a></li>
			<li><a href="search.do?category=외국도서>여행">여행</a></li>
			<li><a href="search.do?category=외국도서>역사">역사</a></li>
			<li><a href="search.do?category=외국도서>요리">요리</a></li>
			<li><a href="search.do?category=외국도서>종교/명상/점술">종교/명상/점술</a></li>
			<li><a href="search.do?category=외국도서>해외잡지">해외잡지</a></li>
		</ul>
	</div>
	<div
		style="flex: 5; border: 1px black solid; margin: 5px; padding: 10px">
		
		<p>
			<c:if test="${not empty select }">
			
				<a>${select }</a>
			</c:if>
			<a>${category }</a>
			<form action="search.do" method="POST" ${category eq '베스트셀러' ? 'style="display:none"' : category eq '화제의책' ? 'style="display:none"': category eq '신간' ? 'style="display:none"' : '' }> 
				<input value="${category }" name="category" style="display:none">
				<input type="text" name="search" placeholder="검색">
				<input type="submit" value="검색">
			</form>
			<c:if test="${not empty shWeek }">
				<p style="display:inline-block">${shWeek }</p>
			</c:if>
		</p>
		<c:if test="${category eq '베스트셀러'|| category eq '화제의책'  }">
		<form ${category == '베스트셀러'? 'action="bestSeller.do?category=베스트셀러"': 'action="hitCount.do?category=화제의책"'} method="post"> 
			<select name="sh_year" id="sh_year"
				onclick="makeWeekSelectOptions();">
				<option ${shYear == '2023' ? 'selected="selected"' : '' } value='2023'>2023년</option>
				<option ${shYear == '2022' ? 'selected="selected"' : '' } value='2022' >2022년</option>
				<option ${shYear == '2021' ? 'selected="selected"' : '' } value='2021' >2021년</option>
			</select>

			<select name="sh_month" id="sh_month"
				onclick="makeWeekSelectOptions();">
				<option ${shMonth == '01' ? 'selected="selected"' : '' } value='01'>01월</option>
				<option ${shMonth == '02' ? 'selected="selected"' : '' } value='02'>02월</option>
				<option ${shMonth == '03' ? 'selected="selected"' : '' } value='03'>03월</option>
				<option ${shMonth == '04' ? 'selected="selected"' : '' } value='04'>04월</option>
				<option ${shMonth == '05' ? 'selected="selected"' : '' } value='05'>05월</option>
				<option ${shMonth == '06' ? 'selected="selected"' : '' } value='06'>06월</option>
				<option ${shMonth == '07' ? 'selected="selected"' : '' } value='07'>07월</option>
				<option ${shMonth == '08' ? 'selected="selected"' : '' } value='08'>08월</option>
				<option ${shMonth == '09' ? 'selected="selected"' : '' } value='09'>09월</option>
				<option ${shMonth == '10' ? 'selected="selected"' : '' } value='10'>10월</option>
				<option ${shMonth == '11' ? 'selected="selected"' : '' } value='11'>11월</option>
				<option ${shMonth == '12' ? 'selected="selected"' : '' } value='12'>12월</option>
			</select>

			<select name="sh_week" id="sh_week">
			</select>
			<input type="text" name="category" value="베스트셀러" style="display:none;">
			<input type="submit" value="검색">
			</form>
		</c:if>
		<!-- 책 리스트 받아서 반복문 만들기-->
		<c:forEach var="i" items="${list }">
			<div style="padding: 10px; border-top: 1px black solid; clear: both;margin-bottom: 70px">
				<form action="" method="post" style=" clear: both;">
					<table style=" clear: both;">
						<tr>
							
							<td rowspan="5"><img src=${i.cover } style="width: 200px; height: 300px;cursor:pointer" onclick="location.href='getBook.do?bookInfo=${i.isbn}'" ></td>
							<td>이름</td><td>${i.bookName }</td>
						</tr>
						<tr><td>저자</td><td>${i.author }</td></tr>
						<tr><td>출판사</td><td>${i.publisher }</td></tr>
						<tr><td>가격</td><td>${i.bookPrice }</td></tr>
						<tr><td>평점</td><td>5</td></tr>
						<input type="text" style="display:none" id="bookStock" value="${i.bookStock }">
					</table>
					<input class="button btnPush btnLightBlue" value="구매" type="button" style="float: right;" onclick=insertOrder(this)>
					<input class="button btnPush btnLightBlue" value="장바구니" type="button" style="float: right;" onclick=insertBasket(this)>
					<span style="display:none">${i.isbn }</span>
					<input type="text" style="display:none" value="">
				</form>
			</div>
		</c:forEach>
		<!-- 책-->
	</div>
</section>
<div
	style="text-align: center; width: 1200px; height: 50px; padding: 30px 0; margin-bottom: 50px">
	<div class="pagination2">
		<c:choose>
			<c:when test="${not empty select}">
				<c:if test="${pageInfo.prev }">
					<a
						href="search.do?category=${category }&page=${pageInfo.startPage-1 }&select=${select}">Previous</a>
				</c:if>
				<c:forEach var="i" begin="${pageInfo.startPage }"
					end="${pageInfo.endPage }">
					<a class="${i==pageInfo.pageNum ? 'active1' : '' }"
						href="search.do?category=${category }&page=${i }&select=${select}">${i }
					</a>
				</c:forEach>
				<c:if test="${pageInfo.next }">
					<a
						href="search.do?category=${category }&page=${pageInfo.endPage+1 }&select=${select}">Next</a>${category }
				</c:if>
			</c:when>
			<c:otherwise>
				<c:choose>
				<c:when test="${category eq '신간'}">
					<c:if test="${pageInfo.prev }">
						<a
							href="newBookSearch.do?category=${category }&page=${pageInfo.startPage-1 }">Previous</a>
					</c:if>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<a class="${i==pageInfo.pageNum ? 'active1' : '' }"
							href="newBookSearch.do?category=${category }&page=${i }">${i } </a>
					</c:forEach>
					<c:if test="${pageInfo.next }">
						<a
							href="newBookSearch.do?category=${category }&page=${pageInfo.endPage+1 }">Next</a>
					</c:if>
				</c:when>
				<c:when test="${category eq '베스트셀러' }">
					<c:if test="${pageInfo.prev }">
						<a
							href="bestSeller.do?category=${category }&page=${pageInfo.startPage-1 }&monthFirst=${mfirst}&monthLast=${mlast}">Previous</a>
					</c:if>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<a class="${i==pageInfo.pageNum ? 'active1' : '' }"
							href="bestSeller.do?category=${category }&page=${i }&monthFirst=${mfirst}&monthLast=${mlast}">${i } </a>
					</c:forEach>
					<c:if test="${pageInfo.next }">
						<a
							href="bestSeller.do?category=${category }&page=${pageInfo.endPage+1 }&monthFirst=${mfirst}&monthLast=${mlast}">Next</a>
					</c:if>
				</c:when>
				<c:when test="${category eq '화제의책' }">
					<c:if test="${pageInfo.prev }">
						<a
							href="hitCount.do?category=${category }&page=${pageInfo.startPage-1 }">Previous</a>
					</c:if>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<a class="${i==pageInfo.pageNum ? 'active1' : '' }"
							href="hitCount.do?category=${category }&page=${i }">${i } </a>
					</c:forEach>
					<c:if test="${pageInfo.next }">
						<a
							href="hitCount.do?category=${category }&page=${pageInfo.endPage+1 }">Next</a>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${pageInfo.prev }">
						<a
							href="search.do?category=${category }&page=${pageInfo.startPage-1 }">Previous</a>
					</c:if>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<a class="${i==pageInfo.pageNum ? 'active1' : '' }"
							href="search.do?category=${category }&page=${i }">${i } </a>
					</c:forEach>
					<c:if test="${pageInfo.next }">
						<a
							href="search.do?category=${category }&page=${pageInfo.endPage+1 }">Next</a>
					</c:if>
				</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>
</div>
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
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script>
	document.querySelector('#hoverforeign').addEventListener('click',
			function() {
				this.style.color = 'blue';
				document.querySelector('#hoverkorea').style.color = 'black';
				let korea = document.querySelector('#korea');
				korea.style.display = 'none';
				let foreign = document.querySelector('#foreign');
				foreign.style.display = 'block';
			})
	document.querySelector('#hoverkorea').addEventListener('click', function() {
		this.style.color = 'blue';
		document.querySelector('#hoverforeign').style.color = 'black';
		let korea = document.querySelector('#korea');
		korea.style.display = 'block';
		let foreign = document.querySelector('#foreign');
		foreign.style.display = 'none';
	})
$(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 100) {
			$('#MOVE_TOP_BTN').fadeIn();
		} else {
			$('#MOVE_TOP_BTN').fadeOut();
		}
	});

	/* $("#MOVE_TOP_BTN").click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	}); */
});
function insertBasket(field){
	console.log(field.nextElementSibling);
	let isbn = field.nextElementSibling.innerText;
	if("${sesInfo}"==""){
		alert('로그인후 이용가능합니다');
		return;
	}
	let bookStock = field.parentElement.children[0].value;
	if(bookStock>=1){
		fetch("addBasket.do?isbn="+isbn+"&userId=${sesInfo.userId}&count=1")
		.then(result => result.json())
		.then(resolve =>{
			
			if(resolve.retCode == 'Success'){
				
				if(confirm('장바구니로 이동하시겠습니까?')){
					location.href="basket.do";
				}
			}
		})
		.catch(error => console.log(error));
	} else if(bookStock<1){
		alert('재고가 없습니다!! 장바구니에 담을수 없습니다!!');
		return
	}
}
function insertOrder(field){
	if("${sesInfo}"==""){
		alert('로그인후 이용가능합니다');
		return;	
	}
	let basketbutton = field.nextElementSibling;
	console.log(basketbutton);
	let isbn = basketbutton.nextElementSibling.innerText;
	console.log(isbn);
	let bookStock = field.parentElement.children[0].value;
	if("${sesInfo}"==""){
		alert('로그인후 이용가능합니다');
		return;
	}
	if(bookStock<1){
		alert('재고가 없습니다!!');
		return;
	}else if(bookStock>=1){
	    location.href="delivery.do?isbn="+isbn+"&bookStock="+ bookStock;
	}

	
	//location.href="delivery.do";
	//넘겨야하는값 : isbn,bookName,bookPrice,basketCount(이거도없음),proAddress
}
	

	//월별 일수 구현하기
	function makeWeekSelectOptions() {
		var year = $("#sh_year").val();
		var month = $("#sh_month").val();

		var today = new Date();

		var sdate = new Date(year, month - 1, 01); //고른 월의 시작날짜 ( 년도 , 월 , 시작일)
		var start = sdate;
		var lastDay = (new Date(sdate.getFullYear(), sdate.getMonth() + 1, 0))
				.getDate();// 고른 월의 마지막날짜구함
		var endDate = new Date(sdate.getFullYear(), sdate.getMonth(), lastDay);//고른 월의 (년도 , 월 , 마지막일)
		var end = endDate;
		var week = sdate.getDay();//시작일의 요일 구함
		sdate.setDate(sdate.getDate() - week);// 시작일에서 요일수를 뺸다 -> 그 주의 시작 일짜를 구할수있음 ( 일요일 의 일자)
		var edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate
				.getDate());// 첫주차의 시작일수

		var obj = document.getElementById("sh_week");
		obj.options.length = 0;
		var seled = "";
		start = year + "-" + month + "-" + 1;
		end = end.getFullYear() + "-" + (end.getMonth() +1) + "-" + end.getDate();
		obj.options[obj.options.length] = new Option('월 전체 조회',
				start + "|" + end);
		
		while (endDate.getTime() >= edate.getTime()) {

			var sYear = sdate.getFullYear();
			var sMonth = (sdate.getMonth() + 1);
			var sDay = sdate.getDate();

			sMonth = (sMonth < 10) ? "0" + sMonth : sMonth;
			sDay = (sDay < 10) ? "0" + sDay : sDay;

			var stxt = sYear + "-" + sMonth + "-" + sDay;

			edate.setDate(sdate.getDate() + 6);

			var eYear = edate.getFullYear();
			var eMonth = (edate.getMonth() + 1);
			var eDay = edate.getDate();

			eMonth = (eMonth < 10) ? "0" + eMonth : eMonth;
			eDay = (eDay < 10) ? "0" + eDay : eDay;

			var etxt = eYear + "-" + eMonth + "-" + eDay;

			if (today.getTime() >= sdate.getTime()
					&& today.getTime() <= edate.getTime()) {
				seled = stxt + "|" + etxt;
			}

			obj.options[obj.options.length] = new Option(stxt + "~" + etxt,
					stxt + "|" + etxt);
			obj.option
			sdate = new Date(edate.getFullYear(), edate.getMonth(), edate
					.getDate() + 1);
			edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate
					.getDate());
		}

		if (seled)
			obj.value = seled;
		
		}
	
	
</script>
