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
		<center><h3><b>직원 목록</b></h3></center>
		<hr style="border:3px solid black;">
		<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px; margin-left:177px; margin-bottom:15px;" type="button" name="hostMovieEmpAddForm" onclick="window.location='hostMovieEmpAddForm'" value="직원 고용하기"/>
		<table class="table table-bordered" id="dataTable" cellspacing="0" style="border:1px solid black;" align="center">
			<thead>
			<tr>
				<th style="width:30%;"> 이름 </th>
				<th style="width:30%;"> 연락처 </th>
				<th style="width:30%;"> 고용일 </th>
				<th style="width:10%;"> 해고 </th>
			</tr>
			</thead>
			
			<!-- 직원목록이 있으면 -->
			<c:if test="${cnt>0}">
				<c:forEach var="vo" items="${vos}">
					<tr>
						<td>
							${vo.member_name}
						</td>
						<td>
							${vo.member_tel}
						</td>
						<td>
							${vo.member_reg_date}
						</td>
						<td>
							<input type="button" onclick="window.location='hostMovieEmpDel?member_id=${vo.member_id}'" value="해고"/>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 게시글이 없으면 -->
			<c:if test="${cnt==0}">
				<tr>
					<td colspan="7" align="center">
						직원 정보가 없습니다. 직원을 고용해 주세요.!!
					</td>
				</tr>
			</c:if>
		</table>
	</div>
	</div>
	
	<!-- Footer -->
	<script src="${projectRes}adminBootstrap/vendor/jquery/jquery.min.js"></script>
	<%@ include file="movie_footer.jsp" %>
</body>
</html>