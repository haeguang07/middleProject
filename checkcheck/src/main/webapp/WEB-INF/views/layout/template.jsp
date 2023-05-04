<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style>
.section input[id*="slide"] {
			display: none;
		}

		.section .slide-wrap {
			max-width: 1200px;
			margin: 0 auto;
		}

		.section .slidelist {
			white-space: nowrap;
			font-size: 0;
			overflow: hidden;
		}

		.section .slidelist>li {
			display: inline-block;
			vertical-align: middle;
			width: 100%;
			transition: all .5s;
		}

		.section .slidelist>li>a {
			display: block;
			position: relative;
		}

		.section .slidelist>li>a img {
			width: 100%;
		}

		.section .slidelist label {
			position: absolute;
			z-index: 10;
			top: 50%;
			transform: translateY(-50%);
			padding: 50px;
			cursor: pointer;
		}

		.section .slidelist .left {
			left: 30px;
			background: url('./img/left.png') center center / 100% no-repeat;
		}

		.section .slidelist .right {
			right: 30px;
			background: url('./img/right.png') center center / 100% no-repeat;
		}

		.section .slidelist .textbox {
			position: absolute;
			z-index: 1;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			line-height: 1.6;
			text-align: center;
		}

		.section .slidelist .textbox h3 {
			font-size: 50px;
			color: #fff;
			opacity: 0;
			transform: translateY(30px);
			transition: all .5s;
		}

		.section .slidelist .textbox p {
			font-size: 24px;
			color: #fff;
			opacity: 0;
			transform: translateY(30px);
			transition: all .5s;
		}

		.section input[id="slide01"]:checked~.slide-wrap .slidelist>li {
			transform: translateX(0%);
		}

		.section input[id="slide02"]:checked~.slide-wrap .slidelist>li {
			transform: translateX(-100%);
		}

		.section input[id="slide03"]:checked~.slide-wrap .slidelist>li {
			transform: translateX(-200%);
		}

		.section input[id="slide04"]:checked~.slide-wrap .slidelist>li {
			transform: translateX(-300%);
		}

		.section input[id="slide05"]:checked~.slide-wrap .slidelist>li {
			transform: translateX(-400%);
		}

		.section input[id="slide01"]:checked~.slide-wrap li:nth-child(1) .textbox h3 {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .2s;
		}

		.section input[id="slide01"]:checked~.slide-wrap li:nth-child(1) .textbox p {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .4s;
		}

		.section input[id="slide02"]:checked~.slide-wrap li:nth-child(2) .textbox h3 {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .2s;
		}

		.section input[id="slide02"]:checked~.slide-wrap li:nth-child(2) .textbox p {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .4s;
		}

		.section input[id="slide03"]:checked~.slide-wrap li:nth-child(3) .textbox h3 {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .2s;
		}

		.section input[id="slide03"]:checked~.slide-wrap li:nth-child(3) .textbox p {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .4s;
		}

		.section input[id="slide04"]:checked~.slide-wrap li:nth-child(4) .textbox h3 {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .2s;
		}

		.section input[id="slide04"]:checked~.slide-wrap li:nth-child(4) .textbox p {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .4s;
		}

		.section input[id="slide05"]:checked~.slide-wrap li:nth-child(5) .textbox h3 {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .2s;
		}

		.section input[id="slide05"]:checked~.slide-wrap li:nth-child(5) .textbox p {
			opacity: 1;
			transform: translateY(0);
			transition-delay: .4s;
		}
		
		.slide_wrapper *{
			margin:0;
			padding:0;
		}
		.slide_wrapper{
			
			position:relative;
			width:900px;
			margin:0 0 0 100px;
			height: 500px;
			overflow:hidden;
		}
		.slides{
			position:absolute;
			left:0;
			top:0;
			width:2300px;
			transition:left 0.5s ease-out;
		}
		.slides li{
			margin:0;
			margin-right:100px !important;
			float:left;
			
		}
		.slides li{
			list-style:none;
		}
		
		.prevbtn{
			position:absolute;
			top:50%;
			transform:translateY(-50%);
			margin:10px;
		}
		.nextbtn{
			position:absolute;
			right:0;
			top:50%;
			transform:translateY(-50%);
			margin:10px;
		}
</style>
</head>
<body>
	<div id="container" style="width:1200px; margin:0 auto;">
		<!-- Navigation-->
		<div id="page-content-wrapper">
			<tiles:insertAttribute name="nav"></tiles:insertAttribute>
		</div>
		<!-- Section-->
		<div id="page-content-wrapper">
			<tiles:insertAttribute name="body"></tiles:insertAttribute>
		</div>
		<!-- Footer-->
		<div style="clear:both">
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</div>
	</div>
</body>
</html>