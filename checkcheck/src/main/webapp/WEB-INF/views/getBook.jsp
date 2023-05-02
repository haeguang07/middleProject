<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
	#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}
</style>
<section style="display: flex">
	<div style="float: right; flex: 1"></div>
	<div id="top" style="flex: 2">
		<p style="margin: 10px">코스모스</p>
		<p>저자 () , 출판사 () , 발간일 ()</p>
		<img src="image/logo.png"
			style="float: left; width: 300px; height: 400px">
		<form action="" method="post" style="float: right; margin: 20px">
			<table style="width: 250px; height: 250px">
				<tr>
					<td>정가</td>
					<td>17900</td>
				</tr>
				<tr>
					<td>포인트</td>
					<td>100</td>
				</tr>
				<tr>
					<td>별점</td>
					<td>5</td>
				</tr>
				<tr>
					<td>수량</td>
					<td>
						<div id='result'>1</div> <input type='button'
						onclick='count("minus")' value='- ' /> <input type='button'
						onclick='count("plus")' value='+' />
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="장바구니"></td>
					<td><input type="submit" value=" 구매 "></td>
					<td><input type="submit" value="선물하기"></td>
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
	<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
		Perferendis, labore nobis tenetur inventore, dolores, reiciendis hic
		ipsum tempore aliquid nulla fuga voluptatibus necessitatibus quibusdam
		laborum blanditiis. Commodi optio natus numquam. Lorem ipsum dolor sit
		amet consectetur adipisicing elit. Architecto eligendi, incidunt
		doloremque rerum itaque inventore magnam enim magni sed at, aut nulla
		ipsa doloribus, voluptatem dolore minima maiores dolores tenetur.</p>
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
	<form name="myform" id="myform" method="post" action="./save">
    <fieldset>
        <legend>이모지 별점</legend>
        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
        <input type="radio" name="rating" value="1" id="rate5" checked><label for="rate5">⭐</label>
        <input type="text" id="reply"><span>${sesInfo.email }</span>
				<button type="submit" id="addBtn">등록</button>
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
				<th>삭제</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody id="tlist">

		</tbody>
	</table>

