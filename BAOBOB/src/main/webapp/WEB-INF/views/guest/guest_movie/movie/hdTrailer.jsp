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
			트레일러 <a href="https://www.youtube.com/watch?v="></a>
		</div>
	</section>
	<br>
	<br>
	<br>
	<!-- <section class="bg-primary text-white mb-0" id="Notice">
	  <div class="container">
	    <h2 class="text-center text-uppercase text-white">Notice</h2>
	    <hr class="star-light mb-5">
	    <div class="row">
	      <div class="col-lg-4 ml-auto">
	        <p class="lead">BAOBOB는 B형 3명, A형 1명, O형 2명을 뜻한다.</p>
	      </div>
	      <div class="col-lg-4 mr-auto">
	        <p class="lead"><a class="notice_a" href="#">개인정보 이용내역 안내</a></p>
	      </div>
	    </div>
	   
	  </div>
	</section> -->
	
	<section>
	<div class="container">
		<div class="row">
		
		<!-- <table class="movie"> -->
			
			<c:if test="${cnt>0}">
				<!-- <tr> -->
				<c:forEach var="movie" items="${movies}">
					<div class="col-md-3">
						<a onclick="hdTrailerPlaying(${movie.movie_index});"><img src="${projectRes}images/phc/${movie.movie_poster}"></a>
						<%-- <a href="hdTrailerPlaying?movie_index=${movie.movie_index}"><img src="${projectRes}images/phc/${movie.movie_poster}"></a> --%>
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
		
		<div class="container">
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
	<div id="contact">contact</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>