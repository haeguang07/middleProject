<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#number {
		padding: 40px;
	}
</style>
<div id="number">
	<h3>10권 이하의 책이 () 권 있습니다</h3><br>
	<h3>확인한 후 재고를 추가해주세요</h3>
</div>
<div id="tableBoard">
	<form action="" method="post">
		<input id="allcheck" type="checkbox" name="book" value="" onclick='selectAll(this)'>
		<input id="booknum" type="number" value="1"> 
		<input type="submit" value="추가">
		<table class="table">
			<thead>
				<tr>
					<th>책이름</th>
					<th>남은 권수</th>
					<th>수량 선택</th>
					<th>추가</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox" name="book" value=""></td>
					<td>ex)1권</td>
					<td style="width:50px"><input id="booknum" type="number" value="1"></td>
					<td><input type="submit" value="추가"></td>
				</tr>
			</tbody>
		</table>
	</form>
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
		</script>
</div>