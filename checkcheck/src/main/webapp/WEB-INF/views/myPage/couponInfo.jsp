<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c" %>
<h3>쿠폰 정보</h3>
<table>
	<tr>
		<th>발급일</th>
		<th>쿠폰내용</th>
		<th>만기일</th>
		<th>쿠폰상태</th>
	</tr>
	<c:forEach var="co" items="${list }">
	<tr>
		<td>${co.startdate}</td>
		<td>${co.discount*100}%할인쿠폰</td>
		<td>${co.enddate}</td>
		<td>${c.couponState }</td>
	</tr>
	</c:forEach>
</table>