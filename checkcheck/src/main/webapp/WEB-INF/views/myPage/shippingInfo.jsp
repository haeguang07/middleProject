<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>

<h3>기본 배송정보</h3>
<table>
	<tr>
		<th>주문번호</th>
		<td>${vo.orderId }</td>
		<th>가격</th>
		<td>${vo.payment }원</td>
	</tr>
	<tr>
		<th>주문일</th>
		<td><f:formatDate value="${vo.orderDate }" type="date"/> </td>
		<th>사용한 포인트</th>
		<td>${vo.orderPoint }</td>
	</tr>
	<tr>
		<th>상태</th>
		<td colspan="3">현재 ${vo.orderState }</td>
	</tr>
</table>
<table>
	<tr>
		<th>주문자</th>
		<td>${sesInfo.userName }</td>
		<th>받은분</th>
		<td>${vo.orderName }</td>
	</tr>
	<tr>
		<th>배송주소</th>
		<td>${vo.orderPost }</td>
	</tr>
	<tr>
		<th></th>
		<td colspan="3">${vo.orderAddress }</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td colspan="3">${vo.orderPhone }</td>
	</tr>
</table>
<table>
	<tr>
		<th></th>
		<th>상품명</th>
		<th>개수</th>
		<th>가격</th>
	</tr>
	<c:set var="t" value="0"/>
	<c:forEach var="book" items="${list}">
	<tr>
		<td><img src="${book.cover }" style="width:100px"></td>
		<td>${book.book }</td>
		<td>${book.num} </td>
		<td>${book.num*book.price }원</td>
	</tr>	
	<c:set var="t" value="${t+book.num*book.price}" />
	</c:forEach>
	
</table>
<h3>결재정보</h3>

<table>
  <tr>
    <th>총금액</th>
    <td>${t }</td>
    <th>할인금액</th>
    <td>${t-vo.payment }</td>
  </tr>
  <tr>
    <th>실 결제금액</th>
    <td>${vo.payment }</td>
  </tr>
    <tr>
    <th>결재방법 </th>
    <td>${vo.method }</td>
  </tr>
</table>
