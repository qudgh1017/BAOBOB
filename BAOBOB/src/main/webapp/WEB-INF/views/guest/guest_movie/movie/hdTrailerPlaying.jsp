<!-- HD트레일러에서 해당영화포스터 클릭시 트레일러영상 sub창 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${movie.movie_title}</title>
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
</head>
<body style="background-color:black; height:700">
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	
	<section style="padding-top:50px;">
		<div class="container">
			<div class="row">
				<div class="col-md-10" align="center">
					<div class="embed-responsive embed-responsive-16by9"> <!-- 해상도  -->
						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${movie.movie_trailer}"></iframe>
						</iframe>
					</div>
				</div>
				<div class="col-md-2" align="center"><br><br><br>
					<a onclick="movieDetail(${movie.movie_index})">
						<img src="${projectRes}/images/phc/${movie.movie_poster}" width="120px" height="150px"><br>
					</a>
					<span style="color:white; font-size:15px; font-weight:bold">
						${movie.movie_title} 
						<c:if test="${movie.movie_age==0}"><img src="${projectRes}/images/ybh/전체관람가.png" style="width:15px; height:15px;"></c:if>
						<c:if test="${movie.movie_age==12}"><img src="${projectRes}/images/ybh/12세 관람가.png" style="width:15px; height:15px;"></c:if>
						<c:if test="${movie.movie_age==15}"><img src="${projectRes}/images/ybh/15세 관람가.png" style="width:15px; height:15px;"></c:if>
						<c:if test="${movie.movie_age==19}"><img src="${projectRes}/images/ybh/청소년 관람불가.png" style="width:15px; height:15px;"></c:if>
					</span><br>					
					<span style="color:white; font-size:11px">
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
					</span><br>
					<span style="color:white; font-size:11px">20${movie.movie_rel_date}</span><br>
										
				</div>
			</div><br>
			<div class="row">
				<div class="col-md-12" align="left">
					<span style="color:white;">줄거리</span>
				</div>
			</div>
			<div class="row">
				<textarea disabled class="col-md-10" rows="7" cols="100" style="resize:none; color:white; font-size:13px; background-color:black; height:200px;">${movie.movie_content}</textarea>
			</div>
		</div>
	</section>
		
</body>
</html>