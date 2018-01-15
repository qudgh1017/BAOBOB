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
		<center><h3><b>상영관</b></h3></center>
		<hr style="border:3px solid black;">
		<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px; margin-left:177px; margin-bottom:15px;" type="button" name="hostTheaterAddForm" onclick="window.location='hostTheaterAddForm'" value="상영관 등록하기"/>
		<table class="table table-bordered" id="dataTable" style="width:100%; border:1px solid black;" align="center">
			<thead>
			<tr>
				<th style="width:25%;"> 상영관</th>
				<th style="width:25%;"> 행 </th>
				<th style="width:25%;"> 열 </th>
				<th style="width:25%;"> 삭제 </th>
			</tr>
			</thead>
			<!-- 게시글이 있으면 -->
			<c:if test="${cnt>0}">
				<c:forEach var="vo" items="${vos}">
					<tr>
						<td>
							<a href="hostTheaterDetail?theater_index=${vo.theater_index}">${vo.theater_index}관</a>
						</td>
						<td>
							${vo.theater_row}
						</td>
						<td>
							${vo.theater_col}
						</td>
						<td>
							<input type="button" onclick="window.location='hostTheaterDel?theater_index=${vo.theater_index}'" value="삭제"/>
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
			<tr align="center">
				<th align="center">
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a href="hostTheater">[◀◀]</a>
							<a href="hostTheater?pageNum=${startPage - pageBlock}">[◀]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="hostTheater?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음블록[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="hostTheater?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="hostTheater?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
						
					</c:if>
				</th>
			</tr>
		</table>
	</div>
	<br>

	</div>
	
	<!-- Footer -->
	<script src="${projectRes}adminBootstrap/vendor/jquery/jquery.min.js"></script>
	
	<%@ include file="movie_footer.jsp" %>
</body>
</html>