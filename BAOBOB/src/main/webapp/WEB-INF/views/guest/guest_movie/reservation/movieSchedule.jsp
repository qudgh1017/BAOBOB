<!-- 추가요망 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
</head>
<body>
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>

<!-- 예매 - 상영시간표 -->	
	<section>
		<div class="container">
			상영시간표
			<a onclick="schedule(4,1)">dddd</a>
		</div>
	</section>
	<br>
	<section style="padding-top:0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10" align="left">
					<br>
					<h3 align=left;>빠른 예매</h3>
					<hr style="border:2px solid black;">
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</section>	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>