<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
	<nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="mainIndex">Baobob</a>
			<button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
				
					<!-- 로그인 전 -->
					<c:if test="${sessionScope.memId == null}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="mainSignIn">
								로그인
							</a>
						</li>
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="mainJoin">
								회원가입
							</a>
						</li>
					</c:if>
					
					<!-- 각 관리자 편의 -->
					<!-- 종합관리자 -->
					<c:if test="${sessionScope.memStep == 1}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="hostTMain">
								관리페이지
							</a>
						</li>
					</c:if>
					<!-- 영화관리자 -->
					<c:if test="${sessionScope.memStep == 2 || sessionScope.memStep == 3}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="hostMovie">
								영화관리
							</a>
						</li>
					</c:if>
					<!-- 식당총관리자 -->
					<c:if test="${sessionScope.memStep == 4}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="hostRestaurantList">
								식당총관리
							</a>
						</li>
					</c:if>
					<!-- 식당관리자 -->
					<c:if test="${(51 <= sessionScope.memStep && sessionScope.memStep <= 53) || (61 <= sessionScope.memStep && sessionScope.memStep <= 63)}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="hostReservList">
								식당관리
							</a>
						</li>
					</c:if>
					<!-- 주차관리자 -->
					<c:if test="${sessionScope.memStep == 1 || sessionScope.memStep == 7}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="guestParkingMain">
								고객주차
							</a>
						</li>
					</c:if>
					<c:if test="${sessionScope.memStep == 7}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="hostParkingMain">
								주차관리
							</a>
						</li>
					</c:if>
					
					<!-- 로그인 후 -->
					<c:if test="${sessionScope.memId != null}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="memMyPageMain">
								마이페이지
							</a>
						</li>
					</c:if>
					
					<!-- 공통 -->
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="mainHelp">
							고객센터
						</a>
					</li>
					
					<!-- 로그아웃 -->
					<c:if test="${sessionScope.memId != null}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="mainSignOut">
								로그아웃
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	
	<script src="${projectRes}mainBootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="${projectRes}mainBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>