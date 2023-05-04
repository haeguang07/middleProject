<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
	<div
	style="flex: 1; border: 1px black solid; margin: 5px; height: 500px; float: left; display: block;">
	<p id="hoverkorea" style="display: inline-block; margin: 0 20px">����������</p>
	<ul id="mypage_sidebar" style="list-style: none;">
		<li>ȸ����������</li>
		<li><a href="#!">�������� ����</a></li>
		<li><a href="#!">ȸ��Ż��</a></li>
		<li><a href="#!">���̸���</a></li>
		<li>����</li>
		<li><a href="#!">���� </a>0��</li>
		<li><a href="#!">����Ʈ </a>500��</li>
		<li>�ֹ�����</li>
		<li><a href="#!">�ֹ� ��ȸ</a></li>
		<li><a href="#!">��� �ֹ� ����</a></li>
		<li><a href="#!">���� ����</a></li>
		<li><a href="#!">���ǳ���</a></li>
	</ul>
</div>
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
	<c:forEach var="book" items="${list}">
	<tr>
		<td><img src="${book.cover }"></td>
		<td>${book.book }</td>
		<td>${book.num} </td>
		<td>${book.num*book.price } (���� ����Ʈ ${book.num*book.price/1000 }��)</td>
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
    <th>������ </th>
    <td>${vo.method }</td>
  </tr>
</table>
