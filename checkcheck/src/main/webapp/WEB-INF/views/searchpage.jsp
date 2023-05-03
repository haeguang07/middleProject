<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <section style="display:flex">
            <div style="flex:1;border: 1px black solid;margin:5px;height: 500px;">
                <p id="hoverkorea" style="display: inline-block;margin: 0 20px">국내도서</p> <p id="hoverforeign" style="display: inline-block;">외국도서</p>
            <ul id="korea" style="list-style: none;">
            	<li><a href="search.do?category=국내도서>경제경영">경제경영</a></li>
            	<li><a href="search.do?category=국내도서>과학">과학</a></li>
                <li><a href="search.do?category=국내도서>건강/취미">건강/취미</a></li>
                <li><a href="search.do?category=국내도서>공무원">공무원 수험서</a></li>
                <li><a href="search.do?category=국내도서>달력/기타">달력/기타</a></li>
                <li><a href="search.do?category=국내도서>대학교재">대학교재</a></li>
                <li><a href="search.do?category=국내도서>만화">만화</a></li>
                <li><a href="search.do?category=국내도서>사회과학">사회과학</a></li>
                <li><a href="search.do?category=국내도서>소설/시/희곡">소설/시/희곡</a></li>
                <li><a href="search.do?category=국내도서>수험서/자격증">수험서/자격증</a></li>
                <li><a href="search.do?category=국내도서>건강정보">건강정보</a></li>
                <li><a href="search.do?category=국내도서>여행">여행</a></li>
                <li><a href="search.do?category=국내도서>역사">역사</a></li>
                <li><a href="search.do?category=국내도서>예술">예술/대중문화</a></li>
            </ul>
            <ul id="foreign" style="display:none;list-style: none;">
            	<li><a href="search.do?category=외국도서>ELT/어학/사전">ELT/어학/사전</a></li>
            	<li><a href="search.do?category=외국도서>가정/원예/인테리어">가정/원예/인테리어</a></li>
            	<li><a href="search.do?category=외국도서>건강/스포츠">건강/스포츠</a></li>
                <li><a href="search.do?category=외국도서>경제경영">경제경영</a></li>
                <li><a href="search.do?category=외국도서>공예/취미/수집">공예/취미/수집</a></li>
                <li><a href="search.do?category=외국도서>만화">만화</a></li>
                <li><a href="search.do?category=외국도서>소설/시/희곡">소설/시/희곡</a></li>
                <li><a href="search.do?category=외국도서>여행">여행</a></li>
                <li><a href="search.do?category=외국도서>역사">역사</a></li>
                <li><a href="search.do?category=외국도서>요리">요리</a></li>
                <li><a href="search.do?category=외국도서>종교/명상/점술">종교/명상/점술</a></li>
                <li><a href="search.do?category=외국도서>해외잡지">해외잡지</a></li>
            </ul>
            </div>
            <div style="flex:5;border: 1px black solid;margin:5px;padding:10px">
                <select style="float:right"><option>10개씩보기</option><option>20개씩보기</option></select>
                <p><a href="#!">국내도서</a></p>
                <!-- 책 리스트 받아서 반복문 만들기-->
                <c:forEach var="i" items="${list }">
               	 <div style="padding:10px;border-top: 1px black solid;clear: both;">
                    <form action="" method="post" style="position:relative">
                    <table>
                        <tr>
                            <td rowspan="5"><img src=${i.cover }></td><td>이름</td><td>${i.bookName }</td>
                        </tr>
                        <tr>
                            <td>저자</td><td>${i.author }</td>
                        </tr>
                        <tr>
                            <td>출판사</td><td>${i.publisher }</td>
                        </tr>
                        <tr>
                            <td>가격</td><td>${i.bookPrice }</td>
                        </tr>
                        <tr>
                            <td>평점</td><td>5</td>
                        </tr>
                    </table>
	                    <button style="float:right;position:absolute;right:0;bottom: 10%;">구매</button>
	                    <button style="float:right;position:absolute;right:70px;bottom: 10%;">장바구니</button>
                	</form>
               	 </div>
                </c:forEach>
                <!-- 책-->
            </div>
        </section>
        <div id="MOVE_TOP_BTN">
            <a  href="#"><div style="width:50px;height:50px;border-radius:70%;background-color:white;border: 1px solid rgba(128, 128, 128, 0.282);position:relative"><p style="font-size: 12px;position: absolute;top: 15px;left:15px;">top</p></div></a>
            <a  href="#"><div style="width:50px;height:50px;border-radius:70%;background-color:white;border: 1px solid rgba(128, 128, 128, 0.282);position:relative"><p style="font-size: 12px;position: absolute;top: 15px;left:5px;">로그인</p></div></a>
            <a  href="#"><div style="width:50px;height:50px;border-radius:70%;background-color:white;border: 1px solid rgba(128, 128, 128, 0.282);position:relative"><p style="font-size: 10px;position: absolute;top: 15px;left:5px;">회원가입</p></div></a>
        </div>
    </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.js"
   integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
   crossorigin="anonymous"></script>
        <script>
            $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 100) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });

    document.querySelector('#hoverforeign').addEventListener('click',function(){
        this.style.color='blue';
        document.querySelector('#hoverkorea').style.color='black';
        let korea = document.querySelector('#korea');
        korea.style.display = 'none';
        let foreign = document.querySelector('#foreign');
        foreign.style.display = 'block';
    })
    document.querySelector('#hoverkorea').addEventListener('click',function(){
        this.style.color='blue';
        document.querySelector('#hoverforeign').style.color='black';
        let korea = document.querySelector('#korea');
        korea.style.display = 'block';
        let foreign = document.querySelector('#foreign');
        foreign.style.display = 'none';
    })
    </script>
