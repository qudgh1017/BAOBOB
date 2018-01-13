<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
<!-- slide -->
<!-- slide 기능 사용위한 라이브러리 -->
<%-- <link href="${projectRes}ybh/css/slick.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${projectRes}ybh/js/slick.min.js"></script>
<script type="text/javascript" src="${projectRes}ybh/js/slide.js"></script>	
 --%>	
</head>
<body>
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10" align="left">
					<br>
					<h3 align=left;>영화 상세</h3>
					<hr style="border:2px solid black;">
				</div>
				<div class="col-md-offset-1"></div>
			</div><br><br>
			
			<!-- 영화정보 -->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-3" align="left">
					<img src="${projectRes}/images/phc/${movie.movie_poster}">
				</div>
				<div class="col-md-7" align="left">
					<h3 style="display:inline-block;">${movie.movie_title}</h3>
						<c:choose>
							<c:when test="${movie.movie_state==0}">상영예정</c:when>
							<c:when test="${movie.movie_state==1}">상영중</c:when>
							<c:when test="${movie.movie_state==2}">상영종료</c:when>
						</c:choose>
					<br>
					<span style="font-size:15px; color:gray;">
						예매율:
					</span><br><hr>
					<span style="font-size:12px; font-weight:bold;">
						감독: ${movie.movie_director} / 배우:${movie.movie_star}<br><br>
						장르: 
						<c:choose>
							<c:when test="${movie.movie_janre==1}">가족</c:when>
							<c:when test="${movie.movie_janre==2}">공포/호러</c:when>
							<c:when test="${movie.movie_janre==3}">드라마</c:when>
							<c:when test="${movie.movie_janre==4}">SF</c:when>
							<c:when test="${movie.movie_janre==5}">멜로/로맨스</c:when>
							<c:when test="${movie.movie_janre==6}">코미디</c:when>
							<c:when test="${movie.movie_janre==7}">애니메이션</c:when>
						</c:choose>
						 /기본:
						 <c:if test="${movie.movie_age==0}">전체관람가,</c:if>
						 <c:if test="${movie.movie_age!=0}">${movie.movie_age}세 이상,</c:if>
						 
						 <%-- ${movie.movie_runtime} --%>분,<%-- ${movie.moive_country} --%>
						 <br><br>
						 개봉: 20${movie.movie_rel_date}
					</span>
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			
			<!-- 줄거리 -->
			<div class="row" style="padding-top:50px;">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10" align="left" style="height:250px;">
					<span style="font-size:12px;">
						${movie.movie_content}
					</span>
				</div>
				<div class="col-md-offset-1"></div>
			</div><br><br>
			
			<!-- 트레일러1-->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10" align="left" style="height:40px; background-color:#EEEEEE;">
					<span style="font-size:15px; font-weight:bold">
						트레일러
					</span>
				</div>
				<div class="col-md-offset-1"></div>
			</div><br>
			<!-- 트레일러2 -->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10" align="center">
					<div class="embed-responsive embed-responsive-16by9"> <!-- 해상도  -->
						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${movie.movie_trailer}"></iframe>
						</iframe>
					</div>
				</div>
				<div class="col-md-offset-1"></div>
			</div><br><br>
			
			<!-- 리뷰1 -->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10" align="left" style="height:40px; background-color:#EEEEEE;">
					<span style="font-size:15px; font-weight:bold">
						리뷰
					</span>
				</div>
				<div class="col-md-offset-1"></div>
			</div><br>
			
			<!-- 리뷰2 -->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10" align="center">
					리뷰들어갈곳~~
				</div>
				<div class="col-md-offset-1"></div>
			</div><br><br>
				
		</div>
	</section>
	
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>