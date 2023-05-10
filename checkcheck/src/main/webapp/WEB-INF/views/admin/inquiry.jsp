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
			<th>작성자</th>
			<th>문의일</th>
			<th>답변여부</th>
		</tr>
		<!-- 반복 -->
		<tbody id="tlist" style="text-align: center">
			<c:forEach var="i" items="${list }">
				<tr>
					<td>${i.boardId }</td>
					<td><a href='inquiryAnswerForm.do?bid=${i.boardId }&page=${pageInfo.pageNum}'>${i.boardTitle }</a></td>
					<td>${i.userName }</td>
					<td><fmt:parseDate var="bDate" value="${i.boardDate }"
							pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
							value="${bDate }" pattern="YY-MM-dd" />
							</td>
					<td>${i.checks }</td>
				</tr>
				
			</c:forEach>
		</tbody>
		<!-- 반복 -->
	</table>
</div>


<div style="text-align: center; width: 1200px; height: 50px; padding: 30px 0; margin-bottom: 50px">
		<div class="pagination2">		
			<c:if test="${pageInfo.prev }">
					<a href="adminInquiryInfo.do?page=${pageInfo.startPage-1 }&userId=${sesInfo.userId}"> 이전페이지</a>
				</c:if>
				<c:forEach var="i" begin="${pageInfo.startPage}"
					end="${pageInfo.endPage}">
					<a class="${i==pageInfo.pageNum ? 'active1':'' }"
						href="adminInquiryInfo.do?page=${i}">${i} </a>
				</c:forEach>
				<c:if test="${pageInfo.next }">
					<a href="adminInquiryInfo.do?page=${pageInfo.endPage+1 }"> 다음페이지</a>
				</c:if>				
		</div>
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
				if(result.retCode=='Success'){
					let data = result.data;
					let paging= result.DTO;
					let pagination2 = document.querySelector('.pagination2');
					pagination2.textContent='';
					if(paging.prev){
						let a = document.createElement('a');
						a.href = "noAnwserboard2.do?page="+paging.startPage-1;
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
						let tr = makeTrFunc(reply);
						tlist.append(tr);
					}
				}else if(result.retCode=='Fail'){
					alert('미답변 문의가 존재하지 않습니다');
					location.reload();
					return;
				}else{
					alert('알수 없는 오류')
				}
				
			})
		}
	})
	let showFields = ['boardId', 'boardTitle' ,'userName','boardDate', 'checks'];
		// tr 생성해주는 함수.
		function makeTrFunc(reply = {}) {
			let tr = document.createElement('tr');
			tr.id = reply.boardId; 
			// td 생성.
			for (let prop of showFields) {
				let td = document.createElement('td');
				td.innerText = reply[prop];
				if(prop=='boardTitle'){
					td.innerText='';
					let a = document.createElement('a');
					a.href='inquiryAnswerForm.do?bid='+reply['boardId'];
					a.innerText = reply[prop];
					td.append(a);
				}
				else if(prop=='boardDate'){
					td.innerText = td.innerText.substring(2, 10)
				}
				tr.append(td);
			}
			let td = document.createElement('td');
			tr.append(td);

			return tr; //생성한 tr 을 반환.
		}
</script>