<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#joinForm {
			width: 700px;
			margin: 0 auto;
		}

		.joinLable {
			color: #333333;
			font-size: 12px;
		}

		.textjoin1 {
			width: 200px;
			vertical-align: middle;
			border-width: 1px;
			border-color: rgb(153, 153, 153) rgb(223, 223, 223) rgb(223, 223, 223) rgb(153, 153, 153);
			background-color: rgb(235, 235, 235);
			color: rgb(51, 51, 51);
			height: 30px;
			padding: 0px 7px;
		}

		.explanText {
			color: #787878;
			font-size: 12px;
			padding: 0 0 0 14px;
		}

		img {
			width: 20%;
		}

		.inline-blcok {
			display: inline-block;
		}

		#step2 {
			display: none;
		}
	</style>

</head>

<body>
	<div id="joinForm">
		<img src="image/logo.png" class="inline-blcok">
		<div class="inline-blcok">
			<h3>회원가입</h3>
			<p>회원이 되어 다양한 해택을 경험해 보세요</p>
		</div>
		<form action="join.do">
			<div id="step1">
				<table>
					<!-- 아이디-->
					<tr>
						<td>아이디</td>
						<td><input type="text" class="textjoin1" id="joinId"></td>
						<td><button class="joinButton" id="idCheck">중복체크</button></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" class="explanText">(4자~12자리의 영문자, 숫자 / @,#$등
							특수문자는 제외)</td>
					</tr>
					<tr>
						<!-- 비밀번호-->
						<td>비밀번호</td>
						<td><input type="password" class="textjoin1" name="joinPw" id="joinPw"></td>
						<td class="explanText">영문, 숫자, 특수문자 중 2가지 조합하여 8자~15자리</td>
					</tr>
					<!-- 비밀번호 확인-->
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" class="textjoin1" name="pwCheck" id="pwCheck"></td>
						<td class="explanText">비밀번호를 다시 한번 입력해주세요</td>
					</tr>
					<!-- 주소-->
					<tr>
						<td>주소</td>
						<td><input type="text" class="textjoin1" name="joinPost" id="joinPost" style="width: 90px;"
								placeholder="우편번호">
							<button class="joinButton" id="post" onclick="execDaumPostcode()">우편번호
								찾기</button></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><input type="text" class="textjoin1" name="joinAdr" id="joinAdr" style="width: 400px;"
								placeholder="주소"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" class="textjoin1" name="joinAdr2" id="joinAdr2" placeholder="상세주소"></td>

					</tr>
					<!-- 이메일-->
					<tr>
						<td>이메일</td>
						<td><input type="email" class="textjoin1" name="joinEmail" id="joinEmail"></td>
						<td><button type="button" class="joinButton" id="sendEmail">인증번호
								보내기</button></td>
					</tr>
					<!-- 인증하기-->
					<tr>
						<td></td>
						<td><input type="text" class="textjoin1" name="certify" id="certifytext">
						<td><button type="button" class="joinButton" id="certify">인증하기</button></td>
					</tr>
					<!-- 전화번호-->
					<tr>
						<td>닉네임</td>
						<td><input type="text" class="textjoin1" id="nickname"></td>
						<td><button type="button" class="joinButton" id="nickcheck">중복체크</button></td>
					</tr>
					<!-- 성별-->
					<tr>
						<td>성별</td>
						<td><label><input type="radio" name="gender" id="male" checked="checked">남성</label><label><input
									type="radio" name="gender" id="female">여성</label></td>
						<td></td>
					</tr>
					<!-- 생년월일-->
					<tr>
						<td>생년월일</td>
						<td><input type="text" class="textjoin1" name="birth" id="birth" placeholder="YYYY-MM-DD"></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><button type="button" id="nextBtn">다음단계</button></td>
					</tr>
				</table>
			</div>
			<div id="step2">


				<table>
					<tr>
						<td colspan="2"><b>관심분야를 설정하세요(최대 5개)</b></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="check1" id="check1">
							<label for="check1">경제경영</label></td>
						<td><input type="checkbox" name="check1" id="check2">
							<label for="check1">건강취미</label></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="check1" id="check3">
							<label for="check1">과학</label></td>
						<td><input type="checkbox" name="check1" id="check4">
							<label for="check1">건강/취미</label></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="check1" id="check5">
							<label for="check1">공무원 수험서</label></td>
						<td><input type="checkbox" name="check1" id="check6">
							<label for="check1">달력/기타</label></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="check1" id="check7">
							<label for="check1">대학교제</label></td>
						<td><input type="checkbox" name="check1" id="check8">
							<label for="check1">만화</label></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="check1" id="check9">
							<label for="check1">사회과학</label></td>
						<td><input type="checkbox" name="check1" id="check10">
							<label for="check1">소설</label></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="check1" id="check11">
							<label for="check1">어린이</label></td>
						<td><input type="checkbox" name="check1" id="check12">
							<label for="check1">에세이</label></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="check1" id="check13">
							<label for="check1">여행</label></td>
						<td><input type="checkbox" name="check1" id="check14">
							<label for="check1">역사</label></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><button id="submit">회원가입하기</button></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script>
		function execDaumPostcode() {
			daum.postcode.load(function () {
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
							if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '' && data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
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
	</script>
	<script>
		let num;
		let btn = document.querySelector('#sendEmail');
		let email = document.getElementById('joinEmail');
		btn.addEventListener('click', function (e) {
			let emailText = email.value;
			console.log(emailText);
			if (emailText == "") {
				alert('이메일을 입력하세요');
				return;
			}
			fetch('checkEmail.do?joinEmail=' + emailText)
				.then(resolve => resolve.json())
				.then(result => {
					num = result.num;
				})
				.catch(err => console.log(err))
		});
		let cBtn = document.querySelector('#certify');
		cBtn.addEventListener('click', function (e) {
			let cNum = document.querySelector('#certifytext').value;
			num = document.querySelector('#retCode').value;
			console.log(num)
			if (cNum == num) {
				alert('인증이 완료 되었습니다');
				email.disabled = 'disabled';
			} else {
				alert('인증번호를 정확히 입력하세요');
			}
		})
		//정규식
		let regId = /^[a-zA-Z0-9]{4,12}*$/; // 4자~12자리의 영문자, 숫자
		let regPw = /^[a-zA-Z0-9!@#$%^&*()?_~]{8,15}$/; // 8~15자리 숫자, 영문, 특수문자 조합
		let reqNick =/[^?a-zA-Z0-9/]{1,8}/;// 1~8자리 한글포함 특수문자와 공백

		let id = document.querySelector('#joinId');
		let pw = document.querySelector('#joinPw');
		let pw2 = document.querySelector('#pwCheck');
		let post = document.querySelector('#joinPost');
		let adr = document.querySelector('#joinAdr');
		let adr2 = document.querySelector('#joinAdr2');
		let email2 = document.getElementById('joinEmail');
		let certifytext = document.getElementById('certifytext');
		let nickname = document.getElementById('nickname');
		let birth = document.querySelector('#birth');
		//아이디 체크
		let idCheckBtn = document.querySelector('#idCheck');
		idCheckBtn.addEventListener('click', function () {
			if (!regId.test(id.value)) {
				alert('아이디는 4자~12자리의 영문자, 숫자를 입력하세요');
				return;
			} else {
				fetch('userIdCheck.do')
					.then(resolve => resolve.json())
					.then(result => {
						if (result.retCode == 'Success') {
							alert('중복체크 성공');
							id.name = 'joinId';
							console.log(id);
						} else if (result.retCode == 'Fail') {
							alert('이미 있는 아이디 입니다. 다시 입력해주세요');
							id.value = '';
							id.focus();
						} else {
							alert('알 수 없는 오류');
						}
					})
			}
		})

		//닉네임 중복체크
		let nickcheckBtn =document.querySelector('#nickcheck');
		nickcheckBtn.addEventListener('click', function () {
			if (!reqNick.test(nickname.value)) {
				alert('닉네임는 1~8자리 한글포함 특수문자를 입력하세요');
				return;
			} else {
				fetch('nickCheck.do')
					.then(resolve => resolve.json())
					.then(result => {
						if (result.retCode == 'Success') {
							alert('중복체크 성공');
							nickname.name = 'nickname';
							console.log(nickname);
						} else if (result.retCode == 'Fail') {
							alert('이미 있는 닉네임 입니다. 다시 입력해주세요');
							nickname.value = '';
							nickname.focus();
						} else {
							alert('알 수 없는 오류');
						}
					})
			}
		})

		//비밀번호 체크
		function pwCheck() {
			if (!regPw.test(pw.value)) {
				alert("비밀번호는 숫자, 영문, 특수문자 조합으로 8~15자리를 사용해야 합니다.");
				return false;
			}
			let chk = 0;
			if (pw.value.search(/[0-9]/g) != -1) chk++;
			if (pw.value.search(/[a-z]/ig) != -1) chk++;
			if (pw.value.search(/[!@#$%^&*()?_~]/g) != -1) chk++;
			if (chk < 2) {
				alert("비밀번호는 숫자, 영문, 특수문자를 두가지이상 혼용하여야 합니다.");
				return false;
			}
			// 동일한 문자/숫자 4이상, 연속된 문자
			if (/(\w)\1\1\1/.test(pw.value) || isContinuedValue(pw.value)) {
				alert("비밀번호에 4자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다.");
				return false;
			}

			// 아이디 포함 여부
			if (pw.value.search(id.value) > -1) {
				alert("ID가 포함된 비밀번호는 사용하실 수 없습니다.");
				return false;
			}

			// 기존 비밀번호와 새 비밀번호 일치 여부
			if (pw.value == pw2.value) {
				alert("기존 비밀본호와 새 비밀번호가 일치합니다.");
				return false;
			}
		}
		let nextBtn = document.querySelector('#nextBtn');
		nextBtn.addEventListener('click', function (e) {
			if (!regId.test(id.value)) {
				alert('아이디는 4자~12자리의 영문자, 숫자를 입력하세요');
				return;
			} else if (!id.name) {
				alert('아이디 중복체크를 해주세요')
			} else if (pwCheck()) {
				pw.value = '';
				pw2.value = '';
				return;
			} else if (!email2.readonly) {
				alert('이메일 인증을 해주세요');
			} else if (!nickname.name) {
				alert('닉네임 중복체크를 해주세요');
			} else if (birth.value == '') {
				alert('생년월일을 입력하세요')
			}




			document.querySelector('#step1').style.display = 'none';
			document.querySelector('#step2').style.display = 'block';


		})
	</script>
</body>

</html>