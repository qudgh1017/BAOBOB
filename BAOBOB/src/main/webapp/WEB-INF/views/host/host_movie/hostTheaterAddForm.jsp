<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${projectRes}phc/js/script.js"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp" %>
	
	<div class="content-wrapper">

	<form name="hostTheaterAddForm">
		<center><h3><b>상영관 등록</b></h3></center>
		<hr style="border:3px solid black;">
		<table align="center" style="border:1px solid black;">
			<tr>
				<td>관</td>
				<td><input type="number" id="theater_index" name="theater_index" placeholder="빈 영화관의 index(관)"/>관</td>
			</tr>
			<tr>
				<td>행</td>
				<td><input type="text" id="row" name="theater_row" placeholder="행 갯수(최대 26)"/></td>
			</tr>
			<tr>
				<td>열</td>
				<td><input type="text" id="col" name="theater_col" placeholder="열 갯수"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="seatSize" onclick="seatSet();" value="확인"/>
				</td>
			</tr>	
		</table>

	<br>
	<div id="theaterSet" align="center">
		<!-- 상영관 좌석도 -->
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
	
	<input type="button" value="상영관 등록하기" onclick="hostTheaterAdd();"/>
	</form>
	
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>