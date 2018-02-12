<!-- movieFinder페이지의 검색결과 페이지(Ajax처리) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${projectRes}ybh/js/movieFinder.js"></script>

<div class="col-md-12" align="center">
	<div align="center">
		<image src="${projectRes}images/ybh/search_results.gif">
		<hr style="border: 2px solid black;">
		<h5>
			아래의 선택조건에 해당하는 영화가 총
			${cnt} 
			건 검색되었습니다.
		</h5>
	</div>
	<div align="left" style="font-weight:bold; width:1100px; hieght:300px; background-color:#EEEEEE">
	
	<!-- 페이지 이동을 위해 -->
	<input type="hidden" id="keyword" name="keyword" value="${movieFinder.keyword}">
	<input type="hidden" id="select" name="select"  value="${movieFinder.sel}">
	<input type="hidden" id="movie_janre" name="movie_janre" value="${movieFinder.movie_janre}">
	<input type="hidden" id="movie_country" name="movie_country" value="${movieFinder.movie_country}">
	<input type="hidden" id="movie_age" name="movie_age" value="${movieFinder.movie_age}">			
				
		
		<c:if test="${movieFinder.keyword != ''}">
			키워드
			<c:choose>
				<c:when test="${movieFinder.sel=='all'}">(전체)</c:when>
				<c:when test="${movieFinder.sel=='movie_title'}">(제목)</c:when>
				<c:when test="${movieFinder.sel=='movie_star'}">(배우)</c:when>
				<c:when test="${movieFinder.sel=='movie_director'}">(감독)</c:when>
			</c:choose>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			${movieFinder.keyword} <br>
		</c:if>
		
		장르 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<c:forEach var="movie_janre" items="${movieFinder.movie_janre}">
			<c:choose>
				<c:when test="${movie_janre == 1}">가족</c:when>
				<c:when test="${movie_janre == 2}">공포/호러</c:when>
				<c:when test="${movie_janre == 3}">드라마</c:when>
				<c:when test="${movie_janre == 4}">SF</c:when>
				<c:when test="${movie_janre == 5}">멜로/로맨스</c:when>
				<c:when test="${movie_janre == 6}">코미디</c:when>
				<c:when test="${movie_janre == 7}">애니메이션</c:when>
				<c:when test="${movie_janre == 8}">액션</c:when>
				<c:when test="${movie_janre == 9}">스릴러</c:when>
				<c:when test="${movie_janre == 10}">미스터리</c:when>
			</c:choose>
		</c:forEach><br>
		
		연령 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:forEach var="movie_age" items="${movieFinder.movie_age}">
			<c:choose>
				<c:when test="${movie_age == 0}">전체관람가</c:when>
				<c:when test="${movie_age == 12}">12세이상 관람가</c:when>
				<c:when test="${movie_age == 15}">15세이상 관람가</c:when>
				<c:when test="${movie_age == 19}">청소년관람 불가</c:when>
			</c:choose>
		</c:forEach><br>
		
		제작국가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:forEach var="movie_country" items="${movieFinder.movie_country}">
			<c:if test="${movie_age != ''}">
				${movie_country} 
			</c:if>
		</c:forEach><br>
		<br>
	</div>
</div>

<!-- 포스터 선택 -->
<c:if test="${cnt>0}">
	<c:forEach var="movie" items="${movies}">
		<div class="col-md-3" style="margin-right:10px auto">
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
</c:if>

<!-- 게시글이 없으면 -->
<c:if test="${cnt == 0}">
	<div class="col-md-12" align="center">등록된 영화가 없습니다.</div>
</c:if>

<%-- <c:if test="${movieFinder.keyword==''}">
	<c:set var="keyword" value="x"/>
</c:if> --%>
<!-- 페이징 처리!!!!!!!!! -->
<%-- <div class="col-md-12" align="center">
	<c:if test="${cnt > 0}">
		<!-- 처음[◀◀] / 이전블록[◀] 특수문자:ㅁ + 한자키 -->
		<c:if test="${startPage > pageBlock}">
			<a href="searchResult?keyword=${movieFinder.keyword}&sel=${movieFinder.sel}&movie_janre=${movieFinder.movie_janre}&movie_country=${movieFinder.movie_country}&movie_age=${movieFinder.movie_age}">[◀◀]</a>
			<a href="searchResult?pageNum=${startPage - pageBlock}&keyword=${movieFinder.keyword}&sel=${movieFinder.sel}&movie_janre=${movieFinder.movie_janre}&movie_country=${movieFinder.movie_country}&movie_age=${movieFinder.movie_age}">[◀]</a>
		</c:if>

		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i == currentPage}">
				<span><b>[${i}]</b></span>
			</c:if>
			<c:if test="${i != currentPage}">
				<a class="page" href="searchResult?pageNum=${i}">[${i}]</a>
				<a onclick="searchResultPage(${i},${movieFinder.keyword},${movieFinder.sel}, ${str_movie_janre_info}, ${str_movie_country_info}, ${str_movie_age_info});" href="#!">[${i}]</a>
			</c:if>
		</c:forEach>

		<!-- 다음블록 [▶] / 끝[▶▶] -->
		<c:if test="${pageCount > endPage}">
			<a class="page" href="searchResult?pageNum=${startPage + pageBlock}&keyword=${movieFinder.keyword}&sel=${movieFinder.sel}&movie_janre=${movieFinder.movie_janre}&movie_country=${movieFinder.movie_country}&movie_age=${movieFinder.movie_age}">[▶]</a>
			<a class="page" href="searchResult?pageNum=${pageCount}&keyword=${movieFinder.keyword}&sel=${movieFinder.sel}&movie_janre=${movieFinder.movie_janre}&movie_country=${movieFinder.movie_country}&movie_age=${movieFinder.movie_age}">[▶▶]</a>
			<!-- 마지막페이지로 -->
		</c:if>

	</c:if>
</div> --%>


<%
	request.setCharacterEncoding("UTF-8");
%>


