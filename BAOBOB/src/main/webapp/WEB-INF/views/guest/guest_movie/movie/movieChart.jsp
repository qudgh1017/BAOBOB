<!-- 영화- 무비차트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
<style>
.state:hover{
	text-decoration:none;
	font-weight:bold;
	color:red;
}
</style>
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
				<div class="col-md-12">
					<br>
					<h3 align=left; style="display:inline-block; margin-right:800px">
						무비차트
					</h3>
					<a class="state" href="movieChart?movie_state=1">
						<c:if test="${movie_state==1}"><span style="font-weight:bold; color:red;">무비차트</span></c:if>
						<c:if test="${movie_state!=1}">무비차트</c:if>
					</a>&nbsp;&nbsp;
					<a class="state" href="movieChart?movie_state=0">
						<c:if test="${movie_state==0}"><span style="font-weight:bold; color:red;">상영예정작</span></c:if>
						<c:if test="${movie_state!=0}">상영예정작</c:if>
					</a>
					<hr style="border:2px solid black;">
					<br><br>
				</div>
			</div>
		</div>
		
		<!-- 포스터 선택 -->
		<div class="container">
			<div class="row">
				<c:if test="${cnt>0}">
					<!-- <tr> -->
					<c:forEach var="movie" items="${movies}">
						<div class="col-md-3" style="margin-right:10px auto">
							<c:set var="number" value="${number+1}"/>
							<c:if test="${number<4}">
								<div align="center" style="background-color:red; width:195px; border:5px solid black; margin-bottom:5px;">
									<span style="color:white; font-weight:bold;">No.${number}</span>
								</div>
							</c:if>
							<c:if test="${number>3}">
								<div align="center" style="background-color:gray; width:195px; border:5px solid black; margin-bottom:5px;">
									<span style="color:white; font-weight:bold;">No.${number}</span>
								</div>
							</c:if>
							<a href="movieDetail?movie_index=${movie.movie_index}"><img style="border:5px solid black;"src="${projectRes}images/phc/${movie.movie_poster}"></a>
							
							<div align="left" style="width:195px;">
									<span style="font-weight:bold;">
										${movie.movie_title}
										<c:if test="${movie.movie_age==0}"><img src="${projectRes}/images/ybh/전체관람가.png" style="width:15px; height:15px;"></c:if>
										<c:if test="${movie.movie_age==12}"><img src="${projectRes}/images/ybh/12세 관람가.png" style="width:15px; height:15px;"></c:if>
										<c:if test="${movie.movie_age==15}"><img src="${projectRes}/images/ybh/15세 관람가.png" style="width:15px; height:15px;"></c:if>
										<c:if test="${movie.movie_age==19}"><img src="${projectRes}/images/ybh/청소년 관람불가.png" style="width:15px; height:15px;"></c:if>
									</span><br>
									<span style="font-weight:bold; color:gray; font-size:12px">
										20${movie.movie_rel_date} 개봉
									</span><br>
							</div><br><br>
						</div>
					</c:forEach>
					<!-- </tr> -->
				</c:if>
				
				<!-- 게시글이 없으면 -->
				<c:if test="${cnt == 0}">
					<div class="col-md-12" align="center">
						등록된 영화가 없습니다.
					</div>
				</c:if>
			</div>
		</div>		
			
		<div class="container" style="margin-top:50px">
			<div class="row">
				<div class="col-md-12" align="center">
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀] 특수문자:ㅁ + 한자키 -->
						<c:if test="${startPage > pageBlock}">
							<a href="movieChart?movie_state=${movie_state}">[◀◀]</a>
							<a href="movieChart?movie_state=${movie_state}&pageNum=${startPage - pageBlock}">[◀]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="movieChart?movie_state=${movie_state}&pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음블록 [▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="movieChart?movie_state=${movie_state}&pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="movieChart?movie_state=${movie_state}&pageNum=${pageCount}">[▶▶]</a> <!-- 마지막페이지로 -->
						</c:if>
					
					</c:if>
				</div>
			</div>
		</div>
	</section>
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>