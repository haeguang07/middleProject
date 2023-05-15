<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		CKEDITOR.replace('subject', {
			filebrowserUploadUrl: 'ckeditor.do'
		});
	})
</script>

<h3>문의 작성</h3>
<div>
	<form action="">
		<table>
			<tr>
				<th><label for="title">문의제목</label></th>
				<td><input type="text" name="title" value=""></td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td><textarea rows="5" cols="25" name="subject" id="subject"></textarea></td>
			</tr>
		
			<tr>
				<td></td>
				<td style="text-align: right;"><input id="btn" type="button" value="작성"></td>
			</tr>
		</table>
	</form>
</div>
<div>
	<select>
		<option value="all">전체</option>
		<option value="2023">2023년</option>
		<option value="2022">2022년</option>
		<option value="2021">2021년</option>
		<option value="2020">2020년</option>
		<option value="2019">2019년</option>
	</select> <select>	
		<option value="all">전체</option>
		<option value="01">1월</option>
		<option value="02">2월</option>
		<option value="03">3월</option>
		<option value="04">4월</option>
		<option value="05">5월</option>
		<option value="06">6월</option>
		<option value="07">7월</option>
		<option value="08">8월</option>
		<option value="09">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
	</select>
	<input type="button" value="검색">
</div>
<div style="text-align: center">
	<table>
		<tr class="thead1">
			<th>문의일</th>
			<th>문의번호</th>
			<th>문의제목</th>
			<th>답변여부</th>
		</tr>
		<c:if test="${empty list }">
			<tr><td colspan="4" class="tbody1">문의한 내역이 존재하지 않습니다</td></tr>
		</c:if>
		<c:forEach var="b" items="${list }" varStatus="o">
			<tr class="${o.index%2==0 ? 'trGray':''}">
				<td>${fn:substring(b.boardDate,0,10)}</td>
				<td>${b.boardId }</td>
				<td><a href="inquiryClick.do?boardId=${b.boardId }">${b.boardTitle }</a></td>
				<td>${b.checks }</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div style="text-align: center">
	<div class="pagination2">
		<c:if test="${pageInfo.prev }">
			<a
				href="myPageinquiry.do?page=${pageInfo.startPage-1 }&userId=${sesInfo.userId}">
				이전페이지</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage}"
			end="${pageInfo.endPage}">
			<a class="${i==pageInfo.pageNum ? 'active1':'' }"
				href="myPageinquiry.do?page=${i}&userId=${sesInfo.userId}">${i} </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a
				href="myPageinquiry.do?page=${pageInfo.endPage+1 }&userId=${sesInfo.userId}">
				다음페이지</a>
		</c:if>
	</div>
</div>
<script>
	let btn = document.querySelector('#btn');
	btn.addEventListener('click', function () {
		console.log(this);
		let table = this.parentElement.parentElement.parentElement;
		let title = table.children[0].children[1].children[0].value;
		console.log(title)
		let subject = CKEDITOR.instances.subject.getData();
		if (title === '') {
			alert('제목을 입력하세요')
		} else if (subject == '') {
			alert('내용을 입력하세요')
		} else {
			fetch('inquiryAdd.do', {
					method: "POST",
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded',
					},
					body: 'title=' + title + '&subject=' + subject
				})
				.then(resolve => resolve.json())
				.then(result => {
					if (result.retCode == 'Success') {
						table.children[0].children[1].children[0].value='';
						CKEDITOR.instances.subject.setData('');
						alert('문의 등록 완료');
						location.reload();
					} else if (result.retCode == 'Fail') {
						alert('등록실패');
					} else {
						alert('알수 없는 오류');
					}
				})
		}
	})
</script>