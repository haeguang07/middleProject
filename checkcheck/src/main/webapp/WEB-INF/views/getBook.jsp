<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#myform fieldset {
	display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	direction: rtl; /* 이모지 순서 반전 */
	border: 0; /* 필드셋 테두리 제거 */
}

#myform fieldset legend {
	text-align: left;
}

#myform input[type=radio] {
	display: none; /* 라디오박스 감춤 */
}

#myform label {
	font-size: 3em; /* 이모지 크기 */
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#myform label:hover {
	text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}
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

</style>
<section style="display: flex">
	<div style="float: right; flex: 1"></div>
	<div id="top" style="flex: 2">
		<p style="margin: 10px">${book.bookName }</p>
		<p style="font-size: 14px">${book.author }, ${book.publisher } ,
			${book.pubDate }</p>
		<input type="text" id="bookisbn" style="display:none" value="${book.isbn }">
		<img src="${book.cover }"
			style="float: left; width: 300px; height: 400px; box-shadow: 5px 5px 5px #000;">
		<form action="" method="post" style="float: right; margin: 20px">
			<table style="width: 250px; height: 250px">
				<tr>
					<td>정가</td>
					<td id="bookPrice">${book.bookPrice }</td>
				</tr>
				<c:choose>
					<c:when test="${sesInfo.userGrade eq 'normal' }">
						<tr>
							<td>포인트</td>
							<fmt:parseNumber var="point" value="${book.bookPrice*0.01 }"
								integerOnly="true" />
							<td id="point">${point }</td>
						</tr>
					</c:when>
					<c:when test="${sesInfo.userGrade eq 'vip' }">
						<tr>
							<td>포인트</td>
							<fmt:parseNumber var="point" value="${book.bookPrice*0.03 }"
								integerOnly="true" />
							<td id="point">${point }</td>
						</tr>
					</c:when>
					<c:when test="${sesInfo.userGrade eq 'vvip' }">
						<tr>
							<td>포인트</td>
							<fmt:parseNumber var="point" value="${book.bookPrice*0.05 }"
								integerOnly="true" />
							<td id="point">${point }</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>포인트</td>
							<td>0</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr>
					<td>별점</td>
					<td>5</td>
				</tr>
				<tr>
					<td><p style="display: inline-block">수량 :</p>
						<p id="bookCount" style="display: inline-block">${book.bookStock }</p></td>
					<td>
						<div id='result'>1</div> <input type='button'
						onclick='count("minus")' value='- ' /> <input type='button'
						onclick='count("plus")' value='+' />
					</td>
				</tr>
				<tr>
					<td><input type="button" value="장바구니" onclick=insertBasket()></td>
					<td><input type="button" value=" 구매 " onclick=insertOrder(this)></td>
					<td><input type="button" value="선물하기" onclick=insertPresent(this)></td>
				</tr>
			</table>
		</form>
	</div>
	<div style="float: right; flex: 1"></div>
</section>
<div id="middle"
	style="text-align: center; margin: 20px 0; border: 1px black solid; padding: 50px">
	<h4>책 목차</h4>
	<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
		Perferendis, labore nobis tenetur inventore, dolores, reiciendis hic
		ipsum tempore aliquid nulla fuga voluptatibus necessitatibus quibusdam
		laborum blanditiis. Commodi optio natus numquam. Lorem ipsum dolor sit
		amet consectetur adipisicing elit. Architecto eligendi, incidunt
		doloremque rerum itaque inventore magnam enim magni sed at, aut nulla
		ipsa doloribus, voluptatem dolore minima maiores dolores tenetur.</p>
	<h4>책 줄거리</h4>
	<p>${book.bookDetail }</p>
	<div>
		<img id="getDetail" onError="this.parentElement.style.visibility='hidden'" >
	</div>
	<h4>책 평</h4>
	<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
		Perferendis, labore nobis tenetur inventore, dolores, reiciendis hic
		ipsum tempore aliquid nulla fuga voluptatibus necessitatibus quibusdam
		laborum blanditiis. Commodi optio natus numquam. Lorem ipsum dolor sit
		amet consectetur adipisicing elit. Architecto eligendi, incidunt
		doloremque rerum itaque inventore magnam enim magni sed at, aut nulla
		ipsa doloribus, voluptatem dolore minima maiores dolores tenetur.</p>
