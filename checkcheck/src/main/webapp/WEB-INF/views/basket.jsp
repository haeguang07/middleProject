<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Navigation-->
        <div id="box">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: rgb(108, 213, 234) !important;">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">CheckCheck</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"></li>
                        <li class="nav-item"></li>
                        <li class="nav-item dropdown">
                        </li>
                    </ul>
                    <form class="d-flex">
                        <div class="btn btn-outline-dark" >
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </div>
                        <button class="btn btn-outline-dark" type="submit">
                            마이페이지
                        </button>
                        <button class="btn btn-outline-dark" type="submit">
                            로그인
                        </button>
                        <button class="btn btn-outline-dark" type="submit">
                            회원가입
                        </button>
                        
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5" style="position: relative;">
            <img src="image/logo.png" style="position: absolute;width:150px;height:150px;margin-left:40px">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder"><select style="width:100px;height:50px;font-size:16px;" value="통합검색"><option>통합검색</option><option>국내도서</option><option>외국도서</option></select><input style="width:500px;height:50px;font-size:16px;" type="text" name="search" value="검색"><input style="width:100px;height:50px;font-size:16px;" type="button" value="검색">
                    <p class="lead fw-normal text-white-50 mb-0"><ul id="nav123"><a href="#!"><li id="category">카테고리</li></a><a href="#!"><li>베스트</li></a><a href="#!"><li> 신상</li></a><a href="#!"><li> 공지사항</li></a><a href="#!"><li> 문의사항</li></a></ul></p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <p>책이름</p>
                                <p>책 설명</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div id="MOVE_TOP_BTN">
            <a  href="#"><div style="width:50px;height:50px;border-radius:70%;background-color:white;border: 1px solid rgba(128, 128, 128, 0.282);position:relative"><p style="font-size: 12px;position: absolute;top: 15px;left:15px;">top</p></div></a>
            <a  href="#"><div style="width:50px;height:50px;border-radius:70%;background-color:white;border: 1px solid rgba(128, 128, 128, 0.282);position:relative"><p style="font-size: 12px;position: absolute;top: 15px;left:5px;">로그인</p></div></a>
            <a  href="#"><div style="width:50px;height:50px;border-radius:70%;background-color:white;border: 1px solid rgba(128, 128, 128, 0.282);position:relative"><p style="font-size: 10px;position: absolute;top: 15px;left:5px;">회원가입</p></div></a>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
    </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
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
        </script>
    </body>
</html>