<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp" %>
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
	<link rel="stylesheet" href="${projectRes}phc/css/sche_reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="${projectRes}phc/css/sche_style.css"> <!-- Resource style -->
	
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${projectRes}phc/js/script.js"></script>
	
	<script type="text/javascript">
	 $(function() {
	   $( "#datepicker" ).datepicker({
	     dateFormat: 'y-mm-dd'
	   });
	 });
	</script>
	
	<script type="text/javascript">
	function hostMovieResView(theater_index, movie_index, theater_schedule_index) {
		$.ajax({
			url : "hostMovieResView?theater_index=" + theater_index + "&movie_index=" + movie_index + "&theater_schedule_index=" + theater_schedule_index,
			type : 'GET',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(vo) {
				getScheduleSeatInfo(vo.totalCol, vo.totalRow, vo.state);
			},
			error : function() {
				alert('error');
			}
		})
	}
</script>
	
	<div class="content-wrapper" style="height:2000px;">
		
		<div id="content">
			<center><h3><b>예매 목록</b></h3></center>
			<hr style="border:3px solid black;">
<!-- 			<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px; margin-left:177px; margin-bottom:15px;" type="button" name="hostMovieAddForm" onclick="window.location='hostScheduleAddForm'" value="스케줄 추가하기"/> -->
			<div >
				<input style="background-color:#343a40; color:white; border:1px solid black; float:right; width:200px; height:40px;  margin-bottom:15px;" type="button" onclick="return hostResSearch();" value="조회하기"/>
				<select id="theater_index" name="theater_index" style="float:right;">
					<option value="">상영관 선택</option>
					<c:forEach var="theaterVO" items="${theaterVOS}">
							<c:if test="${theaterVO.theater_index == theater_index}">
								<option value="${theaterVO.theater_index}" selected>${theaterVO.theater_index}관</option>
							</c:if>
							<c:if test="${theaterVO.theater_index != theater_index}">
								<option value="${theaterVO.theater_index}" >${theaterVO.theater_index}관</option>
							</c:if>
					</c:forEach>
				</select>
				<input type="text" style="float:right;" name="date" id="datepicker" class="datepicker" placeholder="날짜선택" value="${date}"/>
			</div>
		</div>
		
		<div class="cd-schedule loading">
			<div class="timeline">
				<ul>
					<li><span>07:00</span></li>
					<li><span>07:30</span></li>
					<li><span>08:00</span></li>
					<li><span>08:30</span></li>
					<li><span>09:00</span></li>
					<li><span>09:30</span></li>
					<li><span>10:00</span></li>
					<li><span>10:30</span></li>
					<li><span>11:00</span></li>
					<li><span>11:30</span></li>
					<li><span>12:00</span></li>
					<li><span>12:30</span></li>
					<li><span>13:00</span></li>
					<li><span>13:30</span></li>
					<li><span>14:00</span></li>
					<li><span>14:30</span></li>
					<li><span>15:00</span></li>
					<li><span>15:30</span></li>
					<li><span>16:00</span></li>
					<li><span>16:30</span></li>
					<li><span>17:00</span></li>
					<li><span>17:30</span></li>
					<li><span>18:00</span></li>
					<li><span>18:30</span></li>
					<li><span>19:00</span></li>
					<li><span>19:30</span></li>
					<li><span>20:00</span></li>
					<li><span>20:30</span></li>
					<li><span>21:00</span></li>
					<li><span>21:30</span></li>
					<li><span>22:00</span></li>
					<li><span>22:30</span></li>
					<li><span>23:00</span></li>
					<li><span>23:30</span></li>

					
				</ul>
			</div> <!-- .timeline -->
		
			<div class="events">
				<ul>
					<li class="events-group">
						<div class="top-info" id="selectDay0"><span>${day0}</span></div>
						<ul>
						<c:forEach var="vo1" items="${vos1}">
							<li class="single-event" data-start="<fmt:formatDate type="both" pattern="HH:mm" value="${vo1.schedule_startTime}" />" data-end="<fmt:formatDate type="both" pattern="HH:mm" value="${vo1.schedule_endTime}" />" data-event="event-3">
							<a href="#0" onclick="hostMovieResView(${vo1.theater_index}, ${vo1.movie_index}, ${vo1.theater_schedule_index})">
								<em class="event-name">${vo1.theater_index}관 ${vo1.movie_index}번 영화</em>
							</a>
							</li>
						</c:forEach>
						</ul>
					</li>
		
					<li class="events-group">
						<div class="top-info" id="selectDay1"><span>${day1}</span></div>
		
						<ul>
							<c:forEach var="vo2" items="${vos2}">
							<li class="single-event" data-start="<fmt:formatDate type="both" pattern="HH:mm" value="${vo2.schedule_startTime}" />" data-end="<fmt:formatDate type="both" pattern="HH:mm" value="${vo2.schedule_endTime}" />" data-content="hostMovieResDetail?theater_index=${vo2.theater_index}&movie_index=${vo2.movie_index}&theater_schedule_index=${vo2.theater_schedule_index}" data-event="event-2">
							<a href="#0" onclick="hostMovieResView(${vo2.theater_index}, ${vo2.movie_index}, ${vo2.theater_schedule_index})">
								<em class="event-name">${vo2.theater_index}관 ${vo2.movie_index}번 영화</em>
							</a>
							</li>
							</c:forEach>
						</ul>
					</li>
		
					<li class="events-group">
						<div class="top-info" id="selectDay2"><span>${day2}</span></div>
		
						<ul>
							<c:forEach var="vo3" items="${vos3}">
							<li class="single-event" data-start="<fmt:formatDate type="both" pattern="HH:mm" value="${vo3.schedule_startTime}" />" data-end="<fmt:formatDate type="both" pattern="HH:mm" value="${vo3.schedule_endTime}" />" data-content="hostMovieResDetail?theater_index=${vo3.theater_index}&movie_index=${vo3.movie_index}&theater_schedule_index=${vo3.theater_schedule_index}" data-event="event-1">
							<a href="#0" onclick="hostMovieResView(${vo3.theater_index}, ${vo3.movie_index}, ${vo3.theater_schedule_index})">
								<em class="event-name">${vo3.theater_index}관 ${vo3.movie_index}번 영화</em>
							</a>
							</li>
							</c:forEach>
						</ul>
					</li>
		
					<li class="events-group">
						<div class="top-info" id="selectDay3"><span>${day3}</span></div>
		
						<ul>
							<c:forEach var="vo4" items="${vos4}">
							<li class="single-event" data-start="<fmt:formatDate type="both" pattern="HH:mm" value="${vo4.schedule_startTime}" />" data-end="<fmt:formatDate type="both" pattern="HH:mm" value="${vo4.schedule_endTime}" />" data-event="event-3">
							<a href="#0" onclick="hostMovieResView(${vo4.theater_index}, ${vo4.movie_index}, ${vo4.theater_schedule_index})">
								<em class="event-name">${vo4.theater_index}관 ${vo4.movie_index}번 영화</em>
							</a>
							</li>
							</c:forEach>
						</ul>
					</li>
		
					<li class="events-group">
						<div class="top-info" id="selectDay4"><span>${day4}</span></div>
		
						<ul>
							<c:forEach var="vo5" items="${vos5}">
							<li class="single-event" data-start="<fmt:formatDate type="both" pattern="HH:mm" value="${vo5.schedule_startTime}" />" data-end="<fmt:formatDate type="both" pattern="HH:mm" value="${vo5.schedule_endTime}" />" data-event="event-2">
							<a href="#0" onclick="hostMovieResView(${vo5.theater_index}, ${vo5.movie_index}, ${vo5.theater_schedule_index})">
								<em class="event-name">${vo5.theater_index}관 ${vo5.movie_index}번 영화</em>
								
							</a>
							</li>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</div>
		
			<div class="event-modal">
				<header class="header">
					<div class="content" align="center">
						<span class="event-date"></span>
						<h3 class="event-name"></h3><br><br>
						<div id="theaterSeat"></div>
					</div>
		
					<div class="header-bg"></div>
				</header>
		
				<div class="body">
					<div class="event-info"></div>
					<div class="body-bg"></div>
				</div>
		
				<a href="#0" class="close">Close</a>
			</div>
		
			<div class="cover-layer"></div>
		</div> <!-- .cd-schedule -->
		<script src="${projectRes}phc/js/modernizr.js"></script>
<!-- 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
		<script type="text/javascript">
 			if( !window.jQuery ) document.write('<script src="/baobobs/resources/phc/js/jquery-3.0.0.min.js"><\/script>');
 		</script>
		<script src="${projectRes}phc/js/main.js"></script> <!-- Resource jQuery -->
	<br>
	<br>
	</div>
	
	<!-- Footer -->
	<%@ include file="movie_footer.jsp" %>
</body>
</html>