<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<h3>�⺻ �������</h3>
<table>
	<tr>
		<th>�ֹ���ȣ</th>
		<td>${vo.orderId }</td>
		<th>����</th>
		<td>${vo.payment }��</td>
	</tr>
	<tr>
		<th>�ֹ���</th>
		<td><f:formatDate value="${vo.orderDate }" type="date" /></td>
		<th>����� ����Ʈ</th>
		<td>${vo.orderPoint }</td>
	</tr>
	<tr>
		<th>����</th>
		<td colspan="3">���� ${vo.orderState }</td>
	</tr>
</table>
<form action="modifyShipping.do">
<table>
	<tr>
		<th>�ֹ���</th>
		<td>${sesInfo.userName }</td>
		<th>������</th>
		<td><input type="text" value="${vo.orderName }" name="name" id="name"></td>
	</tr>
	<tr>
		<th>�ּ�</th>
		<td><input type="text" name="joinPost" id="joinPost" style="width: 90px;" value="${vo.orderPost }">
			<button type="button" id="post" onclick="execDaumPostcode()">�����ȣ ã��</button></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><input type="text" name="joinAdr" id="joinAdr" style="width: 400px;" value="${vo.orderAddress }"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="text" name="joinAdr2" id="joinAdr2" placeholder="���ּ�"></td>
	</tr>
	<tr>
		<th>��ȭ��ȣ</th>
		<td colspan="3"><input type="text" value="${vo.orderPhone }" name="phone" id="phone"></td>
	</tr>
	<tr>
	<td><button type="submit">�ּҺ���</button></td>
	</tr>
</table>
</form>
<table>
	<tr>
		<th></th>
		<th>��ǰ��</th>
		<th>����</th>
		<th>����</th>
	</tr>
	<c:forEach var="book" items="${list}">
		<tr>
			<td><img src="${book.cover }" style="width:100px"></td>
			<td>${book.book }</td>
			<td>${book.num}</td>
			<td>${book.num*book.price }(���� ����Ʈ ${book.num*book.price/1000 }��)</td>
		</tr>
	</c:forEach>

</table>
<h3>��������</h3>
<table>
	<tr>
		<th>�ѱݾ�</th>
		<td></td>
		<th>���αݾ�</th>
		<td>30,000</td>
	</tr>
	<tr>
		<th>�� �����ݾ�</th>
		<td>${vo.payment }</td>
	</tr>
	<tr>
		<th>������</th>
		<td>${vo.method }</td>
	</tr>
</table>
<button id="cancel" onclick=cancel()>�ֹ����</button>
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
							/[��|��|��]$/g.test(data.bname)) {
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
	if(confirm('������ ����Ͻðڽ��ϱ�?')){
		let id =window.location.search;
		console.log(id);
		location.href='cancleOrder.do'+id;
	}
}

	</script>
