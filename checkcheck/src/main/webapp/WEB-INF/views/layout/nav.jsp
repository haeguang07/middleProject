<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<div id="box">
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="background-color: rgb(108, 213, 234) !important;">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">CheckCheck</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"></li>
					<li class="nav-item"></li>
					<li class="nav-item dropdown"></li>
				</ul>
				<form class="d-flex">
					<div class="btn btn-outline-dark">
						<i class="bi-cart-fill me-1"></i> Cart <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</div>
<<<<<<< HEAD
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href='myPageMain.do?'">마이페이지</button>
					<c:if test="${empty sesInfo }">
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href='login.do'">로그인</button>
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href='joinForm.do'">회원가입</button>
					</c:if>
					<c:if test="${not empty sesInfo }">
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href='logout.do'">로그아웃</button>
					<p style="margin-top:16px">${sesInfo.nickname }님 환영합니다.</p>
					</c:if>
=======

					<button class="btn btn-outline-dark" type="button" onclick="location.href='myPageMain.do?id=${sesInfo.userId}'">마이페이지</button>
					<button class="btn btn-outline-dark" type="button" onclick="location.href='login.do'">로그인</button>
					<button class="btn btn-outline-dark" type="button" onclick="location.href='joinForm.do'">회원가입</button>


>>>>>>> branch 'main' of https://github.com/haeguang07/middleProject.git
				</form>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5" style="position: relative;z-index: 2;">
		<img src="image/logo.png"
			style="position: absolute; width: 150px; height: 150px; margin-left: 40px">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white" style="position:relative">
				<form action="search.do" method="post">
					<select style="width: 100px; height: 50px; font-size: 16px;"
						name="select" >
						<option>통합검색</option>
						<option>국내도서</option>
						<option>외국도서</option>
					</select>
					<input
						style="width: 500px; height: 50px; font-size: 16px;" type="text"
						name="search" placeholder="검색"><input
						style="width: 100px; height: 50px; font-size: 16px;" type="submit"
						value="검색">
				</form>
					<ul id="nav123" style="position:absolute;left:50%;top:80px;transform:translate(-40%,-50%);width:700px;clear:both">
						<li id="category">
							<div class="dropdown2">
						      <span class="dropbtn2"><a>카테고리</a></span>
						      <div class="dropdown-content2" style="background-color: white;width:400px;border:1px solid black;padding:10px">
						      	<div style="float:left">
						      		<p><b>국내도서</b></p>
						        	<a href="search.do?category=국내도서>경제경영">경제경영</a>
									<a href="search.do?category=국내도서>과학">과학</a>
									<a href="search.do?category=국내도서>건강/취미">건강/취미</a>
									<a href="search.do?category=국내도서>공무원">공무원 수험서</a>
									<a href="search.do?category=국내도서>달력/기타">달력/기타</a>
									<a href="search.do?category=국내도서>대학교재">대학교재</a>
									<a href="search.do?category=국내도서>만화">만화</a>
									<a href="search.do?category=국내도서>사회과학">사회과학</a>
									<a href="search.do?category=국내도서>소설/시/희곡">소설/시/희곡</a>
									<a href="search.do?category=국내도서>수험서/자격증">수험서/자격증</a>
									<a href="search.do?category=국내도서>건강정보">건강정보</a>
									<a href="search.do?category=국내도서>여행">여행</a>
									<a href="search.do?category=국내도서>역사">역사</a>
									<a href="search.do?category=국내도서>예술">예술/대중문화</a>
								</div>
								<div style="float:right">
								<p><b>외국도서</b></p>
								<a href="search.do?category=외국도서>ELT/어학/사전">ELT/어학/사전</a>
								<a href="search.do?category=외국도서>가정/원예/인테리어">가정/원예/인테리어</a>
								<a href="search.do?category=외국도서>건강/스포츠">건강/스포츠</a>
								<a href="search.do?category=외국도서>경제경영">경제경영</a>
								<a href="search.do?category=외국도서>공예/취미/수집">공예/취미/수집</a>
								<a href="search.do?category=외국도서>만화">만화</a>
								<a href="search.do?category=외국도서>소설/시/희곡">소설/시/희곡</a>
								<a href="search.do?category=외국도서>여행">여행</a>
								<a href="search.do?category=외국도서>역사">역사</a>
								<a href="search.do?category=외국도서>요리">요리</a>
								<a href="search.do?category=외국도서>종교/명상/점술">종교/명상/점술</a>
								<a href="search.do?category=외국도서>해외잡지">해외잡지</a>
								</div>
						      </div>
						    </div> 
					    </li>
						<li><a href="#!">베스트셀러</a></li>
						<li><a href="#!">공지사항</a></li>
						<li><a href="#!">문의사항</a></li>
					</ul>
					
			</div>
		</div>
	</header>