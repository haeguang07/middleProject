<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<label><input type="checkbox" id="checked">미답변문의만 확인</label>
<div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>답변여부</th>
			<th>작성자</th>
			<th>문의일</th>
		</tr>
		<!-- 반복 -->
		<tbody id="tlist">
		<c:forEach var="i" items="${list }">
			<tr>
				<td>${i.boardId }</td>
				<td>${i.boardTitle }</td>
				<td>${i.checks }</td>
				<td>${i.userName }</td>
				<td><fmt:parseDate var="bDate" value="${i.boardDate }"
						pattern="YYYY-MM-dd HH:mm:ss" /> <fmt:formatDate value="${bDate }"
						pattern="YY년 MM월 dd일" /></td>
			</tr>
		</c:forEach>
		</tbody>
		<!-- 반복 -->
	</table>
</div>
<script>

	document.querySelector('#checked').addEventListener('click',function(){
		if(!this.checked){
			location.reload()
		}else if(this.checked){
			let tlist=document.querySelector('#tlist');
			tlist.textContent='';
			fetch('noAnwserboard2.do')
			.then(resolve=> resolve.json())
			.then(result=>{
				let data = result.data;
				let paging= result.DTO;
				let pagination2 = document.querySelector('.pagination2');
				if(paging.prev){
					let a = document.createElement('a');
					a.href = "noAnwserboard2.dopage="+paging.startPage-1;
					a.innerText = "이전";
					pagination2.append(a);
				}
				for(let i = 0 ; i < paging.endPage ; i++){
					let a = document.createElement('a');
					a.className = i+1 == paging.pageNum ? 'active1' : '' ;
					a.href = "noAnwserboard2.do?page="+i;
					a.innerText = i+1 ;
					pagination2.append(a);
				}
				if(paging.next){
					let a = document.createElement('a');
					a.href = "noAnwserboard2.do?page="+paging.endPage-1;
					a.innerText = "다음";
					pagination2.append(a);
				}
				for (let reply of data) {
					console.log(reply);
					let tr = makeTrFunc(reply);
					tlist.append(tr);
				}
			})
		}
	})
	let showFields = ['boardId', 'boardTitle', 'checks' ,'userName','boardDate'];
		// tr 생성해주는 함수.
		function makeTrFunc(reply = {}) {
			let tr = document.createElement('tr');
			tr.id = reply.boardId; 
			// td 생성.
			for (let prop of showFields) {
				let td = document.createElement('td');
				td.innerText = reply[prop];
				tr.append(td);
			}
			let td = document.createElement('td');
			tr.append(td);

			return tr; //생성한 tr 을 반환.
		}
</script>