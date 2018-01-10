<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Join</title>
  <!-- Bootstrap core CSS-->
  <link href="${projectRes}mainBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="${projectRes}mainBootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="${projectRes}mainBootstrap/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Account</div>
      <div class="card-body">
        <form>
      
          <div class="form-group">
            <label for="id">아이디</label>
            <input class="form-control" id="id" type="text" aria-describedby="emailHelp" placeholder="id">
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="pwd">비밀번호</label>
                <input class="form-control" id="pwd" type="password" placeholder="Password">
              </div>
              <div class="col-md-6">
                <label for="pwdRe">비밀번호 확인</label>
                <input class="form-control" id="pwdRe" type="password" placeholder="Confirm password">
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <label for="email">이메일</label>
            <input class="form-control" id="email" type="email" aria-describedby="emailHelp" placeholder="email">
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="birth">생일</label>
                <input class="form-control" id="birth" type="text" aria-describedby="nameHelp" placeholder="20180110">
              </div>
              <div class="col-md-3">
                <input type="radio" name="sex" value="남">남
              </div>
              <div class="col-md-3">
                <input type="radio" name="sex" value="여">여
              </div>
            </div>
          </div>
          
          <a class="btn btn-primary btn-block" href="#">회원가입</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="main/mainSignIn">Login Page</a>
          <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
        </div>
      </div>
    </div>
  </div>
  
  
  <!-- Bootstrap core JavaScript-->
  <script src="${projectRes}mainBootstrap/vendor/jquery/jquery.min.js"></script>
  <script src="${projectRes}mainBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="${projectRes}mainBootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
