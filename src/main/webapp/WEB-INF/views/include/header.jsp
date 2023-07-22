<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SHELWI 쉘위</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/carousel.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

<link rel="stylesheet" href="/resources/css/yedy/sb-admin-2.css" type="text/css">
<link rel="stylesheet" href="/resources/css/yedy/sb-admin-2.min.css" type="text/css">

</head>

<body>






	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> team2@naver.com</li>
								<li>welcome !!! to team2 world</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="header__top__right">
							    <c:choose>
							    
      							<c:when test="${member ne null}">
        						<p>${member.name}</p>
        						
        						<div class="header__top__right__social">
								<a href="/member/my_info"><i class="fa fa-user"></i> Mypage</a>
								</div>
        						
        						<div class="header__top__right__social">
								<a href="/member/logout"><i class="fa fa-user"></i> Logout</a>
								</div>
      							</c:when>
      							
      							<c:otherwise>
        						<div class="header__top__right__social">
								<a href="/member/login"><i class="fa fa-user"></i> Login</a>
								</div>
							
							<div class="header__top__right__social">
								<a href="/member/join"><i class="fa fa-user"></i> Join</a>
							</div>
      							</c:otherwise>
    							</c:choose>
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo"></div>
				</div>
				<div class="col-lg-6" style="text-align: center">
					<img src="/resources/img/google.png" alt="">
				</div>
				<div class="col-lg-3">
					<div class="header__cart"></div>
				</div>
			</div>

		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-6j">
					<nav class="header__menu">
						<ul>
							<li><a href="/main/info/AED">재난행동</a></li>
							<li><a href="/api/map">대피소</a></li>
							<li><a href="/board/list">게시판</a>
								<ul class="header__menu__dropdown">
									<li><a href="./notice.jsp">공지게시판</a></li>
									<li><a href="/board/list">소통게시판</a></li>
								</ul></li>
							<li><a href="/main/shop">쇼핑몰</a></li>
							<li><a href="/api/disaster_info">재난현황</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3"></div>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
		</div>
	</header>
	<!-- Header Section End -->


	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container" style="border: 1px solid black">
			<p>실시간 현황 문자가 들어갈 공간입니다. (테두리는 임의로 넣었습니다)</p>
		</div>
	</section>
	<!-- Hero Section End -->