<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp" %>
	
	<div class="content-wrapper">
	<div id="content">
		<center><h3><b>스케줄 목록</b></h3></center>
		<hr style="border:3px solid black;">
		<input style="background-color:#8888ff; border:1px solid black; height:40px; margin-left:177px; margin-bottom:15px;" type="button" name="hostMovieAddForm" onclick="window.location='hostScheduleAddForm'" value="스케줄 추가하기"/>
	</div>
	<br>
	<br>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>