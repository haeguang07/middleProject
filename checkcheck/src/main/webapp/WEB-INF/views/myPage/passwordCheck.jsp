<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div
	style="flex: 1; border: 1px black solid; margin: 5px; height: 500px; float: left; display: block;">
	<p id="hoverkorea" style="display: inline-block; margin: 0 20px">마이페이지</p>
	<ul id="mypage_sidebar" style="list-style: none;">
		<li>회원정보관리</li>
		<li><a href="#!">개인정보 수정</a></li>
		<li><a href="#!">회원탈퇴</a></li>
		<li><a href="#!">마이리뷰</a></li>
		<li>통장</li>
		<li><a href="#!">쿠폰 </a>0장</li>
		<li><a href="#!">포인트 </a>500원</li>
		<li>주문내역</li>
		<li><a href="#!">주문 조회</a></li>
		<li><a href="#!">취소 주문 내역</a></li>
		<li><a href="#!">선물 내역</a></li>
		<li><a href="#!">문의내역</a></li>
	</ul>
</div>
<div>

	<form action="myPageUserInfo.do" method="post">
	<p>비밀번호 재확인${result }<br>
	개인정보 보호를 위해 비밀번호를 다시 확인합니다.</p>
	<table>
	<tr><td>아이디</td><td>${sesInfo.userId }</td></tr>
	<tr><td>비밀번호</td><td><input type="password" name="pw"></td><td><button type="submit">확인</button></td></tr>
	</table>
	</form>
</div>
	<script>
	window.onload= function(){
		const urlParams = new URL(location.href).searchParams;
		const result = urlParams.get('result');
		if(result=='false'){
			alert('비밀번호가 일치하지 않습니다')
		}
	}
	
	</script>
	