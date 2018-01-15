<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/head.jsp" %>

	<%@ include file="guestParkingHeader.jsp" %>
	
	<section>
	  <div class="container">
	  
	  	<form action="guestParkingMemberIn" id="inform">
	  		<input class="form-control input" type="text" name="id" placeholder="아이디">
	  		<input class="form-control input" type="password" name="pwd" placeholder="비밀번호">
	  		<button class="btn btn-block">로그인</button>
	  		<button class="btn btn-block" type="button" onclick="firebaseLogin();">페이스북 로그인</button>
	  	</form>
	  	
	  </div>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../common/footerCopyright.jsp" %>
	
	<script src="${projectRes}ymk/js/mainJS.js"></script>
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
	  
	  function firebaseLogin() {
		var provider = new firebase.auth.FacebookAuthProvider();
		firebase.auth().signInWithPopup(provider).then(function(result) {
			  var token = result.credential.accessToken;
			  var user = result.user;
		
			  userName = user.displayName;//displayName
			  userId = user.uid;
			  userEmail = user.email;
			  
			  window.location='guestParkingFirebaseLogin?userId=' + userId + '&userName=' + userName + '&userEmail=' + userEmail; 
		}).catch(function(error) {
			  var errorCode = error.code;
			  var errorMessage = error.message;
			  var email = error.email;
			  var credential = error.credential;
		});
	}
	</script>
</body>
</html>