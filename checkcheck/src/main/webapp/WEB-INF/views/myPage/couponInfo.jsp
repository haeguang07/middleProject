<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
td{
	width:150px;
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