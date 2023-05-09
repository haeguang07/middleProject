<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p id="text">zz</p>
<!-- 41c78211acc0b305ba8a2b334cc4a5e1e182826b63f552cd9f4e16272b3ff321 -->
<script>
	let xhtp = new XMLHttpRequest();
	xhtp.onreadystatechange = function() { // onreadystatechange 이벤트 핸들러를 작성함.

	    // 서버상에 문서가 존재하고 요청한 데이터의 처리가 완료되어 응답할 준비가 완료되었을 때

	    if(this.status == 200 && this.readyState == this.DONE) {

	        // 요청한 데이터를 문자열로 반환함.

	        document.getElementById("text").innerHTML = xhtp.responseText;            

	    }

	};

	xhtp.open("GET", "https://www.nl.go.kr/seoji/SearchApi.do?cert_key=41c78211acc0b305ba8a2b334cc4a5e1e182826b63f552cd9f4e16272b3ff321&result_style=json&page_no=1&page_size=10&isbn=9788990247711", true);

	xhtp.send();
	console.log(xhtp);
</script>
</body>
</html>