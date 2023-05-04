<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
	<div
	style="flex: 1; border: 1px black solid; margin: 5px; height: 500px; float: left; display: block;">
	<p id="hoverkorea" style="display: inline-block; margin: 0 20px">마이페이지</p>
	<ul id="mypage_sidebar" style="list-style: none;">
		<li>회원정보관리</li>
		<li><a href="#!">개인정보 수정</a></li>
		<li><a href="#!">회원탈퇴</a></li>
		<li><a href="#!">마이리뷰</a></li>
		<li>통장</li>
		<li><a href="#!">쿠폰 </a>0장</li>
		<li><a href="#!">포인트 </a>500원</li>
		<li>주문내역</li>
		<li><a href="#!">주문 조회</a></li>
		<li><a href="#!">취소 주문 내역</a></li>
		<li><a href="#!">선물 내역</a></li>
		<li><a href="#!">문의내역</a></li>
	</ul>
</div>
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
	<c:forEach var="book" items="${list}">
	<tr>
		<td><img src="${book.cover }"></td>
		<td>${book.book }</td>
		<td>${book.num} </td>
		<td>${book.num*book.price } (적립 포인트 ${book.num*book.price/1000 }원)</td>
	</tr>	
	</c:forEach>
	
</table>
<h3>결재정보</h3>
<table>
  <tr>
    <th>총금액</th>
    <td></td>
    <th>할인금액</th>
    <td>30,000</td>
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
