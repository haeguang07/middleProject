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
<div style="padding:40px 0">
<table class="table" style="border: black solid 1px">
	<thead>
		<tr>
			<th style="width:5%"><input type="checkbox" name="selectall" value="selectall" onclick='selectAll(this)' style=${sesInfo.userId eq 'hbj04003' ? 'dispaly:inline' : 'display:none' }></th>
			<th style="width:15%;text-align: left;">글번호</th>
			<th style="width:50%;text-align: left;">제목</th>
			<th style="width:30%">작성일</th>
		</tr>
	</thead>
	<tbody id="announceList">
		<c:forEach var="item" items="${board }">
			<tr id="${item.boardId }">
			<td><input type="checkbox" name="announcement" value="${item.boardId }" style=${sesInfo.userId eq 'hbj04003' ? 'dispaly:inline' : 'display:none' }></td>
			<td style="text-align: left;">${item.boardId }</td>
			<td style="text-align: left"><a href="/searchAnno.do?boardId=${item.boardId }" style="text-decoration: none;color:black" >${item.boardTitle }</a></td>
			<td>${item.boardDate }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<div>
	<input type="button" value="글작성"  onclick="location.href='writeAnno.do'" style=${sesInfo.userId eq 'hbj04003' ? 'float:right;dispaly:inline;margin-left:10px' : 'float:right;display:none;margin-left:10px' } >
	<input id="deletebtn" type="button" style=${sesInfo.userId eq 'hbj04003' ? 'float:right;dispaly:inline' : 'float:right;display:none' } value="삭제">
</div>
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
	
	document.querySelector('#deletebtn').addEventListener('click',function(){
	let checkedtr = [];//check 된 tr
	let tr = document.getElementsByTagName('tr');
	let trid = [];//check 된 tr 의 id
	    
	for(let i =0 ; i < tr.length ; i++){
	    if(tr[i].children[0].children[0].checked){
	    	checkedtr.push(tr[i]);
	    }
	}
	console.log(checkedtr);
	checkedtr.forEach(tr => {
	    trid.push(tr.id);
	})
	console.log(trid);
		for(let i =0; i<trid.length ; i++){
			fetch("/removeAnno.do?boardId="+trid[i])
			.then(result => result.json())
			.then(resolve => {
				if(resolve.retCode == 'Success'){
					//0510 0054
					console.log('Success');
					window.location.reload();
				}else if(resolve.retCode == 'Fail'){
				}
			})
			.catch(error => console.log(error));
		}
	})

function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('announcement');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}
</script>