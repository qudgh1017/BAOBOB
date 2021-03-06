<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		.mar{margin:-6rem auto;padding:0;}
		.portfolio{margin-top:60px;}
	</style>
</head>
<body>
	<%@ include file="../common/head.jsp" %>

	<%@ include file="guestParkingHeader.jsp" %>
	
	<img class="back_img" src="${projectRes}images/ymk/guest_parking/map.png">
	
	<section class="portfolio section">
	
	  <div class="container mar">
	    <div class="row">
			<div class="col-lg-6">
				<a class="portfolio-item d-block mx-auto" href="guestParkingMember">
					<img class="img-fluid" src="${projectRes}images/ymk/guest_parking/memberIcon.png">
				</a>
			</div>
			<div class="col-lg-6">
				<a class="portfolio-item d-block mx-auto" href="guestParkingGuest">
					<img class="img-fluid" src="${projectRes}images/ymk/guest_parking/guestIcon.png">
				</a>
			</div>
	    </div>
	  </div>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../common/footerCopyright.jsp" %>
</body>
</html>