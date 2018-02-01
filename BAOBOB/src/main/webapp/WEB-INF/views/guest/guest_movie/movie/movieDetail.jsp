<!-- 상세 영화정보 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
</head>
<body>
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	
	<section style="padding-top:0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12" align="left">
					<br>
					<h3 align=left;>영화 상세</h3>
					<hr style="border:2px solid black;">
				</div>
			</div><br><br>
			
			<!-- 영화정보 -->
			<div class="row">
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
					<!-- 예매율: 해당영화를 본 사람 수/전체 영화를 본 사람 수 -->
					<span style="font-size:15px; color:gray;">
						예매율: ${reservationPercent}%
					</span><br><hr>
					<span style="font-size:12px; font-weight:bold;">
						감독: ${movie.movie_director}&nbsp;/&nbsp;배우:${movie.movie_star}<br><br>
						장르: 
						<c:choose>
							<c:when test="${movie.movie_janre==1}">가족</c:when>
							<c:when test="${movie.movie_janre==2}">공포/호러</c:when>
							<c:when test="${movie.movie_janre==3}">드라마</c:when>
							<c:when test="${movie.movie_janre==4}">SF</c:when>
							<c:when test="${movie.movie_janre==5}">멜로/로맨스</c:when>
							<c:when test="${movie.movie_janre==6}">코미디</c:when>
							<c:when test="${movie.movie_janre==7}">애니메이션</c:when>
							<c:when test="${movie.movie_janre==8}">액션</c:when>
							<c:when test="${movie.movie_janre==9}">스릴러</c:when>
							<c:when test="${movie.movie_janre==10}">미스테리</c:when>
						</c:choose>
						 &nbsp;/&nbsp;기본:
						
						 ${movie.movie_runTime}분, ${movie.movie_country}, &nbsp; 
						<c:if test="${movie.movie_age==0}"><img src="${projectRes}/images/ybh/전체관람가.png" style="width:20px; height:20px;"></c:if>
						<c:if test="${movie.movie_age==12}"><img src="${projectRes}/images/ybh/12세 관람가.png" style="width:20px; height:20px;"></c:if>
						<c:if test="${movie.movie_age==15}"><img src="${projectRes}/images/ybh/15세 관람가.png" style="width:20px; height:20px;"></c:if>
						<c:if test="${movie.movie_age==19}"><img src="${projectRes}/images/ybh/청소년 관람불가.png" style="width:20px; height:20px;"></c:if>
						<br><br>
						개봉: 20${movie.movie_rel_date}<br><br>
						<%-- <fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${movie.movie_rel_date}" /> --%>
						<!-- 위시리스트 하트 색깔 -->		
						<c:if test="${wishCnt>=1}">
							<a href="#!"><i class="material-icons" style="color:red;">favorite</i></a>
						</c:if>	
						<c:if test="${wishCnt==0}">
							<a href="addWishList?movie_index=${movie.movie_index}"><i class="material-icons" style="color:red;">favorite_border</i></a>
						</c:if>
					</span>
				</div>
				<div class="col-md-2"></div>
			</div>
			
			<!-- 줄거리 -->
			<div class="row" style="padding-top:50px;">
				<textarea disabled class="col-md-10" rows="7" cols="100" style="resize:none; color:black; font-size:13px; background-color:white; height:250px;">${movie.movie_content}</textarea>
				<div class="col-md-2"></div>
			</div><br><br>
			
			<!-- 트레일러1-->
			<div class="row">
				<div class="col-md-10" align="left" style="height:40px; background-color:#EEEEEE;">
					<span style="font-size:15px; font-weight:bold">
						트레일러
					</span>
				</div>
				<div class="col-md-2"></div>
			</div><br>
			<!-- 트레일러2 -->
			<div class="row">
				<div class="col-md-10" align="center">
					<div class="embed-responsive embed-responsive-16by9"> <!-- 해상도  -->
						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${movie.movie_trailer}"></iframe>
						</iframe>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div><br><br>
			
			<!-- 리뷰-->
			<%@ include file="/WEB-INF/views/guest/guest_movie/movie/reviewList.jsp" %>
		</div>
	</section>
	
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>