<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<c:forEach var="r" items="${list }">
		<tr>
			<td>${r.reviewId }</td>
			<td>${r.reviewDate }</td>
			<td>${r.bookName }</td>
			<td><textarea rows="2" cols="10" readonly="readonly">${r.reviewSubject}</textarea>
			</td>
			<td><c:forEach begin="1" end="${r.starcount }">★</c:forEach></td>
			<td><button onclick=deleteRe(e)>삭제</button></td>
		</tr>
	</c:forEach>

</table>
<script>
function deleteRe(e){
	if(confirm('정말로 삭제하시겠습니까?')){
		let rid=this.parentElement.parentElement.children[0].innerText;
		fetch('deleteReview.do?rid='+rid)
		.then(reslove=> reslove.json)
		.then(result=>{
			if(result.reqCode=='Success'){
				alert('삭제 성공');
				this.parentElement.parentElement.remove();
			}else if(result.reqCode=='Fail'){
				alert('삭제 실패');
			}else{
				alert('알수없는 오류')
			}
		})
		
	}
}
</script>
