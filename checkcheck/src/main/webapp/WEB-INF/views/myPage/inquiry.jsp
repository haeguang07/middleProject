<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h3>문의 작성</h3>
<div>
	<input type="text" name="title">
	<textarea rows="5" cols="25" name="subject">
</textarea>
	<button>작성</button>
</div>
<div>
	<select>
		<option value="2023">2023</option>
		<option value="2022">2022</option>
		<option value="2021">2021</option>
		<option value="2020">2020</option>
		<option value="2019">2019</option>
	</select>년 <select>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
	</select>월
	<button>검색</button>
</div>
<div>
	<table>
		<tr>
			<th>문의일</th>
			<th>문의번호</th>
			<th>문의제목</th>
			<th>답변여부</th>
		</tr>
		<tr>
			<td>2019-05-09</td>
			<td>882097806</td>
			<td>원하는 책이 있습니다</td>
			<td>O</td>
		</tr>
		<!-- 답변내용 -->
		<tr>
			<td>답변일</td>
			<td colspan="3">: 2019-05-19</td>		
		</tr>
		<tr>
		<td colspan="4">답변내용답변내용답변내용 답변내용답변내용답변내용 답변내
용답변내용답변내용답변내용답변내용답변내용
		</td>
		</tr>
	</table>
</div>