<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<div>
	<div>
		<p>
			***님, 안녕하세요! <br> 멤버십 등급 : 일반 자세히보기<br> 멤버십 회원이 되시면 구매 금액의
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
					<td>${order.orderDate }</td>
					<td>${order.orderId }</td>
					<td><a
						href="getNotice.do?nid=${order.orderId }&page=${pageInfo.pageNum}">
							${order.book }</a></td>
					<td>${order.orderState }</td>
					<td><a href="#">변경/취소</a></td>
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