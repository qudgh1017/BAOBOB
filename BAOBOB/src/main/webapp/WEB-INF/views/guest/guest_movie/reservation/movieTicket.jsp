<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>    
<%@ include file="/resources/setting.jsp"%>
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
			</div>
			
			<!-- 영화/날짜/시간 -->
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-3" align="center" style="height:40px; color:white; font-weight:bold; border:1px solid white; background-color:black">
					영화
				</div>
				<div class="col-md-2" align="center" style="height:40px; color:white; font-weight:bold; border:1px solid white; background-color:black">
					날짜
				</div>
				<div class="col-md-5" align="center" style="height:40px; color:white; font-weight:bold; border:1px solid white; background-color:black">
					시간
				</div>
				<div class="col-md-1"></div>
			</div>
			
			<!-- 영화 선택후 날짜로 ajax 날짜 선택후 시간 ajax -->
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-3" align="center" style="height:600px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
					<div style="overflow:auto; width:100%; height:100%; background-color:#EEEEEE">
						<!-- 등록된 영화 없을 때 -->
						<c:if test="${cnt == 0}">
							아직 등록된 영화가 없습니다.
						</c:if>
						
						<!-- 등록된 영화 있을 때(상영예정작, 상영중 리스트) -->
						<c:if test="${cnt>0}">
							<br>
							<div class="btn-group movie" data-toggle="buttons" style="display:block;">
							<c:forEach var="movie" items="${movies}"> 
								<!-- 상영 중 -->
								<c:if test="${movie.movie_state==1}">
									<label onclick="clickMovie('${movie.movie_index}')" class="btn movie" style="height:50px; width:95%;">
									    <input type="radio" name="movie_index" autocomplete="off">
										<div align="left">
											<c:if test="${movie.movie_age==0}"><img src="${projectRes}/images/ybh/전체관람가.png" style="width:15px; height:15px;"></c:if>
											<c:if test="${movie.movie_age==12}"><img src="${projectRes}/images/ybh/12세 관람가.png" style="width:15px; height:15px;"></c:if>
											<c:if test="${movie.movie_age==15}"><img src="${projectRes}/images/ybh/15세 관람가.png" style="width:15px; height:15px;"></c:if>
											<c:if test="${movie.movie_age==19}"><img src="${projectRes}/images/ybh/청소년 관람불가.png" style="width:15px; height:15px;"></c:if>&nbsp; 
											${movie.movie_title}
										</div>
								 	</label>
								</c:if>
								
								<!-- 상영예정작 -->
								<c:if test="${movie.movie_state==0}">
									<label class="btn movie" onclick="nonPlaying();" style="height:50px; color: rgba(0,0,0,0.5); background-color: rgba(255, 255, 255, 0.5); width:95%;">
									    <input type="radio" name="movie_index" autocomplete="off">
										<div align="left">
											<c:if test="${movie.movie_age==0}"><img src="${projectRes}/images/ybh/전체관람가.png" style="width:15px; height:15px;"></c:if>
											<c:if test="${movie.movie_age==12}"><img src="${projectRes}/images/ybh/12세 관람가.png" style="width:15px; height:15px;"></c:if>
											<c:if test="${movie.movie_age==15}"><img src="${projectRes}/images/ybh/15세 관람가.png" style="width:15px; height:15px;"></c:if>
											<c:if test="${movie.movie_age==19}"><img src="${projectRes}/images/ybh/청소년 관람불가.png" style="width:15px; height:15px;"></c:if>&nbsp; 
											${movie.movie_title}
										</div>
								 	</label>
								</c:if>
							</c:forEach>
							</div>
						</c:if>
					</div>
				</div>
				
				<!-- 날짜 선택 -->
				<div class="col-md-2" align="center" style="height:600px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
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
							 	<label onclick="clickDate('1')" class="btn" style="height:50px; width:95%; display:block;">
								    <input type="radio" name="date" id="date2" autocomplete="off" value="1">
									<span><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000)%>" pattern="E dd" /></span>
							 	</label>
							 	<label onclick="clickDate('2')" class="btn" style="height:50px; width:95%; display:block;">
								    <input type="radio" name="date" id="date3" autocomplete="off" value="2">
									<span><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 2)%>" pattern="E dd" /></span>
							 	</label>
							 	<label onclick="clickDate('3')" class="btn" style="height:50px; width:95%; display:block;">
								    <input type="radio" name="date" id="date4" autocomplete="off" value="3">
									<span><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 3)%>" pattern="E dd" /></span>
							 	</label>
							 	<label onclick="clickDate('4')" class="btn" style="height:50px; width:95%; display:block;">
								    <input type="radio" name="date" id="date5" autocomplete="off" value="4">
									<span><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 4)%>" pattern="E dd" /></span>
							 	</label>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 스케줄 -->
				<div class="col-md-5" align="center" style="height:600px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
					<div style="overflow:auto; width:100%; height:100%; background-color:#EEEEEE">
						<img src="${projectRes}/images/ybh/sun.png" style="width:20px; height:20px;">조조 &nbsp;&nbsp;&nbsp;&nbsp;<img src="${projectRes}/images/ybh/moon.png" style="width:20px; height:20px;">심야
						<br><br>
						<c:set var="theater_index" value="0"/>
						<c:forEach var="theaterSeat" items="${theaterSeats}">
							<c:if test="${theaterSeat!=0}">
							<c:set var="theater_index" value="${theater_index+1}"/>
								${theater_index}관(${theaterSeat}석)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>
						</c:forEach>
						<hr>
						<!-- 스케줄 결과값 출력 될곳 -->
						<div id="resultSchedule" align="left" style="height:30px;">
							<center>영화와 날짜를 선택해주세요.</center>
						</div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
			
			</div>
			<!-- Ajax정보 표시하는 곳들 -->
				<div class="row" style="background-color:black; height:150px;">
				<!-- 영화정보 -->
				<div class="col-md-3" align="center"; style="border: solid 1px gray; color:white;">
					<div id="movieInfo">
						<br><br>
						<center style="color:gray">영화 선택</center>
					</div>
				</div>
				<!-- 일시, 상영관, 인원 -->
				<div class="col-md-3" align="left" style="border: solid 1px gray; color:white">
					<div id="scheduleInfo">
						<br><br>
						<center style="color:gray">스케줄 선택</center>
					</div>
				</div>
				<!-- 좌석정보, 가격 -->
				<div class="col-md-3" align="left" style="border: solid 1px gray; color:white">
					<div id="seatInfo">
						<br><br>
						<center style="color:gray">
							자리를 선택하기 위해 <br>
							오른쪽의 버튼을 클릭해주세요
						</center>
					</div>
				</div>
				<!-- 좌석선택 아이콘 -->
				<div class="col-md-3" align="center" style="border: solid 1px gray; color:gray; font-weight:bold;">
					<div id="nextSeatButton">
						<br><br>
						<center style="color:gray">
							영화, 날짜, 스케줄을 다 선택하셔야 <br>
							다음페이지로 이동 가능합니다.
						</center>
					</div>
				</div>
			</div>
	</section>
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>