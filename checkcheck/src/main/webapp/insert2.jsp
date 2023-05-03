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
	<div>
		<table border="1">
			<tr>
				<th>ISBN</th>
				<th>BOOK_NAME</th>
				<th>BOOK_PRICE</th>
				<th>AUTHOR</th>
				<th>PUBLISHER</th>
				<th>BOOK_CATEGORY</th>
				<th>BOOK_DETAIL</th>
				<th>BOOK_COUNT</th>
				<th>HITCOUNT</th>
				<th>BOOK_STOCK</th>
				<th>COVER</th>
			</tr>
			<tbody id="tlist">

			</tbody>
		</table>
	</div>
	<script>
	var main = $("div[id^=aladin-bookinfo]"); // aladin-bookinfo로 시작하는 id를 가진 div 엘리먼트를 찾습니다.
	//그 엘리먼트가 존재한다면
	if(main.length>0) { 
		/* var id = main.attr("id").substr(16); */
		  var url = "https://openapi.naver.com/v1/search/book.json";
		  var url2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbhbj040030858001&cover=big&query=경제&output=js&callback=bookDisplay";
			
	  // 콜백 함수입니다.
		  function bookDisplay(success, data) {
			console.log(data);
		 	$('.ala').append("<img  src='"+data.item[0].cover+"'>")
		 	for(let i=0;i<data.item.length;i++){
			 	$('#tlist').append("<tr>"
			 	+"<td>"+data.item[i].isbn13+"</td>"
			 	+"<td>"+data.item[i].title+"</td>"
			 	+"<td>"+data.item[i].priceStandard+"</td>"
			 	+"<td>"+data.item[i].author+"</td>"
			 	+"<td>"+data.item[i].publisher+"</td>"
			 	+"<td>"+data.item[i].categoryName+"</td>"
			 	+"<td>"+data.item[i].description+"</td>"
			 	+"<td>0</td>"
			 	+"<td>0</td>"
			 	+"<td>10</td>"
			 	+"<td>"+data.item[i].cover+"</td>"
			 	+"</tr>")
		 		
		 	}
				 /* fetch('insertbook.do',{
					  method: 'POST', 
					  headers: {
					    'Content-Type': 'application/json',
					  },
					  body: JSON.stringify(data.item),
				  })
					.then((resolve) => console.log(resolve)) //화살표함수 쓰면 {return } 생략가능
					.then(resultData => {
						console.log(resultData); 
						})
					})
					.catch(error => console.log(error))*/
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