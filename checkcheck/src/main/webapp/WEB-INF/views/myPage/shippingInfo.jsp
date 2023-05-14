<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>

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
		<td><f:formatDate value="${vo.orderDate }" type="date"/> </td>
		<th>����� ����Ʈ</th>
		<td>${vo.orderPoint }</td>
	</tr>
	<tr>
		<th>����</th>
		<td colspan="3">���� ${vo.orderState }</td>
	</tr>
</table>
<table>
	<tr>
		<th>�ֹ���</th>
		<td>${sesInfo.userName }</td>
		<th>������</th>
		<td>${vo.orderName }</td>
	</tr>
	<tr>
		<th>����ּ�</th>
		<td>${vo.orderPost }</td>
	</tr>
	<tr>
		<th></th>
		<td colspan="3">${vo.orderAddress }</td>
	</tr>
	<tr>
		<th>��ȭ��ȣ</th>
		<td colspan="3">${vo.orderPhone }</td>
	</tr>
</table>
<table>
	<tr>
		<th></th>
		<th>��ǰ��</th>
		<th>����</th>
		<th>����</th>
	</tr>
	<c:set var="t" value="0"/>
	<c:forEach var="book" items="${list}">
	<tr>
		<td><img src="${book.cover }" style="width:100px"></td>
		<td>${book.book }</td>
		<td>${book.num} </td>
		<td>${book.num*book.price }��</td>
	</tr>	
	<c:set var="t" value="${t+book.num*book.price}" />
	</c:forEach>
	
</table>
<h3>��������</h3>

<table>
  <tr>
    <th>�ѱݾ�</th>
    <td>${t }</td>
    <th>���αݾ�</th>
    <td>${t-vo.payment }</td>
  </tr>
  <tr>
    <th>�� �����ݾ�</th>
    <td>${vo.payment }</td>
  </tr>
    <tr>
    <th>������ </th>
    <td>${vo.method }</td>
  </tr>
</table>
