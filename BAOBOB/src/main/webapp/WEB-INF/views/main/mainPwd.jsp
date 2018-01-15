<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>BAOBOB</title>
	<!-- Bootstrap core CSS-->
	<link href="${projectRes}mainBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom fonts for this template-->
	<link href="${projectRes}mainBootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- Custom styles for this template-->
	<link href="${projectRes}mainBootstrap/css/sb-admin.css" rel="stylesheet">
</head>
<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">비밀번호 찾기</div>
      <div class="card-body">
        <div class="text-center mt-4 mb-5">
          <h4>비밀번호를 잊어버리셨나요?</h4>
          <p>등록된 이메일을 입력하시면 인증 메일을 통해 비밀번호를 찾을 수 있습니다.</p>
        </div>
        <form>
          <div class="form-group">
            <input class="form-control" id="email" type="email" placeholder="Enter email address">
          </div>
          <a class="btn btn-primary btn-block" onclick="mainPwdEmail();">비밀번호 찾기</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="mainJoin">회원 가입</a>
          <a class="d-block small" href="mainSignIn">로그인</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="${projectRes}mainBootstrap/vendor/jquery/jquery.min.js"></script>
  <script src="${projectRes}mainBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="${projectRes}mainBootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
  
  <script src="${projectRes}ymk/js/mainJS.js"></script>
</body>
</html>

