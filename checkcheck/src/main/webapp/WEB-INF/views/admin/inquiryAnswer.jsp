<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		CKEDITOR.replace('answer', {
			filebrowserUploadUrl: 'ckeditor.do'
		});
	})
</script>
<h3>답변하기</h3>
<div>
	<table>
		<tr style="font-size: 1.5em">
			<th>문의제목</th>
			<th>${vo.boardTitle }</th>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${vo.userName }</td>
			<td>작성일</td>
			<td>${vo.boardDate }</td>
		</tr>
	</table>
	<p>문의 내용</p>
	${vo.boardSubject }
</div>

<c:if test="${not empty co}">
	<c:forEach var="c" items="${co }">
		<p>
			<fmt:formatDate value="${c.commentDate }" />
		</p>
		${c.commentSubject }
	</c:forEach>
</c:if>
<div>
	<textarea rows="3" cols="25" name="answer"></textarea>
	<button id="addBtn">답변하기</button>
</div>
<script>
	let addBtn = document.querySelector('#addBtn');
	addBtn.addEventListener('click', function () {
		let subject = CKEDITOR.instances.answer.getData();
		fetch('addAnswer.do', {
				method: "POST",
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded',
				},
				body: 'subject=' + subject + '&bid=${vo.boardId}'
			})
			.then(resolve => resolve.json())
			.then(result => {
				if (result.retCode == 'Success') {
					alert('답변이 성공적으로 입력되었습니다')					
					location.href='adminInquiryInfo.do';
				} else if (result.retCode == 'Fail') {
					alert('등록실패');
				} else {
					alert('알수 없는 오류');
				}
			})


	})
</script>