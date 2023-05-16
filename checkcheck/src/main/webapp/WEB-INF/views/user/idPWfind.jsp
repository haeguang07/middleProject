<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>아이디/비밀번호 찾기</title>
	<style>
		#containter {
			width: 600px;
			margin: 50px auto;
		}

		
		.tab {
			display: inline-block;
			padding: 12px 20px;
			margin-right: 10px;
			background-color: #f5f5f5;
			cursor: pointer;
		}

		.tab.active {
			background-color: #ddd;
		}

		
		.form {
			display: none;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			margin-top: 20px;
			padding: 20px;
			background-color: #f5f5f5;
		}
		#findIdForm{
			display: block;
		}

		.form label {
			margin-bottom: 10px;
			
		}

		.form input[type="text"],
		.form input[type="email"],
		.form input[type="password"] {
			width: 400px;
			margin-bottom: 20px;
			padding: 10px;
			border: none;
			border-radius: 4px;
		}

		.form button[type="submit"] {
			padding: 10px 20px;
			border: none;
			border-radius: 4px;
			background-color: #4CAF50;
			color: white;
			font-size: 16px;
			cursor: pointer;
		}

		.form button[type="submit"]:hover {
			background-color: #45a049;
		}
	</style>
</head>

<body>
	<div id="containter">
		<div class="tab">
			<button class="tablinks active" id="findIdTab">아이디 찾기</button>
			<button class="tablinks" id="findPasswordTab">비밀번호 찾기</button>
		</div>

		<div id="findIdForm" class="form">
			<h2>아이디 찾기</h2>
			<form>
				<label for="findIdEmail">이메일:</label> <input type="email" id="findIdEmail" name="findIdEmail" required>
				<button type="button" id="findIdBtn">다음</button>
			</form>
		</div>
		<div id="authForm" class="form">
			<h2>인증하기</h2>
			<form>
				<label for="authCode">인증 코드:</label> 
				<input type="text" id="authCode" name="authCode" required>
				<button type="button" id="authBtn">인증하기</button>
			</form>
		</div>

		<div id="findPasswordForm" class="form">
			<h2>비밀번호 찾기</h2>
			<form>
				<label for="findPasswordId">아이디:</label> 
				<input type="text" id="findPasswordId" name="findPasswordId" required>
				<label for="findPasswordEmail">가입 이메일:</label> 
				<input type="email" id="findPasswordEmail" name="findPasswordEmail" required>
				<button type="button" id="findPasswordBtn">다음</button>
			</form>
		</div>

		<div id="authForm2" class="form">
			<h2>인증하기</h2>
			<form>
				<label for="authCode2">인증 코드:</label> 
				<input type="text" id="authCode2" name="authCode2" required>
				<button type="button" id="authBtn2">인증하기</button>
			</form>
		</div>

		<div id="setPasswordForm" class="form">
			<h2>비밀번호 재설정</h2>
			<form>
				<label for="newPassword">새로운 비밀번호:</label> <input type="password" id="newPassword" name="newPassword" required>
				<label for="confirmPassword">새로운 비밀번호 확인:</label> <input type="password" id="confirmPassword"
					name="confirmPassword" required>
				<button type="button" id="setPasswordBtn">저장</button>
			</form>
		</div>
	</div>
	<script>
		// 탭 버튼 요소들을 가져옴
		let findIdTab = document.getElementById('findIdTab');
		let findPasswordTab = document.getElementById('findPasswordTab');

		// 탭 컨텐츠 요소들을 가져옴
		let findIdForm = document.getElementById('findIdForm');
		let findPasswordForm = document.getElementById('findPasswordForm');
		let authForm = document.getElementById('authForm');
		let authForm2 = document.getElementById('authForm2');
		let setPasswordForm = document.getElementById('setPasswordForm');

		//버튼 요소들을 가져옴
		let findIdBtn = document.getElementById('findIdBtn');
		let findPasswordBtn = document.getElementById('findPasswordBtn');
		let authBtn = document.getElementById('authBtn');
		let authBtn2 = document.getElementById('authBtn2');
		let setPasswordBtn = document.getElementById('setPasswordBtn');

		// 아이디 찾기 탭을 클릭했을 때
		findIdTab.addEventListener('click', function () {
			// 아이디 찾기 탭을 활성화하고
			findIdTab.classList.add('active');
			findPasswordTab.classList.remove('active');

			// 아이디 찾기 폼을 보여주고 비밀번호 찾기 폼과 인증 폼, 비밀번호 설정 폼을 숨김
			findIdForm.style.display = 'flex';
			findPasswordForm.style.display = 'none';
			authForm.style.display = 'none';
			authForm2.style.display = 'none';
			setPasswordForm.style.display = 'none';
		});

		// 비밀번호 찾기 탭을 클릭했을 때
		findPasswordTab.addEventListener('click', function () {
			// 비밀번호 찾기 탭을 활성화하고
			findPasswordTab.classList.add('active');
			findIdTab.classList.remove('active');

			// 비밀번호 찾기 폼을 보여주고 아이디 찾기 폼과 인증 폼, 비밀번호 설정 폼을 숨김
			findPasswordForm.style.display = 'flex';
			findIdForm.style.display = 'none';
			authForm.style.display = 'none';
			authForm2.style.display = 'none';
			setPasswordForm.style.display = 'none';
		});

		// 아이디 찾기 다음 버튼을 클릭했을 때
		findIdBtn.addEventListener('click', function () {
			// 인증 폼을 보여주고 아이디 찾기 폼을 숨김
			/*fetch('findId.do')
			.then(resolve=> resolve.json)
			.then(result=>{
				if(result.retCode=='Success'){
					authForm.style.display = 'flex';
					findIdForm.style.display = 'none';
				}else if(result.retCode=='Fail'){
					alert('아이디가 존재하지 않습니다');
					return;
				}else alert('알수 없는 오류');
				
			})*/
			
		});

		// 비밀번호 찾기 다음 버튼을 클릭했을 때
		findPasswordBtn.addEventListener('click', function () {
			// 인증 폼을 보여주고 비밀번호 찾기 폼을 숨김
			authForm2.style.display = 'flex';
			findPasswordForm.style.display = 'none';
		});

		// 아이디 인증하기 버튼을 클릭했을 때
		authBtn.addEventListener('click', function () {
			// 비밀번호 설정 폼을 보여주고 인증 폼을 숨김
			setPasswordForm.style.display = 'flex';
			authForm.style.display = 'none';
		});
		// 비밀 인증하기 버튼을 클릭했을 때
		authBtn2.addEventListener('click', function () {
			// 비밀번호 설정 폼을 보여주고 인증 폼을 숨김
			setPasswordForm.style.display = 'flex';
			authForm2.style.display = 'none';
		});


		// 비밀번호 설정 버튼을 클릭했을 때
		setPasswordBtn.addEventListener('click', function () {
			// 비밀번호 설정이 완료되었다는 메시지를 출력하고 모든 폼을 숨김
			alert('비밀번호가 성공적으로 변경되었습니다.');
			findIdForm.style.display = 'none';
			findPasswordForm.style.display = 'none';
			authForm.style.display = 'none';
			setPasswordForm.style.display = 'none';
		});
	</script>
</body>

</html>