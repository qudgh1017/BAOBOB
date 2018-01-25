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
<body onload="personInitial();">
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	
	<!-- 나중에 값을 넘길때 배열형식 저장할 공간 -->
	<input type="hidden" name="seat_index_arr"  value="">
	<!-- <input type="text" name="adultCnt" value="">
	<input type="text" name="teenagerCnt" value=""> -->
	<!-- <input type="text" name="totalChecked" value="">
	<input type="text" name="maxChecked" value="">
	 
	<div onload="nextDealButton()">
	</div> -->
	
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
			
			<!-- 영화/날짜/시간 -->
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10" align="center" style="height:40px; color:white; font-weight:bold; border:1px solid white; background-color:black">
					인원/좌석
				</div>
				<div class="col-md-1"></div>
			</div>
			
			<!-- 인원수 선택 및 좌석현황 -->
			<div class="row">
				<div class="col-md-1"></div>
				<!-- 인원수 선택 -->
				<div class="col-md-5" align="left" style="height:100px; color:black; font-weight:bold; border:1px solid white; background-color:#DDDDDD">
					<br>
					<div style="width:50px; display:inline-block;">일반</div>
					<c:forEach var="num" begin="0" end="8" step="1">
						<label id="adult${num}" onclick="adultChk('${schedule.theater_index}', '${schedule.movie_index}', '${schedule.theater_schedule_index}','${num}')" class="btn" style="height:30px; width:30px; border:1px solid black; font-weight:bold">
<%-- 						    <input id="adult${num}" type="radio" style="width:0px; height:0px;" name="adult" autocomplete="off" value="${num}"> --%>
							${num}
					 	</label>
				 	</c:forEach>
				 	<br>
				 	<div style="width:50px; display:inline-block;">청소년</div>
				 	<c:forEach var="num" begin="0" end="8" step="1">
						<label id="teenager${num}" onclick="teenagerChk('${schedule.theater_index}', '${schedule.movie_index}', '${schedule.theater_schedule_index}', '${num}')" class="btn" style="height:30px; width:30px; border:1px solid black; font-weight:bold">
<%-- 						    <input id="teenager${num}" type="radio" style="width:0px; height:0px;" name="teenager" autocomplete="off" value="${num}"> --%>
							${num}
					 	</label>
				 	</c:forEach>
				</div>	
				
				<!-- 좌석현황/ 영화상영시간 -->	
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
			
			<!-- 좌석도 보여줄 곳 -->
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-8" align="center" style="height:500px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
					<!-- 좌석선택 뿌리는 곳 -->
					<div id="theaterSeat">
						인원을 체크해주세요.
					</div>
				</div>
				<div class="col-md-2" align="center" style="height:500px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
					<div style="width:100%; height:150px; padding:0px;">
					
					</div>
					<!-- 좌석 정보 -->
					<div align="left" style="width:100%; height:350px; padding:0px; font-size:15px;">
						<label class="btn btn" style="margin:1px 1px; height:35; width:35; border:2px solid green;">
							<input type="checkbox" style="width:0; height:0;" disabled>
						</label>&nbsp;&nbsp;Standard Zone
						<br><br>
						<label class="btn btn" style="margin:1px 1px; height:35; width:35; border:2px solid red;">
							<input type="checkbox" style="width:0; height:0;" disabled>
						</label>&nbsp;&nbsp;Prime Zone
						<br><br>
						<label class="btn btn" style="margin:1px 1px; height:35; width:35; border:2px solid pink;">
							<input type="checkbox" style="width:0; height:0;" disabled>
						</label>&nbsp;&nbsp;SWEET BOX
						<br><br>
						<label class="btn btn" style="margin:1px 1px; height:35; width:35; background-image: url('${projectRes}/images/phc/icon/theater_comp.png'); background-size:33px">
			 				<input type="checkbox" style="width:0; height:0;" disabled>
						</label>&nbsp;&nbsp;Reserved
						<br><br>
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
			<div class="col-md-3" align="center" style="border: solid 1px gray; color:gray; font-weight:bold;" >
				<div id="nextDealButton" >
				
				
					<!-- 예매선택된 인원/좌석 정보 -->
					<div style="font-size:13px; font-weight:bold;">
						<br>
							<a onclick="movieTicket3('${schedule.theater_schedule_index}')"> 
							<img src="${projectRes}/images/ybh/post.png" style="height:80px">
						</a>
						<br>결제
					</div>
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