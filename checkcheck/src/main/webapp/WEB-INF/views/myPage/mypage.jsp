<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div>
	<div>
		<p>
			${vo.userName }님, 안녕하세요! <br> 멤버십 등급 : ${vo.userGrade } <br> 멤버십 회원이 되시면 구매 금액의
			1~3% 추가 포인트 및 쿠폰 혜택을 받으실 수 있습니다.
		</p>
	</div>
	<div>
		<select>
			<option value="2023">2023</option>
			<option value="2022">2022</option>
			<option value="2021">2021</option>
			<option value="2020">2020</option>
			<option value="2019">2019</option>
		</select>년 <select>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>월 <span>상품이름 </span><input type="text" style="width: 100px">
		<button>검색</button>
		<table>
			<tr>
				<th>주문일</th>
				<th>주문번호</th>
				<th>상품</th>
				<th>배송상태</th>
				<th>변경/취소</th>
			</tr>
			<c:forEach var="order" items="${list }">
				<tr>
					<td><fmt:formatDate value="${order.orderDate }"/> </td>
					<td><a
						href="shippingInfo.do?id=${order.orderId }&page=${pageInfo.pageNum}">${order.orderId }</a></td>
					<td>${order.book } 총${order.payment}원</td>
					<td>${order.orderState }</td>
					<td><a href="modifyShippingForm.do?id=${order.orderId }">변경/취소</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="center">
			<div class="pagination">
				<c:if test="${pageInfo.prev }">
					<a href="myPageMain.do?page=${pageInfo.startPage-1 }&userId=${sesInfo.userId}"> 이전페이지</a>
				</c:if>
				<c:forEach var="i" begin="${pageInfo.startPage}"
					end="${pageInfo.endPage}">
					<a class="${i==pageInfo.pageNum ? 'active':'' }"
						href="myPageMain.do?page=${i}&userId=${sesInfo.userId}">${i} </a>
				</c:forEach>
				<c:if test="${pageInfo.next }">
					<a href="myPageMain.do?page=${pageInfo.endPage+1 }&userId=${sesInfo.userId}"> 다음페이지</a>
				</c:if>
			</div>
		</div>
	</div>

</div>