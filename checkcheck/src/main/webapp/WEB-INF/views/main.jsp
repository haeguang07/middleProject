<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<style>
	.btnLightBlue.btnPush {
  box-shadow: 0px 5px 0px 0px #1E8185;
}
.btnPush:hover {
  margin-top: 15px;
  margin-bottom: 5px;
}
.btnLightBlue.btnPush:hover {
  box-shadow: 0px 0px 0px 0px #1E8185;
}
.btnLightBlue.btnBorder {
  box-shadow: 0px 0px 0px 0px #01939A;
}
.btnLightBlue.btnBorder:hover {
  box-shadow: 0px 0px 0px 5px #01939A;
}

input.button {
  display: block;
  float: left;
  width: 120px;
  padding: 0;
  font-weight: 600;
  text-align: center;
  line-height: 50px;
  color: #FFF;
  border-radius: 5px;
  transition: all 0.2s ;
}
.btnLightBlue {
  background: rgb(108, 213, 234);
}

</style>

		<img src="image/pause.png" style="cursor: pointer;width:20px;height:20px" onclick=stop()>
		<img src="image/play.png" style="cursor: pointer;width:17px;height:17px" onclick=start()>
<c:choose>
	<c:when test="${not empty sesInfo}">
		<div class="section" style="margin: 20px">
			<input type="radio" name="slide" id="slide01" checked> <input
				type="radio" name="slide" id="slide02"> <input type="radio"
				name="slide" id="slide03"> <input type="radio" name="slide"
				id="slide04"> <input type="radio" name="slide" id="slide05">
			<div class="slide-wrap">
				<ul class="slidelist">
					<li style="position:relative"><a href="getBook.do?bookInfo=${list[0].isbn }" style="position: relative;text-decoration:none;color:black;text-align: center;"> <img
							src="${list[0].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide05" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 400px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${list[0].bookName }</h4>
								<p style="white-space:normal !important;color:black">${list[0].bookDetail }</p>
							</div> <img src="./img/책사진2.png"> <label for="slide02"
							class="right"></label>
					</a></li>
					<li><a href="getBook.do?bookInfo=${list[1].isbn }" style="position: relative;text-decoration:none;color:black"> <img
							src="${list[1].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide01" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 400px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${list[1].bookName }</h4>
								<p style="white-space:normal !important;color:black">${list[1].bookDetail }</p>
							</div> <img src="./img/책사진2.png"> <label for="slide03"
							class="right"></label>
					</a></li>
					<li><a href="getBook.do?bookInfo=${list[2].isbn }" style="position: relative;text-decoration:none;color:black"> <img
							src="${list[2].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide02" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 400px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${list[2].bookName }</h4>
								<p style="white-space:normal !important;color:black">${list[2].bookDetail }</p>
							</div> <img src="./img/책사진2.png"> <label for="slide04"
							class="right"></label>
					</a></li>
					<li><a href="getBook.do?bookInfo=${list[3].isbn }" style="position: relative;text-decoration:none;color:black"> <img
							src="${list[3].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide03" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 400px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${list[3].bookName }</h4>
								<p style="white-space:normal !important;color:black">${list[3].bookDetail }</p>
							</div> <img src="./img/책사진2.png"> <label for="slide05"
							class="right"></label>
					</a></li>
					<li><a href="getBook.do?bookInfo=${list[4].isbn }" style="position: relative;text-decoration:none;color:black"> <img
							src="${list[4].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide04" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 400px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${list[4].bookName }</h4>
								<p style="white-space:normal !important;color:black">${list[4].bookDetail }</p>
							</div> <img src="./img/책사진2.png"> <label for="slide01"
							class="right"></label>
					</a></li>
				</ul>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="section" style="margin: 20px;position:relative;z-index:1 !important;">
			<input type="radio" name="slide" id="slide01" checked> <input
				type="radio" name="slide" id="slide02"> <input type="radio"
				name="slide" id="slide03"> <input type="radio" name="slide"
				id="slide04"> <input type="radio" name="slide" id="slide05">
			<div class="slide-wrap" style="z-index:1 !important;">
				<ul class="slidelist">
					<li><a href="getBook.do?bookInfo=${normalList[0].isbn }" style="position: relative;text-decoration:none;color:black"> <img
							src="${normalList[0].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide05" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 450px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${normalList[0].bookName }</h4>
								<p style="white-space:normal !important;color:black">${normalList[0].bookDetail }</p>
							</div> <img src="./img/책사진2.png" style="z-index:1 !important;"> <label for="slide02"
							class="right"></label>
					</a></li>
					<li><a href="getBook.do?bookInfo=${normalList[1].isbn }" style="position: relative;text-decoration:none;color:black"> <img
							src="${normalList[1].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide01" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 450px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${normalList[1].bookName }</h4>
								<p style="white-space:normal !important;color:black">${normalList[1].bookDetail }</p>
							</div> <img src="./img/책사진2.png"> <label for="slide03"
							class="right"></label>
					</a></li>
					<li><a href="getBook.do?bookInfo=${normalList[2].isbn }" style="position: relative;text-decoration:none;color:black"> <img
							src="${normalList[2].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide02" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 450px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${normalList[2].bookName }</h4>
								<p style="white-space:normal !important;color:black">${normalList[2].bookDetail }</p>
							</div> <img src="./img/책사진2.png"> <label for="slide04"
							class="right"></label>
					</a></li>
					<li><a href="getBook.do?bookInfo=${normalList[3].isbn }" style="position: relative;text-decoration:none;color:black"> <img
							src="${normalList[3].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide03" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 450px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${normalList[3].bookName }</h4>
								<p style="white-space:normal !important;color:black">${normalList[3].bookDetail }</p>
							</div> <img src="./img/책사진2.png"> <label for="slide05"
							class="right"></label>
					</a></li>
					<li><a href="getBook.do?bookInfo=${normalList[4].isbn }" style="position: relative;text-decoration:none;color:black"> <img
							src="${normalList[4].cover }"
							style="width: 300px; height: 400px; position: absolute; top: 50%; transform: translateY(-50%); left: 100px;box-shadow: 5px 5px 5px #000;">
							<label for="slide04" class="left"></label>
							<div class="textbox" style="margin-left: 30px; width: 450px;padding:40px">
								<h4 style="text-overflow: ellipsis; overflow: hidden;margin-bottom:40px">${normalList[4].bookName }</h4>
								<p style="white-space:normal !important;color:black">
									${normalList[4].bookDetail }</p>
							</div> <img src="./img/책사진2.png"> <label for="slide01"
							class="right"></label>
					</a></li>
				</ul>
			</div>
		</div>
	</c:otherwise>
