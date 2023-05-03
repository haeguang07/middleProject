<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<link href="css/styles.css" rel="stylesheet" />
		<script src="https://code.jquery.com/jquery-3.6.4.js"
			integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

		<c:choose>
			<c:when test="${sesinfo != null }">
				<div class="section" style="margin:20px">
					<input type="radio" name="slide" id="slide01" checked>
					<input type="radio" name="slide" id="slide02">
					<input type="radio" name="slide" id="slide03">
					<input type="radio" name="slide" id="slide04">
					<input type="radio" name="slide" id="slide05">
					<div class="slide-wrap">
						<ul class="slidelist">
							<li>
								<a style="position: relative;">
									<img src="${list[0].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide05" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4>${list[0].bookName }</h4>
										<p>${list[0].bookDetail }</p>
									</div>
									<img src="./img/slide.jpg">
									<label for="slide02" class="right"></label>
								</a>
							</li>
							<li>
								<a style="position: relative;">
									<img src="${list[1].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide01" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4>${list[1].bookName }</h4>
										<p>${list[1].bookDetail }</p>
									</div>
									<img src="./img/slide.jpg">
									<label for="slide03" class="right"></label>
								</a>
							</li>
							<li>
								<a style="position: relative;">
									<img src="${list[2].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide02" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4>${list[2].bookName }</h4>
										<p>${list[2].bookDetail }</p>
									</div>
									<img src="./img/slide.jpg">
									<label for="slide04" class="right"></label>
								</a>
							</li>
							<li>
								<a style="position: relative;">
									<img src="${list[3].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide03" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4>${list[3].bookName }</h4>
										<p>${list[3].bookDetail }</p>
									</div>
									<img src="./img/slide.jpg">
									<label for="slide05" class="right"></label>
								</a>
							</li>
							<li>
								<a style="position: relative;">
									<img src="${list[4].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide04" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4>${list[4].bookName }</h4>
										<p>${list[4].bookDetail }</p>
									</div>
									<img src="./img/slide.jpg">
									<label for="slide01" class="right"></label>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="section" style="margin:20px">
					<input type="radio" name="slide" id="slide01" checked>
					<input type="radio" name="slide" id="slide02">
					<input type="radio" name="slide" id="slide03">
					<input type="radio" name="slide" id="slide04">
					<input type="radio" name="slide" id="slide05">
					<div class="slide-wrap">
						<ul class="slidelist">
							<li>
								<a style="position: relative;">
									<img src="${normalList[0].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide05" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4 style="text-overflow:ellipsis;overflow:hidden">${normalList[0].bookName }</h4>
										<p>${normalList[0].bookDetail }</p>
									</div>
									<img src="./img/책사진2.png">
									<label for="slide02" class="right"></label>
								</a>
							</li>
							<li>
								<a style="position: relative;">
									<img src="${normalList[1].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide01" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4 style="text-overflow:ellipsis;overflow:hidden">${normalList[1].bookName }</h4>
										<p>${normalList[1].bookDetail }</p>
									</div>
									<img src="./img/책사진2.png">
									<label for="slide03" class="right"></label>
								</a>
							</li>
							<li>
								<a style="position: relative;">
									<img src="${normalList[2].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide02" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4 style="text-overflow:ellipsis;overflow:hidden">${normalList[2].bookName }</h4>
										<p>${normalList[2].bookDetail }</p>
									</div>
									<img src="./img/책사진2.png">
									<label for="slide04" class="right"></label>
								</a>
							</li>
							<li>
								<a style="position: relative;">
									<img src="${normalList[3].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide03" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4 style="text-overflow:ellipsis;overflow:hidden">${normalList[3].bookName }</h4>
										<p>${normalList[3].bookDetail }</p>
									</div>
									<img src="./img/책사진2.png">
									<label for="slide05" class="right"></label>
								</a>
							</li>
							<li>
								<a style="position: relative;">
									<img src="${normalList[4].cover }"
										style="width:300px;height:400px;position:absolute;top:50%;transform: translateY(-50%);left:100px">
									<label for="slide04" class="left"></label>
									<div class="textbox" style="margin-left:30px;width:400px;">
										<h4 style="text-overflow:ellipsis;overflow:hidden">${normalList[4].bookName }</h4>
										<p style="width:400px;word-break:keep-all !important;word-wrap:break-word !important;font-size:14px">
											${normalList[4].bookDetail }</p>
									</div>
									<img src="./img/책사진2.png">
									<label for="slide01" class="right"></label>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

		<div style="border: 1px solid gray;margin:30px 0;position:relative">
			<p style="margin:0;position:absolute;top:20px;left:20px">
				<a href="#!" style="text-decoration-line:none;color:black">베스트셀러 더보기▶</a>
			</p>
			<div style="text-align: center;width:100%">
				<div style="padding:0 30px; vertical-align: bottom;display:inline-block;width:20%">
					<img src="image/logo.png" style="width: 200px; height: 300px; display: inline-block">
					<p>책이름</p>
				</div>
				<div style="padding:0 30px; vertical-align: bottom;display:inline-block;width:20%">
					<img src="image/logo.png" style="width: 200px; height: 300px; display: inline-block">
					<p>책이름</p>
				</div>
				<div style="padding:0 30px; vertical-align: bottom;display:inline-block;width:20%">
					<img src="image/logo.png" style="width: 200px; height: 300px; display: inline-block">
					<p>책이름</p>
				</div>
				<div style="padding:0 30px; vertical-align: bottom;display:inline-block;width:20%">
					<img src="image/logo.png" style="width: 200px; height: 300px; display: inline-block">
					<p>책이름</p>
				</div>
			</div>

		</div>
		
		<div style="border: 1px solid gray;margin:30px 0;position:relative">
			<p style="margin:0;position:absolute;top:20px;left:20px">
				<a href="#!" style="text-decoration-line:none;color:black">신간 더보기▶</a>
			</p>
			<div style="text-align: center;width:100%">
				<div style="padding:0 30px; vertical-align: bottom;display:inline-block;width:20%">
					<img src="image/logo.png" style="width: 200px; height: 300px; display: inline-block">
					<p>책이름</p>
				</div>
				<div style="padding:0 30px; vertical-align: bottom;display:inline-block;width:20%">
					<img src="image/logo.png" style="width: 200px; height: 300px; display: inline-block">
					<p>책이름</p>
				</div>
				<div style="padding:0 30px; vertical-align: bottom;display:inline-block;width:20%">
					<img src="image/logo.png" style="width: 200px; height: 300px; display: inline-block">
					<p>책이름</p>
				</div>
				<div style="padding:0 30px; vertical-align: bottom;display:inline-block;width:20%">
					<img src="image/logo.png" style="width: 200px; height: 300px; display: inline-block">
					<p>책이름</p>
				</div>
			</div>

		</div>
		
		<div id="MOVE_TOP_BTN">
			<a href="#">
				<div
					style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative;margin:5px">
					<p style="font-size: 12px; position: absolute; top: 15px; left: 15px;">top</p>
				</div>
			</a> <a href="#">
				<div
					style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative;margin:5px">
					<p style="font-size: 12px; position: absolute; top: 15px; left: 5px;">로그인</p>
				</div>
			</a> <a href="#">
				<div
					style="width: 50px; height: 50px; border-radius: 70%; background-color: white; border: 1px solid rgba(128, 128, 128, 0.282); position: relative;margin:5px">
					<p style="font-size: 10px; position: absolute; top: 15px; left: 5px;">회원가입</p>
				</div>
			</a>
		</div>
		<!-- Footer-->
		<!-- Bootstrap core JS-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="js/scripts.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.4.js"
			integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
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