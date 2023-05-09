<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
td{
	width:150px;
}
.pagination2 {
	display: inline-block;
	text-align: center;
}

.pagination2 a {
	color: black;
	float: left;
	padding: 15px 30px;
	text-decoration: none;
}

.pagination2 a.active1 {
	background-color: #4CAF50;
	color: white;
}

.pagination2 a:hover:not(.active1) {
	background-color: #ddd;
}
</style>

<h3>포인트 정보</h3>
<p>남은 포인트 ${sesInfo.userPoint }p</p>
<table>
	<tr>
		<th>사용일</th>
		<th>사용한 포인트</th>
	</tr>
	<c:forEach var="p" items="${list }">
		<tr>
			<td><fmt:formatDate value="${p.orderDate }" pattern="YYYY-MM-dd"/> </td>
			<td>${p.orderPoint }P</td>
		</tr>
	</c:forEach>
</table>