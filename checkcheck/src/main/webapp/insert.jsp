<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>
</head>
<body>
<div class="ala" id="aladin-bookinfo9788982738562"></div>
<script>
	var main = $("div[id^=aladin-bookinfo]"); // aladin-bookinfo로 시작하는 id를 가진 div 엘리먼트를 찾습니다.
	//그 엘리먼트가 존재한다면
	if(main.length>0) { 
		/* var id = main.attr("id").substr(16); */
		  var url = "https://openapi.naver.com/v1/search/book.json";
		  var url2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbhbj040030858001&cover=big&query=경제&output=js&callback=bookDisplay";
		  
//			ISBN          NOT NULL NUMBER         
//			BOOK_NAME     NOT NULL VARCHAR2(100)  
//			BOOK_PRICE    NOT NULL NUMBER         
//			AUTHOR        NOT NULL VARCHAR2(100)  
//			PUBLISHER     NOT NULL VARCHAR2(100)  
//			BOOK_CATEGORY NOT NULL VARCHAR2(100)  
//			BOOK_DETAIL   NOT NULL VARCHAR2(1000) 
//			BOOK_COUNT             NUMBER         
//			HITCOUNT               NUMBER         
//			BOOK_STOCK             NUMBER         
//			COVER                  VARCHAR2(100)  
	  // 콜백 함수입니다.
		  function bookDisplay(success, data) {
			console.log(data);
		 	$('.ala').append("<img  src='"+data.item[0].cover+"'>")
				  fetch('insert.do?isbn=${data.item[1].isbn}&bookName=${data.item[1].title}&bookPrice=${data.item[1].priceStandard}&author=${data.item[1].author}&publisher=${data.item[1].publisher}&bookCategory=${data.item[1].categoryName}&bookDetail=${data.item[1].description}&cover=${data.item[1].cover})
					.then((resolve) => resolve.json() ) //화살표함수 쓰면 {return } 생략가능
					.then(resultData => {
						console.log(resultData); 
						for(let i=0;i<resultData.length;i++){
							let id = document.createElement('li');
							id.innerText = resultData.data.children[0];
							document.getElementById('list').append(id);
						}
					})
					.catch(error => console.log(error))
		     /* 여기서 책 정보를 이용해 구조를 만듭니다! */
		  }
	  
	 // AJAX 요청을 보냅니다. getJSON() 함수는 알라딘 API 대용으로 사용불가.
		  $.ajax({
		     url: url2,
		     jsonp: "bookDisplay",
		     dataType: "jsonp"
		  });
		 
	}

</script>
</body>
</html>