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
	
	<div class="content-wrapper">
	<div id="content">
		<center><h3><b>영화 목록</b></h3></center>
		<hr style="border:3px solid black;">
		<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px; margin-left:177px; margin-bottom:15px;" type="button" name="hostMovieAddForm" onclick="window.location='hostMovieAddForm'" value="영화 등록하기"/>
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="width:800px; border:1px solid black;" align="center">
			<thead>
			<tr>
				<th style="width:15%;"> 영화번호</th>
				<th style="width:25%;"> 영화 제목 </th>
				<th style="width:10%;"> 감독 </th>
				<th style="width:15%;"> 장르 </th>
				<th style="width:15%;"> 개봉일 </th>
				<th style="width:10%;"> 상영여부 </th>
				<th style="width:10%;"> 삭제 </th>
			</tr>
			</thead>
			
			<!-- 게시글이 있으면 -->
			<c:if test="${cnt>0}">
				<c:forEach var="vo" items="${vos}">
					<tr>
						<td>
							${vo.movie_index}
						</td>
						<td>
							<a href="hostMovieDetail?movie_index=${vo.movie_index}">${vo.movie_title}</a>
						</td>
						<td>
							${vo.movie_director}
						</td>
						<td>
							<c:if test="${vo.movie_janre==1}">
								가족
							</c:if>
							<c:if test="${vo.movie_janre==2}">
								공포/호러
							</c:if>
							<c:if test="${vo.movie_janre==3}">
								드라마
							</c:if>
							<c:if test="${vo.movie_janre==4}">
								SF
							</c:if>
							<c:if test="${vo.movie_janre==5}">
								멜로/로맨스
							</c:if>
							<c:if test="${vo.movie_janre==6}">
								코미디
							</c:if>
							<c:if test="${vo.movie_janre==7}">
								애니메이션
							</c:if>
							<c:if test="${vo.movie_janre==8}">
								액션
							</c:if>
							<c:if test="${vo.movie_janre==9}">
								스릴러
							</c:if>
							<c:if test="${vo.movie_janre==10}">
								미스터리
							</c:if>
						</td>
						<td>
							${vo.movie_rel_date}
						</td>
						<td>
							${vo.movie_state}
						</td>
						<td>
							<input type="button" onclick="window.location='hostMovieDel?movie_index=${vo.movie_index}'" value="삭제"/>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 게시글이 없으면 -->
			<c:if test="${cnt==0}">
				<tr>
					<td colspan="7" align="center">
						영화 정보가 없습니다. 영화를 등록해 주세요.!!
					</td>
				</tr>
			</c:if>
		</table>
	</div>
	<br>
	<br>
	</div>
	
	<!-- Footer -->
	<script src="${projectRes}adminBootstrap/vendor/jquery/jquery.min.js"></script>
	<%@ include file="movie_footer.jsp" %>
</body>
</html>