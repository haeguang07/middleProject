<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>포인트 정보</h3>
<table>
	<tr>
		<th>사용일</th>
		<th>사용한 포인트</th>
	</tr>
	<c:forEach var="p" items="${list }">
		<tr>
			<td>${p.orderDate }</td>
			<td>${p.orderPoint }</td>
		</tr>
	</c:forEach>
</table>