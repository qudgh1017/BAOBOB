<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>

<script type="text/javascript">
function hdTrailerPlaying(movie_index){
	window.open("hdTrailerPlaying?movie_index="+movie_index, "host_logout", "top=50 left=150 width=1200 height=700"); 
}
</script>
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
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
			<div class="col-md-12" align="left">
				<br>
				<h3 align=left;>트레일러</h3>
				<hr style="border:2px solid black;">
			</div>
			
		</div><br><br>
	</div>	
	
	<!-- 트레일러 영상 -->
	<div class="container" style="background-color:black; height:700px; width:100%">
		<div class="row">
			<c:if test="${cnt>0}">
				<c:forEach var="movie" items="${movies}">
					<c:set var="number" value="${number+1}"/>
					<c:if test="${number==1}">
						<div class="col-md-1" align="center"></div>
						<div class="col-md-8" align="center">
							<div class="embed-responsive embed-responsive-16by9"> <!-- 해상도  -->
								<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${movie.movie_trailer}"></iframe>
								</iframe>
							</div>
						</div>
						<div class="col-md-2" align="center"><br><br><br>
							<<a href="movieDetail?movie_index=${movie.movie_index}">
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
						<div class="col-md-1"></div>
						<div class="col-md-1"></div>
						<div class="col-md-10" align="left">
							<span style="color:white;">줄거리</span>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-1"></div>
						<textarea disabled class="col-md-10" rows="7" cols="100" style="resize:none; color:white; font-size:13px; background-color:black; height:200px;">${movie.movie_content}</textarea>
						<div class="col-md-1"></div>
					</c:if>
				</c:forEach>
			</c:if>	
		</div>
	</div><br><br>
	
	<!-- 트레일러 포스터 선택 -->
	<div class="container">
		<div class="row">
			<!-- 추천 트레일러-->
			<div class="col-md-12" align="center">
				<br>
				<img src="${projectRes}/images/ybh/trailer_recommend.gif">
				<hr style="border:2px solid black;">
			</div>
			
			<c:if test="${cnt>0}">
				<c:set var="number" value="0"/>
				<c:forEach var="movie" items="${movies}">
					<div class="col-md-3" align="center">
						<c:set var="number" value="${number+1}"/>
						<c:if test="${number<5}">
							<div align="center" style="background-color:red; width:195px; border:5px solid black; margin-bottom:5px;">
								<span style="color:white; font-weight:bold;">No.${number}</span>
							</div>
							<a onclick="hdTrailerPlaying(${movie.movie_index});"><img style="border:5px solid black;"src="${projectRes}images/phc/${movie.movie_poster}"></a>
							<br>
						<span style="font-weight:bold; font-size:13px">
							[${movie.movie_title}] 예고편
						</span><br>
						<span style="font-weight:bold; color:gray; font-size:12px">
							20${movie.movie_rel_date} 개봉
						</span><br>
						</c:if>
					</div>
				</c:forEach>
			</c:if>	
			<br><br>
			
			<!-- 전체 hd_trailer -->
			<div class="col-md-12" align="center">
				<br>
				<img src="${projectRes}/images/ybh/hd_trailer.gif">
				<hr style="border:2px solid black;">
			</div>
			
			<!-- 게시글 있으면 -->
			<c:if test="${cnt>0}">
				<c:forEach var="movie" items="${movies}">
					<div class="col-md-3" style="margin:10px auto">
						<a onclick="hdTrailerPlaying(${movie.movie_index});"><img src="${projectRes}images/phc/${movie.movie_poster}"></a>
						<br>
						<span style="font-weight:bold; font-size:13px">
							[${movie.movie_title}] 예고편
						</span><br>
						<span style="font-weight:bold; color:gray; font-size:12px">
							20${movie.movie_rel_date} 개봉
						</span><br>
					</div>
				</c:forEach>
			</c:if>
			
			<!-- 게시글이 없으면 -->
			<c:if test="${cnt == 0}">
				<div class="col-md-12" align="center">
					등록된 영화가 없습니다.
				</div>
			</c:if>
		</div>
	</div>		
		
	<!-- 페이지 컨트롤러 -->
	<div class="container" style="margin-top:50px">
		<div class="row">
			<div class="col-md-12" align="center">
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀] / 이전블록[◀] 특수문자:ㅁ + 한자키 -->
					<c:if test="${startPage > pageBlock}">
						<a href="hdTrailer?">[◀◀]</a>
						<a href="hdTrailer?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="hdTrailer?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록 [▶] / 끝[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="hdTrailer?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="hdTrailer?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막페이지로 -->
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
	
</section>
	<br>
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>