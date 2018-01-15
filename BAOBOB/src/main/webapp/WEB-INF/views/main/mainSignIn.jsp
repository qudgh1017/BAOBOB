<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>login</title>
	<!-- Bootstrap core CSS-->
	<link href="${projectRes}adminBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom fonts for this template-->
	<link href="${projectRes}adminBootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- Custom styles for this template-->
	<link href="${projectRes}adminBootstrap/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">로그인</div>
			<div class="card-body">
				<form action="mainSignInPro" name="mainSignInForm" method="post" onsubmit="return signInChk();">
					<div class="form-group">
						<label for="exampleInputEmail1">아이디</label> 
						<input class="form-control" name="id" type="text" placeholder="Id">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호</label> 
						<input class="form-control" name="pwd" type="password" placeholder="Password">
					</div>
					<button class="btn btn-primary btn-block">로그인</button>
					<button class="btn btn-primary btn-block" type="button" onclick="firebaseLogin();">페이스북 로그인</button>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="mainJoin">회원가입</a> 
					<a class="d-block small" href="mainPwd">비밀번호를 잊으셨나요?</a>
				</div>
			</div>
		</div>
	</div>
	
	<script src="${projectRes}ymk/js/mainJS.js"></script>
	<script src="${projectRes}ymk/js/firebase.js"></script>
	<!-- firebase 
		 인증, Cloud Storage, 실시간 데이터베이스를 사용하도록 Firebase 자바스크립트 SDK를 구성하는 초기화 정보를 포함하고 있습니다
		 firebase-app - 핵심 firebase 클라이언트(필수)
		 firebase-auth - Firebase 인증(선택사항)
		 firebase-database - Firebase 실시간 데이터베이스(선택사항)
	-->
	<script src="https://www.gstatic.com/firebasejs/4.8.2/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase-app.js"></script><!-- 해당 설정은 Initialize Firebase보다 위에 위치해야 한다.-->
	<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase-auth.js"></script>
	<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase-database.js"></script>
	<script type="text/javascript">
		// Initialize Firebase
		var config = {
		  apiKey: "AIzaSyAX7Dd8nYQoA7EjFKsh8vn5Rb1ocAT2OAk",
		  authDomain: "baobob-kosmo-project.firebaseapp.com",
		  databaseURL: "https://baobob-kosmo-project.firebaseio.com",
		  projectId: "baobob-kosmo-project",
		  storageBucket: "",
		  messagingSenderId: "249594142081"
		};
		firebase.initializeApp(config);
	</script>
</body>
</html>