</div>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script>
		
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
		
		let showFields = ['replyId', 'reply', 'replyWriter']
		let xhtp = new XMLHttpRequest(); //Ajax 호출.
		xhtp.open('get', 'replyList.do?nid=${notice.noticeId}');
		xhtp.send();
		xhtp.onload = function () {
			//console.log(xhtp.response);
			let tlist = document.querySelector('#tlist');
			//목록생성.
			let data = JSON.parse(xhtp.response);
			for (let reply of data) {
				console.log(reply);
				let tr = makeTrFunc(reply);
				tlist.append(tr);
			}
		}

		// tr 생성해주는 함수.
		function makeTrFunc(reply = {}) {
			let tr = document.createElement('tr');
			tr.id = reply.replyId; // tr 속성추가: 댓글번호

			// this 1) Object 안에서 사용되면 object자체를 가리킴.
			//      let obj = {name: "hong", age: 20, showInfo: function() { this.age + this.name }}
			//      2) function 선언안에서 this는 window 전역객체. <-> 지역
			//      function add() { console.log(this) }
			//      3) event 안에서 사용되는 this는 이벤트 받는 대상.
			//      document.getElementById('tlist').addEventListener('click',function() {console.log(this)})
			// tr 클릭이벤트.
			tr.addEventListener('dblclick', function (e) {
				let writer = this.children[2].innerText;
				
				console.log(writer, '${sesInfo.email }');
				if(writer != '${sesInfo.email}') {
					alert('권한이 없습니다.');
					return;
				}
				
				console.log(this);
				let template = document.querySelector('.template').cloneNode(true);
				console.log(template);
				//template.children[0].innerText = reply.replyId;
				//template.children[1].children[0].value = reply.reply;
				//template.children[2].innerText = reply.replyWriter;
				template.querySelector('td:nth-of-type(1)').innerText = reply.replyId;
				template.querySelector('td:nth-of-type(2)>input').value = reply.reply;
				template.querySelector('td:nth-of-type(3)').innerText = reply.replyWriter;
				template.querySelector('button').addEventListener('click', function (e) {
					// Ajax 호출.
					let replyId = reply.replyId;
					let replyCon = this.parentElement.parentElement.children[1].children[0].value;
					console.log(replyId, replyCon);
					
					let xhtp = new XMLHttpRequest();
					xhtp.open('post', 'modifyReply.do');
					xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					xhtp.send('rid='+replyId+'&reply='+replyCon);
					xhtp.onload = function() {
						let result = JSON.parse(xhtp.response);
						if (result.retCode == 'Success') {
							// 화면변경.
							alert('성공.');
							console.log(result.data);
							tr = makeTrFunc(result.data);
							document.getElementById('tlist').replaceChild(tr, template);
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
			// td 생성.
			for (let prop of showFields) {
				let td = document.createElement('td');
				td.innerText = reply[prop];
				tr.append(td);
			}
			//삭제버튼.
			let btn = document.createElement('button');
			btn.addEventListener('click', function (e) {
				let writer = btn.parentElement.previousElementSibling.innerText;

				console.log(writer, '${sesInfo.email }');
				if (writer != '${sesInfo.email}') {
					alert('권한이 없습니다.');
					return;
				}


				console.log(btn.parentElement.parentElement);
				let rid = btn.parentElement.parentElement.id;
				// db에서 삭제 후... 화면에서 삭제.
				let xhtp = new XMLHttpRequest();
				xhtp.open('post', 'removeReply.do');
				xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xhtp.send('rid=' + rid); // 요청방식 post일 경우에 parameter를 send() 포함.

				xhtp.onload = function () {
					let result = JSON.parse(xhtp.response);
					if (result.retCode == 'Success') {
						// 화면에서 지우기.
						btn.parentElement.parentElement.remove(); // 제거.
						alert('삭제 완료');
					} else if (result.retCode == 'Fail') {
						alert('처리중 에러발생.');
					} else {
						alert('알수 없는 결과값입니다.');
					}
				}
			});
			btn.innerText = '삭제';
			let td = document.createElement('td');
			td.append(btn);
			tr.append(td);

			return tr; //생성한 tr 을 반환.
		}

		// 등록이벤트...
		document.querySelector("#addBtn").addEventListener('click', addReplyFnc);

		function addReplyFnc(e) {
			// 로그인 여부를 체크해서 로그인 정보가 없으면 로그인화면으로 이동하기.
			let id = document.querySelector('#content span').innerText;
			if (id == null || id == '') {
				alert("로그인 후에 처리하세요.");
				location.href = 'loginForm.do';
				return;
			}
			let replySub = document.querySelector('#reply').innerText;
			if (replySub == null || replySub == '') {
				alert("댓글 내용을 입력하세요.");
				document.getElementById("reply").focus();
				return;
			}
			console.log('click', e.target);
			console.log('reply', document.querySelector("#reply").value);
			console.log('id', "${sesInfo.email }");
			let reply = document.querySelector("#reply").value;

			// Ajax 호출.  post 형태
			let xhtp = new XMLHttpRequest();
			xhtp.open('post', 'addReply.do');
			xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xhtp.send('id=${id }&reply=' + reply + "&notice_id=${noticeInfo.noticeId}");
			xhtp.onload = function () {
				console.log(xhtp.response);
				let result = JSON.parse(xhtp.response);
				if (result.retCode == 'Success') {
					// 값을 활용해서 tr 생성.
					let tr = makeTrFunc(result.data);
					tlist.append(tr);

					// 입력값 초기화하기.
					document.getElementById("reply").value = '';
					document.getElementById("reply").focus();
				} else if (result.retCode == 'Fail') {
					alert('처리중 에러.');
				}
			}
		}
	
	</script>
