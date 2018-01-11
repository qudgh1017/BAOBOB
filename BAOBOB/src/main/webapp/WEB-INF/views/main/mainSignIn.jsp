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
					<!-- <div class="form-group">
						<div class="form-check">
							<label class="form-check-label"> 
								<input class="form-check-input" type="checkbox"> 비밀번호 저장
							</label>
						</div>
					</div> -->
					<button class="btn btn-primary btn-block">로그인</button>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="mainJoin">회원가입</a> 
					<a class="d-block small" href="#">비밀번호를 잊으셨나요?</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="${projectRes}adminBootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="${projectRes}adminBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="${projectRes}adminBootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="${projectRes}ymk/js/mainJS.js"></script>
</body>

</html>