</c:choose>

<div class="sl01" style="border: 1px solid rgba(128, 128, 128, 0.575);border-radius:20px; margin: 30px 0; position: relative">
<p style="margin:50px"><a href="bestSeller.do?category=베스트셀러" style="text-decoration:none;color:black ">베스트셀러 더보기▶</a></p>
	<div class="slide_wrapper">
		<ul class="slides">
			<c:forEach var="best" items="${bestSeller }">
			<li><div style="width: 200px; height: 400px;padding:20px 0;overflow:hidden">
					<a href="getBook.do?bookInfo=${best.isbn }"><img src="${best.cover }" style="width: 200px; height: 300px;margin-bottom:10px;box-shadow: 5px 5px 5px #000;border:1px black solid"></a><span style="text-align:center;">${best.bookName }</span>
				</div></li>
			</c:forEach>
		</ul>
	
	</div>
		<input class="prevbtn button btnPush btnLightBlue" type="button" value="prev">
		<input class="nextbtn button btnPush btnLightBlue" type="button" value="next">
</div>
<div class="sl02" style="border: 1px solid rgba(128, 128, 128, 0.575);border-radius:20px; margin: 30px 0; position: relative">
<p style="margin:50px"><a href="hitCount.do?category=화제의책" style="text-decoration:none;color:black ">화제의 책 더보기▶</a></p>
	<div class="slide_wrapper">
		<ul class="slides">
			<c:forEach var="newlist" items="${newList }">
			<li><div style="width: 200px; height: 400px;padding:20px 0;overflow:hidden">
					<a href="getBook.do?bookInfo=${newlist.isbn }"><img src="${newlist.cover }" style="width: 200px; height: 300px;margin-bottom:10px;box-shadow: 5px 5px 5px #000;border:1px black solid"></a><span style="text-align:center;">${newlist.bookName }</span>
				</div></li>
			</c:forEach>
		</ul>
	
	</div>
		<input class="prevbtn button btnPush btnLightBlue" type="button" value="prev">
		<input class="nextbtn button btnPush btnLightBlue" type="button" value="next">
</div>
<div class="sl03" style="border: 1px solid rgba(128, 128, 128, 0.575);border-radius:20px; margin: 30px 0; position: relative">
<p style="margin:50px"><a href="newBookSearch.do?category=신간" style="text-decoration:none;color:black ">신간 더보기▶</a></p>
	<div class="slide_wrapper">
		<ul class="slides">
			<c:forEach var="newbooklist" items="${newBookList }">
			<li><div style="width: 200px; height: 400px;padding:20px 0;overflow:hidden">
					<a href="getBook.do?bookInfo=${newbooklist.isbn }"><img src="${newbooklist.cover }" style="width: 200px; height: 300px;margin-bottom:10px;box-shadow: 5px 5px 5px #000;border:1px black solid"></a><span style="text-align:center;">${newbooklist.bookName }</span>
				</div></li>
			</c:forEach>
		</ul>
	
	</div>
		<input class="prevbtn button btnPush btnLightBlue" type="button" value="prev">
		<input class="nextbtn button btnPush btnLightBlue" type="button" value="next">
