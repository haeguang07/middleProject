<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table" >
	<tr>
		<td style="width:15%;background-color: black;color:white;vertical-align: middle">문의 제목 :</td>
		<td style="width:45%">${inquiry.boardTitle }</td>
		<td style="width:10%;text-align: right;background-color: black;color:white">작성일 :</td>
		<td style="width:30%">${inquiry.boardDate }</td>
	</tr>
	<tr>
		<td style="background-color: black;color:white;vertical-align: middle">문의 내용 :</td>
		<td colspan="3">${inquiry.boardSubject }</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td rowspan="4" style="background-color: black;color:white;vertical-align: middle">관리자 답변 :</td>
	</tr>
	<c:forEach var="iq" items="${inquiryCM }">
	<tr>
		<td colspan="4">${iq.commentSubject }</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	</c:forEach>
</table>
<input type="button" value="목록으로" onclick="location.href='myPageinquiry.do'">
