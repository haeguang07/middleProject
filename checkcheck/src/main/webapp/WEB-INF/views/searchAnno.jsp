<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="width:1000px;text-align: center;margin:0 auto">
	<div style="padding:40px 0">
	<table class="table" style="border:1px black solid">
			<tr>
				<th style="width:20%;text-align: right">제목 : ${board.boardTitle }</th>
				<th style="width:80%;text-align: right">작성일 : ${board.boardDate }</th>
			</tr>
			<tr style="height:400px">
				<td colspan='2' style="padding:20px 40px;text-align: left">${board.boardSubject }</td>
				<td></td>
			</tr>
	</table>
	<div><input type="button" value="목록으로" style="float:right" onclick=history.back()></div>
	</div>
</div>