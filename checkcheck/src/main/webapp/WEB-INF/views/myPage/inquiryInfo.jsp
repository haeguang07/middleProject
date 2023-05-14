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
<h3>문의상세</h3>
<div>
	<table>
		<tr style="font-size: 1.5em">
			<th>문의제목</th>
			<td></td>
			<th>${vo.boardTitle }</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
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

<script>
	
</script>