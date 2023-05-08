<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<h3>회원정보 수정</h3>

<table>
	<tr>
		<th>아이디</th>
		<td>${sesInfo.userId }</td>
		<td></td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${sesInfo.userName }</td>
		<td></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" name="nick" id="nick" value="${sesInfo.nickname }"></td>
		<td><button id="nickBtn">변경하기</button></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${sesInfo.email }</td>
		<td></td>
	</tr>
	<tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="joinPost" id="joinPost" style="width: 90px;" value="${sesInfo.userPost }">
			<button class="joinButton" id="post" onclick="execDaumPostcode()">우편번호 찾기</button></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><input type="text" name="joinAdr" id="joinAdr" style="width: 400px;" value="${sesInfo.userAddress }"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="text" name="joinAdr2" id="joinAdr2" placeholder="상세주소"></td>
		<td><button id="adrBtn">변경하기</button></td>
	</tr>

	<tr>
		<th>휴대전화</th>
		<td>${sesInfo.userPhone }</td>
		<td></td>
	</tr>
	<tr>
		<th>비밀번호 변경</th>
		<td><input type="password" name="pw" id="pw"></td>
		<td></td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" name="pw2" id="pw2"></td>
		<td><button id="pwBtn">변경하기</button></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>
			<fmt:parseDate var="parsedDate" value="${sesInfo.userBirth }" pattern="yyyy-MM-dd HH:mm:ss" />
			<fmt:formatDate value="${parsedDate }" pattern="YYYY년MM월dd일" />
		</td>
		<td></td>
	</tr>
</table>
<br>
<h3>계정연동 여부</h3>
<table>
	<tr>
		<th>네이버</th>
		<td>연동중</td>
		<td><button>연동해지하기</button></td>
	</tr>
	<tr>
		<th>카카오</th>
		<td><button>연동하기</button></td>
		<td></td>
	</tr>
	<tr>
		<th>구글</th>
		<td><button>연동하기</button></td>
		<td></td>
	</tr>
</table>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
	function execDaumPostcode() {
		daum.postcode
			.load(function () {
				new daum.Postcode({
					oncomplete: function (data) {
						var addr = '';
						var extraAddr = '';
						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}
						if (data.userSelectedType === 'R') {
							if (data.bname !== '' &&
								/[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '' &&
								data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', ' +
									data.buildingName :
									data.buildingName);
							}
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
						}
						document.getElementById('joinPost').value = data.zonecode;
						document.getElementById("joinAdr").value = addr;
						document.getElementById("joinAdr2").focus();
					}
				}).open();
			});
	}
	let nickBtn = document.querySelector('#nickBtn');
	nickBtn.addEventListener('click', nickChange);

	let adrBtn = document.querySelector('#adrBtn');
	adrBtn.addEventListener('click', adrChange);
	
	let pwBtn = document.querySelector('#pwBtn');
	adrBtn.addEventListener('click', pwChange);

	function nickChange(e) {
		let nick = document.querySelector('#nick').value;
		
		fetch('nickChange.do?nick=' + nick)
			.then(resolve => resolve.json())
			.then(result => {
				
				if (result.userId != null) {
					alert('닉네임 변경 성공');
					document.querySelector('#joinPost').value = result.vo.nickname;
				} else if (result.reqCode == 'Fail') {
					alert('변경실패');
				} else {
					alert('알수 없는 오류');
				}
			})
	}

	function adrChange(e) {
		let post = document.getElementById('joinPost').value;
		let adr1 = document.getElementById("joinAdr").value;
		let adr2 = document.getElementById("joinAdr2").value;
		fetch('adrChange.do?',{
			method: 'post',
			   headers: {
			     "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
			   },
			   body: 'post='+post
		})
			.then(resolve => resolve.json())
			.then(result => {
				if (result.reqCode == 'Success') {
					alert('주소 변경 성공');
					document.querySelector('#joinPost').value = result.vo.UserPost;
					document.querySelector('#joinAdr').value = result.vo.UserAdrress;
				} else if (result.reqCode == 'Fail') {
					alert('변경실패');
				} else {
					alert('알수 없는 오류');
				}
			})
	}

	function pwChange(e) {
		let pw = document.querySelector('#pw').value;
		let pw2=document.querySelector('#pw2').value;
		if(pw==pw2){
		fetch('pwChange.do?pw=' + pw)
			.then(resolve => resolve.json())
			.then(result => {
				if (result.reqCode == 'Success') {
					alert('페스워드 변경 성공');
					document.querySelector('#pw').value = '';
					document.querySelector('#pw2').value = '';
				} else if (result.reqCode == 'Fail') {
					alert('변경실패');
				} else {
					alert('알수 없는 오류');
				}
			})
		}else{
			alert('비밀번호가 일치하지 않습니다')
		}
	}
</script>