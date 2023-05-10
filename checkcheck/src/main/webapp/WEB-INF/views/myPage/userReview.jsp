<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
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
<h3>내가쓴 리뷰</h3>
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
	</select>월 <span>도서이름 </span><input type="text" style="width: 100px">
	<button>검색</button>

</div>
<table>
	<tr>
		<th>문의번호</th>
		<th>작성일</th>
		<th>도서이름</th>
		<th>리뷰 내용</th>
		<th>별점</th>
		<th>삭제</th>
	</tr>
	<tbody id="tlist">
	<c:choose>
	<c:when test="${empty list }">
	<tr><td colspan="6" style="text-align: center">작성한 리뷰가 존재하지 않습니다 </td></tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="r" items="${list }">
			<tr class="modify">
				<td>${r.reviewId }</td>
				<td><fmt:parseDate var="date" value="${r.reviewDate }"
						pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate value="${date}"
						pattern="YYYY년 MM월 dd일" /></td>
				<td><a href='getBook.do?bookInfo=${r.isbn }'> ${fn:substring(r.bookName,0,15)}..</a></td>
				<td> ${r.reviewSubject}</td>
				<td><c:forEach begin="1" end="${r.starcount }">★</c:forEach></td>
				<td><button class='delbtn'>삭제</button></td>
			</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</tbody>
</table>

<div style="text-align: center">
	<div class="pagination2">
		<c:if test="${pageInfo.prev }">
			<a
				href="userReviewForm.do?page=${pageInfo.startPage-1 }&userId=${sesInfo.userId}">
				이전페이지</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage}"
			end="${pageInfo.endPage}">
			<a class="${i==pageInfo.pageNum ? 'active1':'' }"
				href="userReviewForm.do?page=${i}&userId=${sesInfo.userId}">${i} </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a
				href="userReviewForm.do?page=${pageInfo.endPage+1 }&userId=${sesInfo.userId}">
				다음페이지</a>
		</c:if>
	</div>
</div>
<script>


document.querySelectorAll('.delbtn').forEach(item => {item.addEventListener('click',function() {
		if (confirm('정말로 삭제하시겠습니까?')) {			
			let rid = this.parentElement.parentElement.children[0].innerText;
			fetch('deleteReview.do?rid=' + rid)
				.then(reslove => reslove.json())
				.then(result => {
					console.log(result)
					if (result.retCode == 'Success') {
						alert('삭제 성공');
						this.parentElement.parentElement.remove();
					} else if (result.retCode == 'Fail') {
						alert('삭제 실패');
					} else {
						alert('알수없는 오류')
					}
				})

		}
	})})
</script>