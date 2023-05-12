<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
<div id="number">
	<h3>10권 미만의 책이 (${total }) 권 있습니다</h3><br>
	<h3>확인한 후 재고를 추가해주세요</h3>
</div>
<div id="tableBoard">
	<input id="allcheck" type="checkbox" name="selectall" value="" onclick='selectAll(this)'>
		<input id="booknum" type="number" name="booknum" value="1"> 
		<input id="all" type="button" value="추가">
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<th>책이름</th>
					<th>남은 권수</th>
					<th>수량 선택</th>
					<th>추가</th>
				</tr>
			</thead>
			<tbody>
	<c:forEach var="stock" items="${stockWarningList }">
				<tr>
					<td><input type="checkbox" name="book" value="${stock.isbn }"></td>
					<td>${stock.bookName }</td>
					<td>${stock.bookStock }</td>
					<td style="width:50px"><input id="booknum" type="number" value="1"></td>
					<td><input type="button" value="추가" onclick=oneButton(this)></td>
				</tr>
	</c:forEach>
			</tbody>
		</table>
	<div style="text-align: center; width: 1200px; height: 50px; padding: 30px 0; margin-bottom: 50px">
		<div class="pagination2">
					<c:if test="${pageInfo.prev }">
						<a href="bookStock.do?page=${pageInfo.startPage-1 }">Previous</a>
					</c:if>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<a class="${i==pageInfo.pageNum ? 'active1' : '' }"
							href="bookStock.do?page=${i }">${i } </a>
					</c:forEach>
					<c:if test="${pageInfo.next }">
						<a
							href="bookStock.do?page=${pageInfo.endPage+1 }">Next</a>
					</c:if>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
		<script>
			function selectAll(selectAll) {
				const checkboxes = document.getElementsByName('book');

				checkboxes.forEach((checkbox) => {
					checkbox.checked = document.querySelector('#allcheck').checked;
				})
			}
			document.querySelector('#booknum').addEventListener('click',function(){
				let num = document.querySelector('#booknum');
				if(num.value < 1){
					alert('1권 이하의 수량은 선택할수없습니다.')
					num.value = 1;
				}
			})
			
			
			//전체 추가 버튼 눌렀을시
			document.getElementById('all').addEventListener('click',function(){
				let allNum = document.getElementById('booknum').value;
				let list = document.querySelectorAll('input[name=book]');
				let isbnList = [];
				for(i of list){
					if(i.checked){
						isbnList.push({"isbn":+i.value});
					}
				}
				console.log(isbnList);
				     $.ajax({
				    	 type:"POST",
				    	 url:"modifyStock.do",
				    	 data:{
				    		book: JSON.stringify(isbnList),
				    		booknum : allNum
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
			
			//단일로 버튼 눌렀을시
			function oneButton(thing){
				
				let bookinfo = thing.parentElement.parentElement.children[0].children[0].value;
				let bookjson = [{"isbn":bookinfo}];
				let num = thing.parentElement.previousElementSibling.children[0].value;
				$.ajax({
					type:"POST",
					url: "modifyStock.do",
					data:{
						book:JSON.stringify(bookjson),
						booknum : num
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
			}
		</script>