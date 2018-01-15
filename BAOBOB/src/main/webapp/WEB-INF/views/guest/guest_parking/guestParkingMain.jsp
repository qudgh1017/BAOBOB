<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		.portfolio{margin-top:60px;}
	</style>
</head>
<body>
	<%@ include file="../common/head.jsp" %>

	<%@ include file="guestParkingHeader.jsp" %>
	
	<section>
	  <div class="container">
	    <div class="row">
			<div class="col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="guestParkingIn">
					<img class="img-fluid" src="${projectRes}images/ymk/guest_parking/inIcon.png">
				</a>
			</div>
			<div class="col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="guestParkingReceipt">
					<img class="img-fluid" src="${projectRes}images/ymk/guest_parking/rectIcon.png">
				</a>
			</div>
			<div class="col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="guestParkingOut">
					<img class="img-fluid" src="${projectRes}images/ymk/guest_parking/outIcon.png">
				</a>
			</div>
	    </div>
	  </div>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../common/footerCopyright.jsp" %>
</body>
</html>