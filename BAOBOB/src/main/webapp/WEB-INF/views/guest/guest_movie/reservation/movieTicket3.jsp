<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>    
<%@include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
</head>
<style>
.active{
	background-color:#000000;
	color:white;
}
</style>
<!-- 내 전용 script -->
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
<!-- 좌석관련 script -->
<script type="text/javascript" src="${projectRes}ybh/js/seat.js"></script>

<!-- onload="guestTheaterSeat('${schedule.theater_index}', '${schedule.movie_index}', '${schedule.theater_schedule_index}')" -->
<body>
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	<div>
	
	${adultCnt}<br>
	${teenagerCnt}<br>
	${theater_schedule_index}<br>
	
	
	<c:forEach var="seat" items="${seats}">
		좌석정보
		${seat.seat_index}<br>
		${seat.theater_schedule_index}
	</c:forEach>
	
	</div>

</body>
</html>