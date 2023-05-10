<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	padding: 5px 10px;
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
<h3>쿠폰 정보</h3>
<table>
	<tr>
	
		<th>쿠폰아이디</th>
		<th>발급일</th>
		<th>쿠폰내용</th>
		<th>만기일</th>
		<th>쿠폰상태</th>
	</tr>
	<c:forEach var="co"  items="${list }">
	<tr>
		<td>${co.couponId} </td>
		<td><fmt:formatDate value="${co.startdate}" pattern="YYYY-MM-dd"/> </td>
		<td><fmt:formatNumber type="percent" value="${co.discount}"/> 할인쿠폰</td>
		<td><fmt:formatDate value="${co.enddate}" pattern="YYYY-MM-dd"/></td>
		<td> ${co.couponState }</td>
	</tr>
	</c:forEach>
</table>
<div style="text-align: center">
	<div class="pagination2">
		<c:if test="${pageInfo.prev }">
			<a href="couponInfo.do?page=${pageInfo.startPage-1 }&userId=${sesInfo.userId}">
				이전페이지</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage}"
			end="${pageInfo.endPage}">
			<a class="${i==pageInfo.pageNum ? 'active1':'' }"
				href="couponInfo.do?page=${i}&userId=${sesInfo.userId}">${i} </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a
				href="couponInfo.do?page=${pageInfo.endPage+1 }&userId=${sesInfo.userId}">
				다음페이지</a>
		</c:if>
	</div>
</div>