</div>
<c:choose>
<c:when test="${sesInfo eq null }">
<div id="MOVE_TOP_BTN">
	
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p
				style="font-size: 16px; position: absolute; top: 15px; left: 15px;color:black;margin-left:7px;margin-top:5px"><a href="#" style="text-decoration: none;color:black;">top</a></p>
		</div>
	 
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;color:black;margin-left:8px;margin-top:7px"><a href="login.do" style="text-decoration: none;color:black;">로그인</a></p>
		</div>
	
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;margin-left:3px;margin-top:5px"><a href="joinForm.do" style="text-decoration: none;color:black;">회원가입</a></p>
		</div>
	
</div>
</c:when>
<c:otherwise>
<div id="MOVE_TOP_BTN">
	
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p
				style="font-size: 16px; position: absolute; top: 15px; left: 15px;color:black;margin-left:7px;margin-top:5px"><a href="#" style="text-decoration: none;color:black;">top</a></p>
		</div>
	 
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;color:black;margin-left:2px;margin-top:7px"><a href="login.do" style="text-decoration: none;color:black;">로그아웃</a></p>
		</div>
	 
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;color:black;margin-left:2px;margin-top:7px"><a href="basket.do" style="text-decoration: none;color:black;">장바구니</a></p>
		</div>
	
	
		<div
			style="width: 70px; height: 70px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative; margin: 5px;box-shadow:5px 5px 5px black">
			<p style="font-size: 14px; position: absolute; top: 15px; left: 5px;color:black;margin-left:4px;margin-top:5px"><a href="myPageMain.do" style="text-decoration: none;color:black;">My Page</a></p>
		</div>
	
</div>
</c:otherwise>
</c:choose>
<!-- Footer-->
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script>
  let radios = document.querySelectorAll('input[type=radio]');
	
	let interval = setInterval(function (){
		for(let i = 0 ; i< radios.length;i++){
		    if(radios[i].checked){
		        radios[i].checked = false;
		        if(i == radios.length -1){
		        	radios[0].checked = true;
		        	break;
		        }
		        radios[i+1].checked = true;
		        break;
		    }
		}
	} , 3000);

	function stop(){
		clearInterval(interval);
	}
	function start(){
		interval = setInterval(function (){
			for(let i = 0 ; i< radios.length;i++){
			    if(radios[i].checked){
			        radios[i].checked = false;
			        if(i == radios.length -1){
			        	radios[0].checked = true;
			        	break;
			        }
			        radios[i+1].checked = true;
			        break;
			    }
			}
		} , 3000);
	}
	var slides01 = document.querySelector('.sl01 .slides'),
		slide01 = document.querySelectorAll('.sl01 .slides li'),
		slides02 = document.querySelector('.sl02 .slides'),
		slide02 = document.querySelectorAll('.sl02 .slides li'),
		slides03 = document.querySelector('.sl03 .slides'),
		slide03 = document.querySelectorAll('.sl03 .slides li'),
		currentIdx = 0,
		slideCount = slide01.length,
		slideWidth = 200,
		slideMargin =100,
		prevBtn = document.querySelector('.prevbtn'),
		nextBtn = document.querySelector('.nextbtn'),
		prevBtn2 = document.querySelector('.sl02 .prevbtn'),
		nextBtn2 = document.querySelector('.sl02 .nextbtn'),
		prevBtn3 = document.querySelector('.sl03 .prevbtn'),
		nextBtn3 = document.querySelector('.sl03 .nextbtn');
		
		slides01.style.width= ( slideWidth + slideMargin)*slideCount +slideMargin + 'px';
		slides02.style.width= ( slideWidth + slideMargin)*slideCount +slideMargin + 'px';
		slides03.style.width= ( slideWidth + slideMargin)*slideCount +slideMargin + 'px';
		
		function moveSlide(num){
			slides01.style.left = -num * 300 + 'px';
			currentIdx = num;
		}
		function moveSlide2(num){
			slides02.style.left = -num * 300 + 'px';
			currentIdx = num;
		}
		function moveSlide3(num){
			slides03.style.left = -num * 300 + 'px';
			currentIdx = num;
		}
		
		nextBtn.addEventListener('click', function(){
			if(currentIdx < slideCount-3){
			moveSlide(currentIdx + 1);
			}else{
			moveSlide(0);
			}
		})
		prevBtn.addEventListener('click', function(){
			if(currentIdx > 0){
				moveSlide(currentIdx -1);
			}else{
				moveSlide(slideCount-3);
			}
		})
		nextBtn2.addEventListener('click', function(){
			if(currentIdx < slideCount-3){
			moveSlide2(currentIdx + 1);
			}else{
			moveSlide2(0);
			}
		})
		prevBtn2.addEventListener('click', function(){
			if(currentIdx > 0){
				moveSlide2(currentIdx -1);
			}else{
				moveSlide2(slideCount-3);
			}
		})
		nextBtn3.addEventListener('click', function(){
			if(currentIdx < slideCount-3){
			moveSlide3(currentIdx + 1);
			}else{
			moveSlide3(0);
			}
		})
		prevBtn3.addEventListener('click', function(){
			if(currentIdx > 0){
				moveSlide3(currentIdx -1);
			}else{
				moveSlide3(slideCount-3);
			}
		})
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		/* $("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		}); */
	});
</script>