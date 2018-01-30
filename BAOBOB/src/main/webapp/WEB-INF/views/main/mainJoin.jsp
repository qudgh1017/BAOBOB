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
	<title>Join</title>
	<link rel="stylesheet" href="${projectRes}ymk/css/loader.css">
	<!-- Bootstrap core CSS-->
	<link
		href="${projectRes}mainBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom fonts for this template-->
	<link
		href="${projectRes}mainBootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- Custom styles for this template-->
	<link href="${projectRes}mainBootstrap/css/sb-admin.css" rel="stylesheet">
	
	<style type="text/css">
		body .joinBtn{
			background:#007bff;
		}
		body .sexBtn{
			width: 49%;
			padding: .375rem .75rem;
			font-size: 1rem;
			line-height: 1.5;
			color: #495057;
			background-color: #fff;
			background-image: none;
			background-clip: padding-box;
			border: 1px solid #ced4da;
			border-radius: .25rem;
			transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
		}
		body .adBtn{
			    font-size: 10px;
			    border: 1px solid #ced4da;
			    padding: 5px;
			    border-radius: 0.5em;
			    margin-left: 10px;
		}
		body .navbar-brand {margin:1rem;font-family:Montserrat;font-size:1.25rem;line-height:inherit;white-space:nowrap;color:white;}
	</style>
</head>

<body class="bg-dark">
	<a class="navbar-brand js-scroll-trigger" href="mainIndex">Baobob</a>
	
	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">필수 정보</div>
			<div class="card-body">
			
				<form action="mainJoinPro" name="joinForm" onsubmit="return joinCheck();" method="post">

					<div class="form-group">
						<label for="name">이름</label> 
						<input class="form-control" id="name" name="name" type="text" placeholder="name">
					</div>

					<div class="form-group">
						<label for="id">아이디</label> 
						<input class="form-control" id="id" name="id" type="text" placeholder="id" onblur="confirmId();">
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="pwd">비밀번호</label> 
								<input class="form-control" id="pwd" name="pwd" type="password" placeholder="Password">
							</div>
							<div class="col-md-6">
								<label for="pwdRe">비밀번호 확인</label> 
								<input class="form-control" id="pwdRe" name="pwdRe" type="password" placeholder="Confirm password">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email">이메일</label> 
						<input class="form-control" id="email" name="email" type="email" placeholder="email">
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="birth">생일</label> 
								<input class="form-control" id="birth" name="birth" type="text" placeholder="20180110">
							</div>
							<div class="col-md-6">
								<input type="hidden" name="sex">
								<label>성별</label><br>
								<input type="button" class="sexBtn" onclick="sexBtnChange('M');" value="남">
								<input type="button" class="sexBtn" onclick="sexBtnChange('Y');" value="여">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="tel">전화번호</label> 
						<input class="form-control" id="tel" name="tel" type="text" placeholder="tel" onblur="confirmTel();">
					</div>

					<div class="form-group">
						<label for="address">주소 <input class="adBtn" type="button" value="주소 찾기" onclick="addressSearch();"></label> 
						<input class="form-control" id="address" name="address" type="text" placeholder="address">
					</div>

					<input class="btn btn-primary btn-block joinBtn" type="submit" value="회원가입">
				</form>
				
				<div class="text-center">
					<a class="d-block small mt-3" onclick="goMainSignIn();">Login Page</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-md-3 bg" id="myLoader">
	  <div class="loader" id="loader-4">
	    <span></span>
	    <span></span>
	    <span></span>
	  </div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="${projectRes}mainBootstrap/vendor/jquery/jquery.min.js"></script>
	<script
		src="${projectRes}mainBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="${projectRes}mainBootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
		
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script src="${projectRes}ymk/js/mainJS.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>

</html>
