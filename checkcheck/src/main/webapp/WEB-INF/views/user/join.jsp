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
	border-color: rgb(153, 153, 153) rgb(223, 223, 223) rgb(223, 223, 223)
		rgb(153, 153, 153);
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
<input style="display:none" id="reqCode" value="${reqCode}">
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
						<td><input type="text" class="textjoin1" name="joinId"
							id="joinId"></td>
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
						<td><input type="password" class="textjoin1" name="joinPw"
							id="joinPw"></td>
						<td class="explanText">영문, 숫자, 특수문자 중 2가지 조합하여 8자~20자리</td>
					</tr>
					<!-- 비밀번호 확인-->
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" class="textjoin1" name="pwCheck"
							id="pwCheck"></td>
						<td class="explanText">비밀번호를 다시 한번 입력해주세요</td>
					</tr>
					<!-- 주소-->
					<tr>
						<td>주소</td>
						<td><input type="text" class="textjoin1" name="joinPost"
							id="joinPost" style="width: 90px;" placeholder="우편번호">
							<button class="joinButton" id="post" onclick="execDaumPostcode()">우편번호
								찾기</button></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><input type="text" class="textjoin1"
							name="joinAdr" id="joinAdr" style="width: 400px;"
							placeholder="주소"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" class="textjoin1" name="joinAdr2"
							id="joinAdr2" placeholder="상세주소"></td>

					</tr>
					<!-- 이메일-->
					<tr>
						<td>이메일</td>
						<td><input type="email" class="textjoin1" name="joinEmail"
							id="joinEmail"></td>
						<td><button class="joinButton" id="sendEmail">인증번호
								보내기</button></td>
					</tr>
					<!-- 인증하기-->
					<tr>
						<td></td>
						<td><input type="email" class="textjoin1" name="certify"
							id="certifytext">
						<td><button class="joinButton" id="certify">인증하기</button></td>
					</tr>
					<!-- 전화번호-->
					<tr>
						<td>닉네임</td>
						<td><input type="text" class="textjoin1" name="nickname"
							id="nickname"></td>
						<td><button class="joinButton" id="nickcheck">중복체크</button></td>
					</tr>
					<!-- 성별-->
					<tr>
						<td>성별</td>
						<td><label><input type="radio" class="textjoin1" name="gender"
							id="male ">남성</label><label><input type="radio" class="textjoin1" name="gender"
							id="female ">여성</label></td>
						<td></td>
					</tr>
					<!-- 생년월일-->
					<tr>
						<td>생년월일</td>
						<td><input type="text" class="textjoin1" name="birth"
							id="birth" placeholder="YYYY-MM-DD"></td>
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
						<td colspan="2" style="text-align: center;"><button
								id="submit">회원가입하기</button></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<script
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script>
	
	widow.onload=function(){
		let result = document.querySelector('#reqCode').value;
		if(result=='false'){
			alert('회원가입에 실패했습니다')
		}
	}
	
    function execDaumPostcode() {
      daum.postcode.load(function () {
        new daum.Postcode({
          oncomplete: function (data) {
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if (data.buildingName !== '' && data.apartment === 'Y') {
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if (extraAddr !== '') {
                extraAddr = ' (' + extraAddr + ')';
              }
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('joinPost').value = data.zonecode;
            document.getElementById("joinAdr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
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
    btn.addEventListener('click', function(e){
      let emailText =email.value;
      console.log(email);
      if(email==""){
        alert('이메일을 입력하세요');
        return;
      }
      
      fetch('checkEmail.do?joinEmail='+email)
      .then(resolve => resolve.json())
      .then(result=> {
        num=result.num;
      })
      .catch(err=> console.log(err))
    });
    let cBtn = document.querySelector('#certify');
    cbtn.addEventListener('click',function(e){
    	let cNum= document.querySelector('#certifytext').value;
    	if(cNum==num){
    		alert('인증이 완료 되었습니다');
    		email.disabled='disabled';
    	}else{
    		alert('인증번호를 정확히 입력하세요');
    	}
    })
    
    
	let nextBtn = document.querySelector('#nextBtn');
	nextBtn.addEventListener('click', function(e){
		if(email.disabled=='disabled'){
		document.querySelector('#step1').style.display='none';
		document.querySelector('#step2').style.display='block';
		}
		
	})
    
  </script>
</body>

</html>