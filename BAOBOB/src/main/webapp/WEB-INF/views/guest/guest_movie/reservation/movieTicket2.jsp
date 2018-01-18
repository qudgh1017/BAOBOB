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

<body>
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
	
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
			</div><br><br>
			
			<!-- 영화/날짜/시간 -->
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10" align="center" style="height:40px; color:white; font-weight:bold; border:1px solid white; background-color:black">
					인원/좌석
				</div>
				<div class="col-md-1"></div>
			</div>
			
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-5" align="center" style="height:100px; color:black; font-weight:bold; border:1px solid white; background-color:#DDDDDD">
					인원선택<br>
				</div>
				<div class="col-md-5" align="center" style="height:100px; color:black; font-weight:bold; border:1px solid white; background-color:#DDDDDD">
					${schedule.theater_index}관&nbsp;&nbsp;|&nbsp;&nbsp; 남은좌석 <span style="color:red; font-weight:bold;">${schedule.schedule_empty_seat}</span>/${schedule.schedule_seat}
					<br><br>
					<h3>
						<fmt:formatDate value="${schedule.schedule_startTime}" pattern="YYYY.MM.dd(E) HH:mm" />~
						<fmt:formatDate value="${schedule.schedule_endTime}" pattern="HH:mm" />
					</h3>
				</div>
				<div class="col-md-1"></div>
			</div>
			
			<!-- 영화 선택후 날짜로 ajax 날짜 선택후 시간 ajax -->
			<div class="row">
				<div class="col-md-1"></div>
				
				<div class="col-md-10" align="center" style="height:500px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
					<div style="overflow:auto; width:100%; height:100%; background-color:#EEEEEE">
						<div id="resultDate" class="reserveTab" align="center" style="height:30px;">
							<span><fmt:formatDate value="<%=new Date()%>" pattern="YYYY" /></span><br>
							<span style="font-size: 30px; margin-bottom: 10px;"><fmt:formatDate value="<%=new Date()%>" pattern="MM" /></span><br>
							<br>
							<div class="btn-group" data-toggle="buttons" style="display:block;">
								<label onclick="clickDate('0')" class="btn" style="height:50px; width:95%; display:block;">
								    <input type="radio" name="date" id="date1" autocomplete="off" value="0">
									<span><fmt:formatDate value="<%=new Date(new Date().getTime())%>" pattern="E dd" /></span>
							 	</label>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col-md-1"></div>
			</div>
			
		</div>
		<div class="row" style="background-color:black; height:150px;">
			<!-- 영화정보 -->
			<div class="col-md-3" align="center"; style="border: solid 1px gray; color:white;">
				<div id="movieInfo">
					<%@include file="/WEB-INF/views/guest/guest_movie/reservation/reserveMovieInfo.jsp" %>
				</div>
			</div>
			<!-- 일시, 상영관, 인원 -->
			<div class="col-md-3" align="left" style="border: solid 1px gray; color:white">
				<div id="scheduleInfo">
					<%@include file="/WEB-INF/views/guest/guest_movie/reservation/reserveScheduleInfo.jsp" %>
				</div>
			</div>
			<!-- 좌석정보, 가격 -->
			<div class="col-md-3" align="left" style="border: solid 1px gray; color:white">
				<div id="seatInfo">
					<br><br>
					<center style="color:gray">
						좌석 선택
					</center>
				</div>
			</div>
			<!-- 좌석선택 아이콘 -->
			<div class="col-md-3" align="center" style="border: solid 1px gray; color:gray; font-weight:bold;">
				<div id="nextSeatButton2">
					<br><br>
					<center style="color:gray">
						좌석을 선택하셔야 <br>
						다음페이지로 이동 가능합니다.
					</center>
				</div>
				
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>