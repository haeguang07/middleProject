<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.pagination2 {
	display: inline-block;
	text-align: center;
}

.pagination2 a {
	color: black;
	float: left;
	padding: 15px 30px;
	text-decoration: none;
}

.pagination2 a.active1 {
	background-color: #4CAF50;
	color: white;
}

.pagination2 a:hover:not(.active1) {
	background-color: #ddd;
}

</style>
<form style="padding: 50px;">
	<div id="addBookSearch">
		<select id="method">
			<option value="title">제목</option>
			<option value="isbn">ISBN</option>
		</select> <input id="search" style="width: 500px; margin-left: 100px;"
			type="text" placeholder="검색" ${query eq null ? '' : 'value=' }${query ne null ? query :'' }> <input id="searchbtn" type="button"
			value="검색">
	</div>
	<div style="padding: 10px">
		<input id="selectall" type="checkbox" value="selectall"
			name="selectall" onclick='selectAll(this)'>
		<p style="display: inline-block;">전체선택</p>
		<input id="allCount" type="number" value="1">
		<input id="boxes" type="button" value="추가">
	</div>

	<!-- 반복시작-->
	<c:forEach var="b" items="${booklist }">
	<div id="addBookList"
		style="display: flex; text-align: center; border-bottom: 1px solid rgba(0, 0, 0, 0.13); padding: 10px">
		<div style="flex: 0.5"></div>
		<div style="flex: 1; position: relative;">
			<input type="checkbox" value="${b.isbn }" ${b.check eq 'be' ? 'name="addbook2"': 'name="addbook"' }
				style="position: absolute; top: 10px; left: 10px" ${b.check eq 'be' ? 'onclick="return false;"' : '' }> <img
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
				<input class=num type="number" value="1"> 
				<input type="button" value="추가">
			</div>
		</div>
	</div>
	</c:forEach>
	<!-- 반복끝 -->
	<!-- 페이징  -->
	<div style="text-align: center; width: 1200px; height: 50px; padding: 30px 0; margin-bottom: 50px">
		<div class="pagination2">
					<c:if test="${pageInfo.prev }">
						<a
							href="#" onclick=searchBook(${pageInfo.startPage-1}) >Previous</a>
					</c:if>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<a class="${i==pageInfo.pageNum ? 'active1' : '' }"
							href="#" onclick=searchBook(${i})>${i } </a>
					</c:forEach>
					<c:if test="${pageInfo.next }">
						<a
							href="#" onclick=searchBook(${pageInfo.endPage+1})>Next</a>
					</c:if>
		</div>
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
        	for(let i = 0 ;i<10 ; i++){
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
        	 let pageInput = document.createElement('input');
        	 pageInput.id='page';
        	 pageInput.name='pageInfo';
        	 pageInput.value=data.startIndex + "@" + data.totalResults;
        	 f.append(pageInput);
        	 pageInput = document.createElement('input');
        	 pageInput.id='query';
        	 pageInput.name='query';
        	 pageInput.value=data.query;
        	 f.append(pageInput);
        	 f.setAttribute('method', 'post');
        	 f.setAttribute('action', 'addBook.do');
        	 document.body.appendChild(f);
        	 f.submit();
        	 return;
		 	    
		    
		 	}
       
	        function forAddBook(Success, data){
	        	
				console.log(data);
				let allCount = document.getElementById('allCount').value;
				var formData;
				if(data.item[0].isbn13 == ''){
					if(data.item[0].isbn.charAt(0)=='K'){
						let isbn10 = data.item[0].isbn.substr(1);// isbn K로 시작할시 자르기
						console.log(isbn10);
					formData =[isbn10 ,data.item[0].title , data.item[0].priceStandard , data.item[0].author,data.item[0].publisher,data.item[0].categoryName , data.item[0].description,allCount,0,0,data.item[0].cover,data.item[0].pubDate];
					}else{
					formData =[data.item[0].isbn ,data.item[0].title , data.item[0].priceStandard , data.item[0].author,data.item[0].publisher,data.item[0].categoryName , data.item[0].description,allCount,0,0,data.item[0].cover,data.item[0].pubDate];
					}
				}else{
			 		formData = [data.item[0].isbn13 ,data.item[0].title , data.item[0].priceStandard , data.item[0].author,data.item[0].publisher,data.item[0].categoryName, data.item[0].description,allCount,0,0,data.item[0].cover,data.item[0].pubDate];
				}
			 		let formData2 ={"name": formData}
			 		console.log(formData2);
			 		console.log('ajax 시작전')
			 		
			 		/* let form = document.createElement('form');
			 		for(let i = 0 ; i < formData.length ; i++){
			 		let input = document.createElement('input');
			 		input.id='book';
			 		input.name='name';
			 		input.value=formData[i];
			 		form.append(input);
			 		}
			 		form.setAttribute("action","insertbook.do");
			 		form.setAttribute("method","POST");
			 		document.body.appendChild(form);
			 		form.submit();
			 		return; */
			 		 $.ajax({
					        type: "post",
					        url: "insertbook.do",
					        dataType: "json",
					        data:formData2,
					        success: function (data) {
					        	console.log(data);
					        	if(data.retCode=='Success'){
					        	alert('성공');
					        	}
					        }
					    });
				 
			}
	        
        //이벤트의 메소드
        function searchBook(number){
        	let page = number;
	    	let keyword = document.getElementById('search').value;
	    	if(keyword == ''){
	    		alert('검색어를 입력하세요');
	    		return;
	    	}
	    	search = keyword;	
			 if(document.getElementById('method').value == 'title'){
			   url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbhbj040030858001&cover=big&start="+page+"&MaxResults=10&query="+search+"&output=js&callback=bookDisplay";
			 }else{
			   url = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbhbj040030858001&cover=big&itemIdType=ISBN&ItemId="+search+"&output=js&callback=bookDisplay";
			 }
			 
		  $.ajax({
		     url: url,
		     jsonp: "bookDisplay",
		     dataType: "jsonp"
		  });
	    }
	 // AJAX 요청을 보냅니다. getJSON() 함수는 알라딘 API 대용으로 사용불가.
	    document.getElementById('searchbtn').addEventListener('click',searchBook);
		
	 //전체선택 박스로 추가
	 	document.getElementById('boxes').addEventListener('click',addAll);
		function addAll(){
			let count=0;
			let inputList = document.querySelectorAll('input[name=addbook]');
			let arry =[];
			for( i of inputList){
			    if(i.checked){
			        arry.push(i)
			    }
			};
			console.log(arry);
			
			for(let i = 0 ; i < arry.length ; i++){
				count++;
				let url;
				if(arry[i].defaultValue.length ==9){
					arry[i].value = 'K'+arry[i].value;
				}
				if(arry[i].defaultValue.length >10){
					url="http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbhbj040030858001&cover=big&itemIdType=ISBN13&ItemId="+arry[i].value+"&output=js&callback=forAddBook";
				}else{
					url="http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbhbj040030858001&cover=big&itemIdType=ISBN&ItemId="+arry[i].value+"&output=js&callback=forAddBook";
				}				
				
					
					
					$.ajax({
				     url: url,
				     jsonp: "forAddBook",
				     dataType: "jsonp",
				     async:true

				  });
				if(i == arry.length -1 ){
					alert('성공');
					location.reload();
				}	
			}
		}


    </script>