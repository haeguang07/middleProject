<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form style="padding: 50px;">
	<div id="addBookSearch">
		<select id="method">
			<option value="title">제목</option>
			<option value="isbn">ISBN</option>
		</select> <input id="search" style="width: 500px; margin-left: 100px;"
			type="text" placeholder="검색"> <input id="searchbtn" type="button"
			value="검색">
	</div>
	<div style="padding: 10px">
		<input id="selectall" type="checkbox" value="selectall"
			name="selectall" onclick='selectAll(this)'>
		<p style="display: inline-block;">전체선택</p>
		<input class=num type="number" value="1">
		<button type="submit">추가</button>
	</div>
	<%= request.getParameter("test") %>
	${booklist eq null }
	${test eq null }

	<!-- 반복시작-->
	<c:forEach var="b" items="${booklist }">
	<div id="addBookList"
		style="display: flex; text-align: center; border-bottom: 1px solid rgba(0, 0, 0, 0.13); padding: 10px">
		<div style="flex: 0.5"></div>
		<div style="flex: 1; position: relative;">
			<input type="checkbox" value="책이름" name="addbook"
				style="position: absolute; top: 10px; left: 10px"> <img
				src="${b.cover }" alt="책표지" style="width: 200px; height: 300px">
		</div>
		<table id="table" style="flex: 1; margin: 30px">
				<tr>
					<td style="font-size: 14px">책이름</td>
					<td>${b.bookName }</td>
				</tr>
				<tr>
					<td>저자</td>
					<td>${b.author }</td>
				</tr>
				<tr>
					<td>출판사</td>
					<td>${b.publisher }</td>
				</tr>
				<tr>
					<td>isbn</td>
					<td>${b.isbn }</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${b.bookPrice }</td>
				</tr>
		</table>
		<div style="flex: 2; position: relative;">
			<div style="position: absolute; bottom: 10px">
				<input class=num type="number" value="1"> <input
					type="submit" value="추가">
			</div>
		</div>
	</div>
	</c:forEach>
	<!-- 반복끝 -->
	<!-- 페이징  -->
	<div
		style="text-align: center; width: 1200px; height: 50px; padding: 30px 0; margin-bottom: 50px">
		<div class="pagination2"></div>
	</div>
</form>
<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>
<script>
    let url;
    let search;
    let arr =[];
        function selectAll(selectAll) {
            const checkboxes = document.getElementsByName('addbook');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = document.querySelector('#selectall').checked;
            })
        }
        let nums = document.querySelectorAll('.num');
        nums.forEach((num) => num.addEventListener('click', function () {
            if (num.value < 1) {
                alert('1권 이하의 수량은 추가 할 수없습니다.')
                num.value = 1;
            }
        }))
        
   
	
	
		
	  // 콜백 함수입니다.
		  function bookDisplay(success, data) {
        	let empty =[];
        	for(let i = 0 ;i<3 ; i++){
        		let str = JSON.stringify(data.item[i]);
        		empty.push(str);
        	}
        	console.log(empty);
        	let realdata = {"name": empty};
        	
        	
        	/* let formDataArr ={"name":[]};
		 	 for(let i = 0 ; i < data.item.length ; i++){ 
		 	let formData = [data.item[i].isbn13 ,data.item[i].title , data.item[i].priceStandard , data.item[i].author ,data.item[i].publisher,data.item[i].categoryName , data.item[i].description,data.item[i].cover,data.item[i].pubDate];
		 	formDataArr.push(formData);
		 	} */
        	 let f = document.createElement('form');
        	 for(let i=0;i<empty.length;i++){
        		let input =	 document.createElement('input');
        		input.id =i;
        		input.name="name";
        		input.value=empty[i];
        		console.log(input.value);
        		f.append(input);
        	 }
        	 f.setAttribute('method', 'post');
        	 f.setAttribute('action', 'addBook.do');
        	 document.body.appendChild(f);
        	 f.submit();
        	 return;
		 	    
		    
		 	}
		  
	 // AJAX 요청을 보냅니다. getJSON() 함수는 알라딘 API 대용으로 사용불가.
	    document.getElementById('searchbtn').addEventListener('click',function(){
	    	let keyword = document.getElementById('search').value;
	    	if(keyword == ''){
	    		alert('검색어를 입력하세요');
	    		return;
	    	}
	    	search = keyword;	
			 if(document.getElementById('method').value == 'title'){
			   url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbhbj040030858001&cover=big&MaxResults=3&query="+search+"&output=js&callback=bookDisplay";
			 }else{
			   url = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbhbj040030858001&cover=big&itemIdType=ISBN&ItemId="+search+"&output=js&callback=bookDisplay";
			 }
			 
		  $.ajax({
		     url: url,
		     jsonp: "bookDisplay",
		     dataType: "jsonp"
		  });
	    });
		  
	


    </script>