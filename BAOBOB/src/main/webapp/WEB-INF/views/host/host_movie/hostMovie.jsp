<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.mvc.baobob.vo.MovieVO" %>
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="../common/navigation.jsp" %>
	
	<div class="content-wrapper">
	<br>
	<br>
	<div id="content">
		<input style="background-color:#8888ff; border:1px solid black; height:40px; margin-left:177px; margin-bottom:15px;" type="button" name="hostMovieAddForm" onclick="window.location='hostMovieAddForm'" value="영화 등록하기"/>
		<table style="width:800px; border:1px solid black;" align="center">
			<tr>
				<th style="width:15%;"> 영화번호</th>
				<th style="width:25%;"> 영화 제목 </th>
				<th style="width:10%;"> 감독 </th>
				<th style="width:15%;"> 장르 </th>
				<th style="width:15%;"> 개봉일 </th>
				<th style="width:10%;"> 상영여부 </th>
				<th style="width:10%;"> 삭제 </th>
			</tr>
			
			<!-- 게시글이 있으면 -->
			<c:if test="${cnt>0}">
				<c:forEach var="vo" items="${vos}">
					<tr>
						<td>
							${vo.movie_index}
						</td>
						<td>
							<a href="#">${vo.movie_title}</a>
						</td>
						<td>
							${vo.movie_director}
						</td>
						<td>
							${vo.movie_janre}
						</td>
						<td>
							${vo.movie_rel_date}
						</td>
						<td>
							${vo.movie_state}
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
		
		<!-- 페이지 컨트롤 -->
		<table style="width:800px" align="center">
			<tr>
				<th align="center">
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a href="hostMovie">[◀◀]</a>
							<a href="hostMovie?pageNum=${startPage - pageBlock}">[◀]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="hostMovie?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음블록[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="hostMovie?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="hostMovie?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
						
					</c:if>
				</th>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>