<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	#number {
		padding: 40px;
	}
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
<div style="padding: 50px; margin: 50px;">
	<input type="checkbox" value="" name="selectall"
		onclick="selectAll(this)">
		<label style="margin:0 10px">전체선택</label>
		<input id="all" type="button" value="변경">
	<table class="table" style="text-align: center;vertical-align: middle;">
		<thead>
			<td>선택</td>
			<td>주문번호</td>
			<td>신청인</td>
			<td>주문일</td>
			<td>주문내용</td>
		</thead>
		<tbody>

			<!-- 반복문시작 -->
			<c:forEach var="i" begin="0" end="${fn:length(chulgoList)-1}">
			<tr>
				<td><input type="checkbox" value="${chulgoList[i].orderId}" name="chulgobook"></td>
				<td>${chulgoList[i].orderId}</td>
				<td>${chulgoList[i].userId }</td>
				<td>${chulgoList[i].orderDate }</td>
				<td>
					<c:forEach var="j" items="${subjectList[i] }">
						<p>${j }</p>
					</c:forEach>
				</td>
			</tr>
			</c:forEach>
			<!-- 반복문 끝  -->
		</tbody>
	</table>
	<div style="text-align: center; width: 1200px; height: 50px; padding: 30px 0; margin-bottom: 50px">
		<div class="pagination2">
					<c:if test="${pageInfo.prev }">
						<a href="chulgo.do?page=${pageInfo.startPage-1 }">Previous</a>
					</c:if>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<a class="${i==pageInfo.pageNum ? 'active1' : '' }"
							href="chulgo.do?page=${i }">${i } </a>
					</c:forEach>
					<c:if test="${pageInfo.next }">
						<a
							href="chulgo.do?page=${pageInfo.endPage+1 }">Next</a>
					</c:if>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script>
    function selectAll(selectAll) {
        const checkboxes = document.getElementsByName('chulgobook');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
    }
    
    document.getElementById('all').addEventListener('click',function(){
    	let checkBoxes = document.querySelectorAll('input[name=chulgobook]');
    	let chulgoArr =[];
    		for(i of checkBoxes){
				if(i.checked){
					chulgoArr.push({"orderId":+i.value});
				}
			}
    		 $.ajax({
		    	 type:"POST",
		    	 url:"modifyOrderState.do",
		    	 data:{
		    		orderId: JSON.stringify(chulgoArr),
		    	 },
		    	 dataType:"text",
		    	 Success:function(data){
		    		 console.log(data.retCode);
		    		 console.log('성공');
		    	 },
		    	 error:function(data){
		    		 console.log(data);
		    	 },
		    	 complete:function(){
		    		 alert('성공');
		    		 location.reload();
		    	 }
		     })
    })
   
</script>