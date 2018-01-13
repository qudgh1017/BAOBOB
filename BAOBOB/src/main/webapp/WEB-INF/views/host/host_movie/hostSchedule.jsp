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
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
	<link rel="stylesheet" href="${projectRes}phc/css/sche_reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="${projectRes}phc/css/sche_style.css"> <!-- Resource style -->
	
	
	<div class="content-wrapper" style="height:1800px;">
		<div id="content">
			<center><h3><b>스케줄 목록</b></h3></center>
			<hr style="border:3px solid black;">
			<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px; margin-left:177px; margin-bottom:15px;" type="button" name="hostMovieAddForm" onclick="window.location='hostScheduleAddForm'" value="스케줄 추가하기"/>
			<div >
				<input style="background-color:#343a40; color:white; border:1px solid black; float:right; width:200px; height:40px;  margin-bottom:15px;" type="button" name="hostMovieAddForm" onclick="#" value="스케줄 조회하기"/>
				<select name="theater_index" style="float:right;">
					<option value="">상영관 선택</option>
				</select>
			</div>
		</div>
		<div class="cd-schedule loading">
			<div class="timeline">
				<ul>
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
						<div class="top-info"><span>Monday</span></div>
		
						<ul>
							<li class="single-event" data-start="09:30" data-end="11:00" data-content="event-abs-circuit" data-event="event-3">
								<a href="#0">
									<em class="event-name">Abs Circuit</em>
								</a>
							</li>
		
							<li class="single-event" data-start="11:30" data-end="13:30" data-content="event-rowing-workout" data-event="event-2">
								<a href="#0">
									<em class="event-name">Rowing Workout</em>
								</a>
							</li>
		
							<li class="single-event" data-start="20:00" data-end="22:16"  data-content="event-yoga-1" data-event="event-3">
								<a href="#0">
									<em class="event-name">Yoga Level 1</em>
								</a>
							</li>
						</ul>
					</li>
		
					<li class="events-group">
						<div class="top-info"><span>Tuesday</span></div>
		
						<ul>
							<li class="single-event" data-start="10:00" data-end="11:00"  data-content="event-rowing-workout" data-event="event-2">
								<a href="#0">
									<em class="event-name">Rowing Workout</em>
								</a>
							</li>
		
							<li class="single-event" data-start="11:30" data-end="13:00"  data-content="event-restorative-yoga" data-event="event-4">
								<a href="#0">
									<em class="event-name">Restorative Yoga</em>
								</a>
							</li>
		
							<li class="single-event" data-start="13:30" data-end="15:00" data-content="event-abs-circuit" data-event="event-1">
								<a href="#0">
									<em class="event-name">Abs Circuit</em>
								</a>
							</li>
		
							<li class="single-event" data-start="15:45" data-end="16:45"  data-content="event-yoga-1" data-event="event-3">
								<a href="#0">
									<em class="event-name">Yoga Level 1</em>
								</a>
							</li>
						</ul>
					</li>
		
					<li class="events-group">
						<div class="top-info"><span>Wednesday</span></div>
		
						<ul>
							<li class="single-event" data-start="09:00" data-end="10:15" data-content="event-restorative-yoga" data-event="event-4">
								<a href="#0">
									<em class="event-name">Restorative Yoga</em>
								</a>
							</li>
		
							<li class="single-event" data-start="10:45" data-end="11:45" data-content="event-yoga-1" data-event="event-3">
								<a href="#0">
									<em class="event-name">Yoga Level 1</em>
								</a>
							</li>
		
							<li class="single-event" data-start="12:00" data-end="13:45"  data-content="event-rowing-workout" data-event="event-2">
								<a href="#0">
									<em class="event-name">Rowing Workout</em>
								</a>
							</li>
		
							<li class="single-event" data-start="13:45" data-end="15:00" data-content="event-yoga-1" data-event="event-3">
								<a href="#0">
									<em class="event-name">Yoga Level 1</em>
								</a>
							</li>
						</ul>
					</li>
		
					<li class="events-group">
						<div class="top-info"><span>Thursday</span></div>
		
						<ul>
							<li class="single-event" data-start="09:30" data-end="10:30" data-content="event-abs-circuit" data-event="event-1">
								<a href="#0">
									<em class="event-name">Abs Circuit</em>
								</a>
							</li>
		
							<li class="single-event" data-start="12:00" data-end="13:45" data-content="event-restorative-yoga" data-event="event-4">
								<a href="#0">
									<em class="event-name">Restorative Yoga</em>
								</a>
							</li>
		
							<li class="single-event" data-start="15:30" data-end="16:30" data-content="event-abs-circuit" data-event="event-1">
								<a href="#0">
									<em class="event-name">Abs Circuit</em>
								</a>
							</li>
		
							<li class="single-event" data-start="17:00" data-end="18:30"  data-content="event-rowing-workout" data-event="event-2">
								<a href="#0">
									<em class="event-name">Rowing Workout</em>
								</a>
							</li>
						</ul>
					</li>
		
					<li class="events-group">
						<div class="top-info"><span>Friday</span></div>
		
						<ul>
							<li class="single-event" data-start="10:00" data-end="11:00"  data-content="event-rowing-workout" data-event="event-2">
								<a href="#0">
									<em class="event-name">Rowing Workout</em>
								</a>
							</li>
		
							<li class="single-event" data-start="12:30" data-end="14:00" data-content="event-abs-circuit" data-event="event-1">
								<a href="#0">
									<em class="event-name">Abs Circuit</em>
								</a>
							</li>
		
							<li class="single-event" data-start="15:45" data-end="16:45"  data-content="event-yoga-1" data-event="event-3">
								<a href="#0">
									<em class="event-name">Yoga Level 1</em>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		
			<div class="event-modal">
				<header class="header">
					<div class="content">
						<span class="event-date"></span>
						<h3 class="event-name"></h3>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
		<script>
			if( !window.jQuery ) document.write('<script src="/baobob/resources/phc/js/jquery-3.0.0.min.js"><\/script>');
		</script>
		<script src="${projectRes}phc/js/main.js"></script> <!-- Resource jQuery -->
	<br>
	<br>
	</div>
	
	<!-- Footer -->
<%-- 	<%@ include file="../common/footer.jsp" %> --%>
</body>
</html>