</div>
<div id="bottom">
	<div id='content'>
		<form name="myform" id="myform"
			style="position: relative">
			<fieldset>
				<legend>이모지 별점</legend>
				<input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
				<input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
				<input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
				<input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
				<input type="radio" name="rating" value="1"id="rate5" checked><label for="rate5">⭐</label>
				<input type="text" id="reply"><span style="margin: 0 10px">${sesInfo.nickname }</span>
				<input id="addbtn" type="button" value="등록" style="position: absolute; bottom: 10px; left: 70px">
			</fieldset>
		</form>

	</div>

	<table class="table">
		<thead>
			<tr>
				<th>댓글번호</th>
				<th>글내용</th>
				<th>작성자</th>
				<th>별점</th>
				<th>작성일</th>
				<th>삭제/수정</th>
			</tr>
		</thead>
		<tbody id="tlist">
			<c:forEach var="rv" items="${reviewList }">
				<tr>
					<td>${rv.reviewId }</td>
					<td>${rv.reviewSubject }</td>
					<td>${rv.nickname }</td>
					<td>
						<c:forEach var="num" begin="1" end="${rv.starcount }">
							★
						</c:forEach>
					</td>
					<td>${rv.reviewDate }</td>
					<td><input class="delete" type="button" value="삭제"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<div style="text-align: center; width: 1200px; height: 50px; padding: 30px 0; margin-bottom: 50px">
		<div class="pagination2">		
				<c:if test="${pageInfo.prev }">
					<a href="getBook.do?page=${pageInfo.startPage-1 }&bookInfo=${book.isbn}"> 이전페이지</a>
				</c:if>
				<c:forEach var="i" begin="${pageInfo.startPage}"
					end="${pageInfo.endPage}">
					<a class="${i==pageInfo.pageNum ? 'active1':'' }"
						href="getBook.do?page=${i}&bookInfo=${book.isbn}">${i} </a>
				</c:forEach>
				<c:if test="${pageInfo.next }">
					<a href="getBook.do?page=${i}&bookInfo=${book.isbn}"> 다음페이지</a>
				</c:if>				
		</div>
	</div>
	
	
	
	<table style="display: none;">
		<tbody>
			<tr class="template">
				<td>10</td>
				<td><input type="text" class="reply"></td>
				<td>user01</td>
				<td>user01</td>
				<td>user01</td>
				<td><input type="button" value="수정"/></td>
			</tr>
		</tbody>
	</table>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script>

		function insertBasket(){
			let result = document.querySelector('#result').innerText;
			if("${sesInfo}"==""){
				alert('로그인후 이용가능합니다');
				return;
			}else{
				const resultElement = document.getElementById('result');
	
				// 현재 화면에 표시된 값
				let number = resultElement.innerText;
				let bookCount = document.getElementById('bookCount').innerText;
				console.log(number);
				console.log(bookCount);
				if(bookCount > 0){
					if(number < document.querySelector('#bookCount').innerText ){
						fetch("addBasket.do?isbn=${book.isbn}&userId=${sesInfo.userId}&count="+result)
						.then(result => result.json())
						.then(resolve =>{
							
							if(resolve.retCode == 'Success'){
								
								if(confirm('장바구니로 이동하시겠습니까?')){
									location.href="basket.do";
								}
							}
						})
						.catch(error => console.log(error));
					}
				}else{
					alert('재고가 부족합니다!! 장바구니에 넣을수 없습니다!!');
				}
			}
		}
		function insertOrder(field){
			let isbn = document.getElementById('bookisbn').value;
			console.log(isbn);
			
			if("${sesInfo}"==""){
				alert('로그인후 이용가능합니다');
				return;
			}else{
				const resultElement = document.getElementById('result');
	
				// 현재 화면에 표시된 값
				let number = resultElement.innerText;
				console.log(number);
				let bookCount = document.getElementById('bookCount').innerText;
				if(bookCount>1){
					if(number > document.getElementById('bookCount').innerText ){
						alert('책의 재고보다 많은 수량은 주문 할 수없습니다');
						number = document.querySelector('#bookCount').innerText;
					}
					else{
						location.href="delivery.do?isbn="+isbn;
					}
				}else if(bookCount<1){
					alert('재고가 부족합니다!! 구매가 불가능합니다!!');
				}
			}
		}
		function insertPresent(field){
			console.log('presenttest');
			let isbn = document.getElementById('bookisbn').value;
			let isbn1 = document.getElementById('bookisbn');
			console.log(isbn);
			let bookName = isbn1.parentElement.children[0].innerText;
			console.log(bookName);
			//let bookPrice = field.parentElement.parentElement.children[0].children[1].innerText;
			let bookPrice = document.getElementById('bookPrice').innerText;
			console.log(bookPrice);
			let basketCount = document.getElementById('result').innerText;
			console.log(basketCount);
			let bookPoint = document.getElementById('point').innerText;
			console.log(bookPoint);
			const resultElement = document.getElementById('result');

			// 현재 화면에 표시된 값
			let number = resultElement.innerText;
			let bookCount = document.getElementById('bookCount').innerText;
			if(bookCount>1){
			if(number > document.querySelector('#bookCount').innerText ){
				alert('책의 재고보다 많은 수량은 주문 할 수없습니다');
				number = document.querySelector('#bookCount').innerText;
				
			}else{
				location.href="basketDelivery.do?presentcheck=1&isbn="+isbn+"&bookName="+bookName+"&bookPrice="+bookPrice+"&basketCount="+basketCount;
			}
			}else if(bookCount<1){
				alert('재고가 부족합니다!! 주문하실 수 없습니다!!');
			}
		}
	  	$('#star a').click(function(){ 
	  		 $(this).parent().children("a").removeClass("on");    
	  		 $(this).addClass("on").prevAll("a").addClass("on");
	  		 console.log($(this).attr("value"));
	  	 });
		function count(type) {
			// 결과를 표시할 element
			const resultElement = document.getElementById('result');

			// 현재 화면에 표시된 값
			let number = resultElement.innerText;

			// 더하기/빼기
			if (type === 'plus') {
				number = parseInt(number) + 1;
				if(number > document.querySelector('#bookCount').innerText ){
					alert('책의 재고보다 많은 수량은 주문 할 수없습니다');
					number = document.querySelector('#bookCount').innerText;
					
				}
			} else if (type === 'minus') {
				number = parseInt(number) - 1;
				if (number < 1) {
					alert('1 이상의 수량만 가능합니다');
					number = 1;
				}
			}

			// 결과 출력
			resultElement.innerText = number;
		}
		//댓글 가져옴
		let showFields = ['reviewId', 'reviewSubject', 'nickname' ,'starcount','reviewDate'];
		let xhtp = new XMLHttpRequest(); //Ajax 호출.
		xhtp.open('get', 'review.do?isbn='+${book.isbn});
		xhtp.send();
		xhtp.onload = function () {
			//console.log(xhtp.response);
			let tlist = document.querySelector('#tlist');
			//목록생성.
			let data = JSON.parse(xhtp.response).data;
			console.log("test");
			console.log(data);
			for (let reply of data) {
				console.log(reply);
			}
		}

		//수정기능
				document.querySelector('#tlist').querySelectorAll('tr').forEach(tr => {tr.addEventListener('dblclick', function (e) {
				let modifyCheck = document.querySelector('#tlist').children;
				for(let i = 0 ; i < modifyCheck.length ; i++){
						if(modifyCheck[i].className == 'template'){
							alert('동시에 수정 불가합니다');
							return;
						}
				}
				let writer = this.children[2].innerText;
				
				console.log(writer, '${sesInfo.nickname }');
				if(writer != '${sesInfo.nickname}') {
					alert('권한이 없습니다.');
					return;
				}
				
				console.log(this);
				let template = document.querySelector('.template').cloneNode(true);
				let clonetr = this.cloneNode(true);
				console.log(template);
				//template.children[0].innerText = reply.replyId;
				//template.children[1].children[0].value = reply.reply;
				//template.children[2].innerText = reply.replyWriter;
				template.querySelector('td:nth-of-type(1)').innerText = this.children[0].innerText;
				template.querySelector('td:nth-of-type(2)>input').value = this.children[1].innerText;
				template.querySelector('td:nth-of-type(3)').innerText = this.children[2].innerText;
				template.querySelector('td:nth-of-type(4)').innerText = this.children[3].innerText;
				template.querySelector('td:nth-of-type(5)').innerText = this.children[4].innerText;
				//수정 버튼 누를시
				template.querySelector('input[type="button"]').addEventListener('click', function (e) {
					// Ajax 호출.
					let reviewId = document.querySelector('.template').children[0].innerText;
					let reviewSubject =document.querySelector('.template').children[1].children[0].value;
					
					let xhtp = new XMLHttpRequest();
					xhtp.open('post', 'modifyReview.do');
					xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					xhtp.send('rid='+reviewId+'&nickname=${sesInfo.nickname}&reviewSubject='+reviewSubject);
					xhtp.onload = function() {
						let result = JSON.parse(xhtp.response);
						if (result.retCode == 'Success') {
							// 화면변경.
							alert('성공.');
							console.log(result.data);
							clonetr.children[1].innerText = reviewSubject;
							document.getElementById('tlist').replaceChild(clonetr, template);
						} else if (result.retCode == 'Fail') {
							alert('처리중 에러.');
						} else {
							alert('알수 없는 반환값.');
						}
					}
				});
				// 화면전환.
				document.getElementById('tlist').replaceChild(template, tr);
			})
				});
			
			//삭제버튼.
			let btns = document.querySelectorAll('.delete');
			btns.forEach(btn => {btn.addEventListener('click', function (e) {
				let writer = btn.parentElement.parentElement.children[2].innerText;

				if (writer != '${sesInfo.nickname}') {
					alert('권한이 없습니다.');
					return;
				}

				let rid = this.parentElement.parentElement.children[0].innerText;
				// db에서 삭제 후... 화면에서 삭제.
				let xhtp = new XMLHttpRequest();
				xhtp.open('post', 'deleteReview.do');
				xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xhtp.send('rid=' + rid); // 요청방식 post일 경우에 parameter를 send() 포함.

				xhtp.onload = function () {
					let result = JSON.parse(xhtp.response);
					if (result.retCode == 'Success') {
						// 화면에서 지우기.
						btn.parentElement.parentElement.remove(); // 제거.
						alert('삭제 완료');
					} else if (result.reqCode == 'Fail') {
						alert('처리중 에러발생.');
					} else {
						alert('알수 없는 결과값입니다.');
					}
				}
			})
			});
			
		// 등록이벤트...
		document.querySelector("#addbtn").addEventListener('click', addReplyFnc);

		function addReplyFnc(e) {
			// 로그인 여부를 체크해서 로그인 정보가 없으면 로그인화면으로 이동하기.
			let id = document.querySelector('#content span').innerText;
			if (id == null || id == '') {
				alert("로그인 후에 처리하세요.");
				location.href = 'login.do';
				return;
			}
			let replySub = document.querySelector('#reply').value;
			if (replySub == null || replySub == '') {
				alert("댓글 내용을 입력하세요.");
				document.getElementById("reply").focus();
				return;
			}
			let starList = document.getElementsByName('rating')
			let starcount ;
			starList.forEach(star => {
				if(star.checked){
					starcount = star.value;
				}
			})
			let reply = document.querySelector("#reply").value;

			// Ajax 호출.  post 형태
			let xhtp = new XMLHttpRequest();
			xhtp.open('post', 'addReview.do');
			xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xhtp.send('id=${sesInfo.userId }&nickname=${sesInfo.nickname}&reviewSubject=' + reply + "&isbn=${book.isbn}&starcount="+starcount);
			xhtp.onload = function () {
				console.log(xhtp.response);
				let result = JSON.parse(xhtp.response);
				if (result.retCode == 'Success') {
					// 값을 활용해서 tr 생성.
					let tlist = document.getElementById('tlist');
					let tr = document.createElement('tr');
					let td = document.createElement('td');
					td.innerText= document.getElementById('tlist').children[0].children[0].innerText +1;
					tr.append(td);
					td = document.createElement('td');
					td.innerText = reply;
					tr.append(td);
					td = document.createElement('td');
					td.innerText = '${sesInfo.nickname}';
					tr.append(td);
					td = document.createElement('td');
					let realstar="";
					for(let i = 0 ; i < starcount ; i++){
						realstar = realstar + "★";
					}
					td.innerText = realstar;
					tr.append(td);
					td = document.createElement('td');
					let dt = new Date();
					let str1 = dt.getFullYear()+'-'+(dt.getMonth()+1)+'-'+dt.getDate()+' '+' '+ dt.getHours()+':'+dt.getMinutes()+':'+dt.getSeconds();
					td.innerText = str1;
					tr.append(td);
					tlist.insertBefore(tr,tlist.children[0])
					// 입력값 초기화하기.
					document.getElementById("reply").value = '';
					document.getElementById("reply").focus();
				} else if (result.retCode == 'Fail') {
					alert('처리중 에러.');
				}
			}
		}
		
		
		
			   var url2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbhbj040030858001&cover=big&&query="+${book.isbn} +"&output=js&callback=bookDisplay";
			 
		 
			  // 콜백 함수입니다.
			  function bookDisplay(success, data) {
				console.log(data);
			 	for(let i = 0 ; i < data.item.length ; i++){
			 	var formData = {"name" : [data.item[i].isbn]};
			 	console.log(formData);
			 	$('#getDetail').attr('src','https://image.aladin.co.kr/img/img_content/'+formData.name[0]+'_01.jpg');
				    $.ajax({
				        type: "post",
				        dataType: "json",
				        data: formData,
				        success: function (data) {
				        }
				    });
			 	 } 
				}
			     /* 여기서 책 정보를 이용해 구조를 만듭니다! */
		 // AJAX 요청을 보냅니다. getJSON() 함수는 알라딘 API 대용으로 사용불가.
			  $.ajax({
			     url: "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbhbj040030858001&cover=big&MaxResults=100&itemIdType=ISBN13&itemId="+${book.isbn}+"&output=js&callback=bookDisplay",
			     jsonp: "bookDisplay",
			     dataType: "jsonp"
			  });
		 
	</script>
