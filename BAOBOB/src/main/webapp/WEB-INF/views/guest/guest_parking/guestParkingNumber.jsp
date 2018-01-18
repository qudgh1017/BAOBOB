<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		body .mar{margin:11rem auto;padding:0;}
		.park_number{text-align:center;margin-top:3%;}
		.number{font-size:75px;}
		body .btn_ok{width:300px;margin:0 auto;}
	</style>
</head>
<body>
	<%@ include file="../common/head.jsp" %>

	<%@ include file="guestParkingHeader.jsp" %>
	
	<section>
	  <div class="container mar">
	  	<div class="park_number">
	  	
	  		퇴장 시 다음 코드를 입력하세요.
	  		<c:if test="${step == 8}">
	  		<br>
	  		홈페이지에서 내역을 확인하실 경우 해당 코드를 <b>로그인, 비밀번호</b>로 사용하세요.
	  		</c:if>
	  		<br><br>
	  		
	  		<span class="number">
			<c:if test="${cnt != 0}">
				${key}
			</c:if>
	  		</span>
			<c:if test="${cnt == 0}">
				<script type="text/javascript">
					errorAlert('다시 시도 해주세요.');
				</script>
			</c:if>
			
			<br><br>
			<br><br>
			
			<button class="btn btn-block btn_ok" onclick="window.location='guestParkingMain';">확인</button><br>
			<span id="out">60초 후 처음 화면으로 돌아갑니다.</span>
	  	</div>
	  </div>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../common/footerCopyright.jsp" %>
	
	<script src="${projectRes}ymk/js/mainJS.js"></script>
	<script type="text/javascript">
		var back_btn = document.getElementById('back_btn')
		back_btn.innerHTML = '확인';
		back_btn.setAttribute('onclick', 'window.location="guestParkingMain"');
	
		var out = 59;
		setInterval(function() {
			document.getElementById('out').innerHTML = out + '초 후 처음 화면으로 돌아갑니다.';
			out -= 1;
		}, 1000);
		
		
		
		setTimeout(function() {
			window.location = 'guestParkingMain';
		}, 60000);
	</script>
</body>
</html>