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
					<c:if test="${sessionScope.memId != null}">
						<li class="nav-item mx-0 mx-lg-1">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="memMyPageMain">
								마이페이지
							</a>
						</li>
					</c:if>
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="mainHelp">
							고객센터
						</a>
					</li>
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