<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="padding: 50px; margin: 50px;">
	<input type="checkbox" value="" name="selectall"
		onclick="selectAll(this)">
		<label style="margin:0 10px">전체선택</label>
		<input type="submit" value="변경">
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
			<tr>
				<td><input type="checkbox" value="" name="chulgobook"></td>
				<td>2023050122871</td>
				<td>user01</td>
				<td>230501</td>
				<td>
					<p>97900030303</p>
					<p>97900030303</p>
					<p>97900030303</p>
					<p>97900030303</p>
				</td>
			</tr>
			<!-- 반복문 끝  -->
		</tbody>
	</table>
</div>
<script>
    function selectAll(selectAll) {
        const checkboxes = document.getElementsByName('chulgobook');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
    }
</script>