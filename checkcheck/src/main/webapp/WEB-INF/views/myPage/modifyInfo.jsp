<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h3>회원정보 수정</h3>
<table>
	<tr>
		<th>아이디</th>
		<td>${sesInfo.userId }</td>
		<td></td>
	</tr>
	<tr>
		<th>이름</th>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${sesInfo.nickname }</td>
		<td><button>변경하기</button></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${sesInfo.email }</td>
		<td></td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${sesInfo.userPost}</td>
		<td><button>우편번호찾기</button></td>
	</tr>
	<tr>
		<th></th>
		<td>${sesInfo.userAddress }</td>
		<td><button>변경하기</button></td>
	</tr>
	<tr>
		<th>휴대전화</th>
		<td>${sesInfo.userPhone }</td>
		<td></td>
	</tr>
	<tr>
		<th>비밀번호 변경</th>
		<td><input type="password" name="pw"></td>
		<td></td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" name="pw2"></td>
		<td><button>변경하기</button></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>${sesInfo.userBirth }</td>
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
