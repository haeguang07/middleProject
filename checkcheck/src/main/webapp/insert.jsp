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
		  var url2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbhbj040030858001&cover=big&MaxResults=100&query=시간여행자&output=js&callback=bookDisplay";
		  
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
		 	 for(let i = 0 ; i < data.item.length ; i++){
		 	var formData = {"name" : [data.item[i].isbn13 ,data.item[i].title , data.item[i].priceStandard , data.item[i].author ,data.item[i].publisher,data.item[i].categoryName , data.item[i].description,0,0,0,data.item[i].cover,data.item[i].pubDate  ]};
			    $.ajax({
			        type: "post",
			        url: "insertbook.do",
			        dataType: "json",
			        data: formData,
			        success: function (data) {
			        }
			    });
		 	 } 
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