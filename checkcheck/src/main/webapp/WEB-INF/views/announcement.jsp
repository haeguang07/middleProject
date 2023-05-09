<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.pagination2 {
	display: inline-block;
	text-align: center;
}

.pagination2 a {
	color: black;
	float: left;
	padding: 15px 30px;
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
<div style="width:1000px;text-align: center;margin:0 auto">
<table class="table" style="border: black solid 1px">
	<thead>
		<tr>
			<th style="width:10%"><input type="checkbox" name="announcement" value="selectall" onclick='checkSelectAll()'></th>
			<th style="width:10%">글번호</th>
			<th style="width:60%">제목</th>
			<th style="width:20%">작성일</th>
		</tr>
	</thead>
	<tbody id="announceList">
		<c:forEach var="item" items="${board }">
			<tr>
			<td><input type="checkbox" name="announcement" value=""></td>
			<td>${item.boardId }</td>
			<td>${item.boardTitle }</td>
			<td>${item.boardDate }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
	<div style="text-align: center; width: 1200px; height: 50px; padding: 30px 0; margin-bottom: 50px">
		<div class="pagination2">		
				<c:if test="${pageInfo.prev }">
						<a
							href="announcement.do?&page=${pageInfo.startPage-1 }">Previous</a>
				</c:if>
				<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<a class="${i==pageInfo.pageNum ? 'active1' : '' }"
							href="announcement.do?&page=${i }">${i } </a>
				</c:forEach>
				<c:if test="${pageInfo.next }">
						<a
							href="announcement.do?&page=${pageInfo.endPage+1 }">Next</a>
				</c:if>			
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script>
function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('input[name="remember"]');
	  // 선택된 체크박스
	  const checked 
	    = document.querySelectorAll('input[name="remember"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }

}

function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('announcement');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}
</script>