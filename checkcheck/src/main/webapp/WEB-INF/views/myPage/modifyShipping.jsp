<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<h3>기본 배송정보</h3>
<table>
	<tr>
		<th>주문번호</th>
		<td>${vo.orderId }</td>
		<th>가격</th>
		<td>${vo.payment }원</td>
	</tr>
	<tr>
		<th>주문일</th>
		<td><f:formatDate value="${vo.orderDate }" type="date" /></td>
		<th>사용한 포인트</th>
		<td>${vo.orderPoint }</td>
	</tr>
	<tr>
		<th>상태</th>
		<td colspan="3">현재 ${vo.orderState }</td>
	</tr>
</table>
<form action="modifyShipping.do">
<input type="hidden" value=${vo.orderId } name="id">
<table>
	<tr>
		<th>주문자</th>
		<td>${sesInfo.userName }</td>
		<th>받은분</th>
		<td><input type="text" value="${vo.orderName }" name="name" id="name"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="joinPost" id="joinPost" style="width: 90px;" value="${vo.orderPost }">
			<button type="button" id="post" onclick="execDaumPostcode()">우편번호 찾기</button></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><input type="text" name="joinAdr" id="joinAdr" style="width: 400px;" value="${vo.orderAddress }"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="text" name="joinAdr2" id="joinAdr2" placeholder="상세주소"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td colspan="3"><input type="text" value="${vo.orderPhone }" name="phone" id="phone"></td>
	</tr>
	<tr>
	<td><button type="submit">주소변경</button></td>
	</tr>
</table>
</form>
<table>
	<tr>
		<th></th>
		<th>상품명</th>
		<th>개수</th>
		<th>가격</th>
	</tr>
	<c:forEach var="book" items="${list}">
		<tr>
			<td><img src="${book.cover }" style="width:100px"></td>
			<td>${book.book }</td>
			<td>${book.num}</td>
			<td>${book.num*book.price }(적립 포인트 ${book.num*book.price/1000 }원)</td>
		</tr>
	</c:forEach>

</table>
<h3>결재정보</h3>
<table>
	<tr>
		<th>총금액</th>
		<td></td>
		<th>할인금액</th>
		<td>30,000</td>
	</tr>
	<tr>
		<th>실 결제금액</th>
		<td>${vo.payment }</td>
	</tr>
	<tr>
		<th>결재방법</th>
		<td>${vo.method }</td>
	</tr>
</table>
<button id="cancel" onclick=cancel()>주문취소</button>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
	function execDaumPostcode() {
		daum.postcode.load(function () {
			new daum.Postcode({
				oncomplete: function (data) {
					var addr = '';
					var extraAddr = '';
					if (data.userSelectedType === 'R') {
						addr = data.roadAddress;
					} else {
						addr = data.jibunAddress;
					}
					if (data.userSelectedType === 'R') {
						if (data.bname !== '' &&
							/[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						if (data.buildingName !== '' &&
							data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' +
								data.buildingName :
								data.buildingName);
						}
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
					}
					document.getElementById('joinPost').value = data.zonecode;
					document.getElementById("joinAdr").value = addr;
					document.getElementById("joinAdr2").focus();
				}
			}).open();
		});
	}
function cancel(){
	if(confirm('정말로 취소하시겠습니까?')){
		let id =window.location.search;
		console.log(id);
		location.href='cancleOrder.do'+id;
	}
}

	</script>
