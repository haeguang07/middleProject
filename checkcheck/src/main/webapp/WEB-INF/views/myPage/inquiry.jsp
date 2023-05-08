<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>문의 작성</h3>
<div>
	<form action="inquiryAdd.do" method="post">
		<fieldset>
			<table>
				<tr>
					<th><label for="title">문의제목</label></th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>문의내용</th>
					<td><textarea rows="5" cols="25" name="subject" id="subject"></textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="attach"></td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: right;"><button type="submit">작성</button></td>
				</tr>

			</table>
		</fieldset>
	</form>
</div>
<div>
	<select>
		<option value="all">전체</option>
		<option value="2023">2023년</option>
		<option value="2022">2022년</option>
		<option value="2021">2021년</option>
		<option value="2020">2020년</option>
		<option value="2019">2019년</option>
	</select> <select>
		<option value="01">1월</option>
		<option value="02">2월</option>
		<option value="03">3월</option>
		<option value="04">4월</option>
		<option value="05">5월</option>
		<option value="06">6월</option>
		<option value="07">7월</option>
		<option value="08">8월</option>
		<option value="09">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
	</select>
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
				<tr>
					<td colspan="4">${coment.suject }</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
</div>
