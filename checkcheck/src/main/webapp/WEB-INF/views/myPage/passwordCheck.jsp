<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>

	<p>
		비밀번호 재확인${result }<br> 개인정보 보호를 위해 비밀번호를 다시 확인합니다.
	</p>
	<table>
		<tr>
			<td>아이디</td>
			<td>${sesInfo.userId }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input id="pw" type="password" name="pw"></td>
			<td><input id="btn" type="submit" value="확인"></td>
		</tr>
	</table>

</div>
<script>
	document.querySelector('#btn').addEventListener('click', function () {
				let pw = document.querySelector('#pw').value;
				fetch('myPageUserInfo.do', {
						method: "POST",
						headers: {
							'Content-Type': 'application/x-www-form-urlencoded',
						},
						body: 'pw=' + pw
					})
					.then(resolve => resolve.json())
					.then(result => {
						if (result.retCode == 'Success') {
							location.href='modifyUserForm.do';
						} else if (result.retCode == 'Fail') {
							alert('비밀번호 오류');
						} else {
							alert('알수 없는 오류');
						}
					})
				})
</script>