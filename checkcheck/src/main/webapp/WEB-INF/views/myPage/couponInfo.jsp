<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h3>쿠폰 정보</h3>
<table>
	<tr class="thead1">
	
		<th>쿠폰아이디</th>
		<th>발급일</th>
		<th>쿠폰내용</th>
		<th>만기일</th>
		<th>쿠폰상태</th>
	</tr>
	<c:if test="${empty list }">
		<tr><td colspan="5" class="tbody1">쿠폰이 존재하지 않습니다</td></tr>
	</c:if>
	<c:forEach var="co"  items="${list }" varStatus="o">
	<tr class="${o.index%2==0 ? 'trGray':''}">
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