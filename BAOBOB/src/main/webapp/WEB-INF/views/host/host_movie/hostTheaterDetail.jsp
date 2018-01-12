<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${projectRes}phc/js/script.js"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark" onload="getSeatInfo(${vo.theater_col}, ${vo.theater_row}, ${state})">

	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp" %>
	
	<div class="content-wrapper">
	<c:if test="${vo==null || seat_vos==null}">
		alert("부적절한 접근입니다.");
		window.history.back();
	</c:if>
	<form action="hostTheaterModPro" method="post" >
	<center><h3><b>${vo.theater_index}관</b></h3></center>
	<hr style="border:3px solid black;">
	<br>
	<br>
	<br>

		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" align="center" style="border:1px solid black;">
			<tr>
				<td colspan="2"><input type="number" name="movie_index" style="width:40px;" placeholder="n관" value="${vo.theater_index}"/>관</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="theaterSeat" align="center">
					
					</div>
					<br>
					<div align="center">
						<button type="button" onclick="spaceType('0')"><img src="${projectRes}images/phc/icon/theater_blank.png"></button>
						<button type="button" onclick="spaceType('1')"><img src="${projectRes}images/phc/icon/theater_in.png"></button>
						<button type="button" onclick="spaceType('2')"><img src="${projectRes}images/phc/icon/theater_out.png"></button>
						<button type="button" onclick="spaceType('3')"><img src="${projectRes}images/phc/icon/theater_normal.png"></button>
						<button type="button" onclick="spaceType('4')"><img src="${projectRes}images/phc/icon/theater_premium.png"></button>
						<button type="button" onclick="spaceType('5')"><img src="${projectRes}images/phc/icon/theater_couple.png"></button>
					</div>
					
					<input type="button" value="상영관 등록하기" onclick="#"/>
				</td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>