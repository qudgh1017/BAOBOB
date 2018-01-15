<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		#pay{font-size:75px;margin:0 auto;display:block;width:fit-content;margin-top:15%;}
	</style>
</head>
<body>
	<%@ include file="../common/head.jsp" %>

	<%@ include file="guestParkingHeader.jsp" %>
	
	<section>
	  <div class="container">
	  
	  	<c:if test="${mem != 0}">
	  		<span id="pay">자동 결제 중</span>
	  		<script type="text/javascript">
	  			var count = 0;
	  			var jj = '.';
	  			setInterval(function(){
	  				document.getElementById('pay').innerHTML = '자동 결제 중' + jj;
	  				
	  				count += 1;
	  				jj += '.';
	  				if(count == 3){ count=0; jj = '.';}
	  			}, 1000);
	  		
	  			setTimeout(function() {
	  				window.location = 'guestParkingPayPro?key=${key}';
	  			}, 10000);
	  		</script>
	  	</c:if>
	  	<c:if test="${mem == 0}">
		  	<form action="guestParkingPayPro" id="inform">
		  		<input type="hidden" name="key" value="${key}">
		  		<button class="btn btn-block input">결제</button>
		  	</form>
	  	</c:if>
	  </div>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../common/footerCopyright.jsp" %>
</body>
</html>