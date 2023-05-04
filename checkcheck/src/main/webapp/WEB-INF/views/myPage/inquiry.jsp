<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h3>문의 작성</h3>
<div>
	<form action="#">
		<fieldset>
			<label for="title">제목</label><input type="text" name="title">
			<textarea rows="5" cols="25" name="subject" id="editor"></textarea>
			<button type="submit">작성</button>
		</fieldset>
	</form>
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
		<c:forEach var="b" items="${list }">
			<!-- 문의내용 -->
			<tr>
				<td>${b.boardDate }</td>
				<td>${b.boardId }</td>
				<td>${b.boardTitle }</td>
				<td>${b.checks }</td>
			</tr>
			<!-- 답변내용 -->
			<tbody style="display: none">
				<tr>
					<td>답변일</td>
					<td colspan="3">${coment.date }</td>
				</tr>
				<tr >
					<td colspan="4">${coment.suject }</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
</div>
<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		CKEDITOR.replace('subject', {
			filebrowserUploadUrl : 'inquiry.do'
		});
	})
</script>