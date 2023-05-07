<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	