<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>


<<<<<<< HEAD
<div style="border:1px solid gray;">
	<div style="text-align: center;padding:20px;">
		<img src="image/logo.png" style="width:300px;height:400px;display:inline-block">
		<div style="padding:20px;vertical-align: bottom;display: inline-block;">
			<p>책이름</p>
			<p>줄거리</p>
=======
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<div id="slideShow">
				<ul class="slides">
				<c:choose>
				<c:when test="${sesinfo } != null">
				<c:forEach var="likeBook" items="">
					<li>
						<div class="col mb-5">
							<div class="card h-100">
								<img class="card-img-top"
									src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
									alt="..." />
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<p>책이름</p>
									<p>책 설명</p>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
				
				</c:when>
				<c:otherwise>
				
				</c:otherwise>
				</c:choose>
				</ul>
				<p class="controller">

					<!-- &lang: 왼쪽 방향 화살표
      &rang: 오른쪽 방향 화살표 -->
					<span class="prev">&lang;</span> <span class="next">&rang;</span>
				</p>
			</div>


>>>>>>> branch 'main' of https://github.com/haeguang07/middleProject.git
		</div>

	</div>
</div>
<div id="MOVE_TOP_BTN">
	<a href="#">
		<div
			style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
			<p style="font-size: 12px; position: absolute; top: 15px; left: 15px;">top</p>
		</div>
	</a> <a href="#">
		<div
			style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
			<p style="font-size: 12px; position: absolute; top: 15px; left: 5px;">로그인</p>
		</div>
	</a> <a href="#">
		<div
			style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative">
			<p style="font-size: 10px; position: absolute; top: 15px; left: 5px;">회원가입</p>
		</div>
	</a>
</div>
<!-- Footer-->
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script>
	$(function () {
		$(window).scroll(function () {
			if ($(this).scrollTop() > 100) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function () {
			$('html, body').animate({
				scrollTop: 0
			}, 400);
			return false;
		});
	});
</script>