<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
<script src="//code.jquery.com/jquery-1.11.0.js"></script>
<script type="text/javascript">
//load되면 전체 체크
$(window).load(function(){
	$("input:checkbox").prop("checked",true);
});
</script>
<script type="text/javascript" src="${projectRes}ybh/js/movieFinder.js"></script>
</head>
<body>
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	
	<section style="padding-top:0px">
		<div class="container">
			<div class="row">
				<div class="col-md-12" align="left">
					<br>
					<h3 align=left;>무비 파인더</h3>
					<hr style="border:2px solid black;">
				</div>
			</div>
		</div>
		
		<!-- 선택 -->
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10" align="center" style="background: #FFFFFF url(${projectRes}images/ybh/div.gif) no-repeat center center; width:100%; height:500px;">
					<br><br><br>
					<div align="center" style="color:white; height:400px;">
						<h5 align="center">좋아하는 영화, 찾고싶은 영화를 BAOBOX에서 찾아드립니다!</h5>
						<hr style="border:1px solid white;">
						<!-- <form name="searchForm" id="searchForm"> -->
							<table style="height:330px; width:100%;">
								<!-- 영화검색 -->
								<tr style="border-bottom:1px solid white" align="center">
									<th style="color:white; font-size:12px; font-weight:bald; width:20%;">	
										영화검색
									</th>
									<td style="width:80%" align="left">
										<!-- 찾을 컬럼명 선택 -->
										<select id="select" name="select" style="background-color:white; height:25px; font-size:12px;">
										    <option value="all">전체</option>
										    <option value="movie_title">영화제목</option>
										    <option value="movie_star">주연배우</option>
										    <option value="movie_director">감독</option>
										</select>
										<input type="text" id="keyword" name="keyword" placeholder="키워드를 입력해 주세요" style="font-size:12px; width:400px; height:25px">
									</td>
								</tr>
								
								<!-- 장르 -->
								<tr style="border-bottom:1px solid white" align="center">
									<th style="color:white; font-size:12px; font-weight:bald;">	
										장르
									</th>
									<td align="left" style="color:white; font-size:12px; font-weight:bald;">
										<input type="checkbox" id="checkall_janre">전체 <br><br>
										<input type="checkbox" name="movie_janre" value="1">가족 &nbsp;
										<input type="checkbox" name="movie_janre" value="2">공포/호러 &nbsp;
										<input type="checkbox" name="movie_janre" value="3">드라마 &nbsp;
										<input type="checkbox" name="movie_janre" value="4">SF &nbsp;
										<input type="checkbox" name="movie_janre" value="5">멜로/로맨스 &nbsp;
										<input type="checkbox" name="movie_janre" value="6">코미디 &nbsp;
										<input type="checkbox" name="movie_janre" value="7">애니메이션 &nbsp;
										<input type="checkbox" name="movie_janre" value="8">액션 &nbsp;
										<input type="checkbox" name="movie_janre" value="9">스릴러 &nbsp;
										<input type="checkbox" name="movie_janre" value="10">미스터리 &nbsp;
									</td>
								</tr>
								
								<!-- 제작국가 -->
								<tr style="border-bottom:1px solid white" align="center">
									<th style="color:white; font-size:12px; font-weight:bald;">	
										제작국가
									</th>
									<td align="left" style="color:white; font-size:12px; font-weight:bald;">
										<input type="checkbox" id="checkall_country">전체  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="한국"> 한국&nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="미국">미국 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="일본">일본 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="중국">중국&nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="홍콩">홍콩 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="프랑스">프랑스 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="영국">영국 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="독일">독일 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="인도">인도 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="기타">기타 &nbsp;&nbsp;
									</td>
								</tr>
								
								<!-- 관람등급 -->
								<tr style="border-bottom:1px solid white" align="center">
									<th style="color:white; font-size:12px; font-weight:bald;">	
										관람등급	
									</th>
									<td align="left" style="color:white; font-size:12px; font-weight:bald;">
										<input type="checkbox" id="checkall_age">전체  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="movie_age" value="0"> 전체관람가&nbsp;&nbsp;
										<input type="checkbox" name="movie_age" value="12">12세 관람가 &nbsp;&nbsp;
										<input type="checkbox" name="movie_age" value="15">15세 관람가&nbsp;&nbsp;
										<input type="checkbox" name="movie_age" value="19">청소년 관람불가 &nbsp;
										
									</td>
								</tr>
								
								<!-- 버튼 -->
								<tr>
									<td colspan="2" align="center">
										<button id="search_btn" class="btn btn-danger">검색</button>
										<input class="btn btn-info" type="reset" value="초기화">
										
										<!-- <input class="btn btn-danger" type="submit" value="검색"> -->
									</td>
								</tr>
							</table>
						<!-- </form> -->
					</div>
				</div>
				<div class="col-md-1"></div>
				
				
			</div><br><br>
		</div>
		
		<div class="container">
			<!-- 결과출력 -->
			<div id="result" class="row">
				<div class="col-md-12">
					<br>
					<h3 align=left; style="display:inline-block; margin-right:800px">
						무비차트
					</h3>
					<!-- <a class="state" href="movieChart?movie_state=1"> -->
					<%-- 	<c:if test="${movie_state==1}"><span style="font-weight:bold; color:red;">무비차트</span></c:if>
						<c:if test="${movie_state!=1}">무비차트</c:if>
						
					</a>&nbsp;&nbsp;
					<a class="state" href="movieChart?movie_state=0">
						<c:if test="${movie_state==0}"><span style="font-weight:bold; color:red;">상영예정작</span></c:if>
						<c:if test="${movie_state!=0}">상영예정작</c:if>
					</a> --%>
					<hr style="border:2px solid black;">
					<br><br>
				</div>
			
		
				<!-- 포스터 선택 -->
				<c:if test="${cnt>0}">
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
				</c:if>
				
				<!-- 게시글이 없으면 -->
				<c:if test="${cnt == 0}">
					<div class="col-md-12" align="center">
						등록된 영화가 없습니다.
					</div>
				</c:if>
				
			
		
				<div class="col-md-12" align="center">
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀] 특수문자:ㅁ + 한자키 -->
						<c:if test="${startPage > pageBlock}">
							<a href="movieFinder?movie_state=${movie_state}">[◀◀]</a>
							<a href="movieFinder?movie_state=${movie_state}&pageNum=${startPage - pageBlock}">[◀]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="movieFinder?movie_state=${movie_state}&pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음블록 [▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="movieFinder?movie_state=${movie_state}&pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="movieFinder?movie_state=${movie_state}&pageNum=${pageCount}">[▶▶]</a> <!-- 마지막페이지로 -->
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