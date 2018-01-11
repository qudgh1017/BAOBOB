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

	<form name="hostTheaterAddForm" action="hostTheaterAddPro" method="post" enctype="multipart/form-data">
		<center><h3><b>상영관 등록</b></h3></center>
		<hr style="border:3px solid black;">
		<table align="center" style="border:1px solid black;">
			<tr>
				<td>행</td>
				<td><input type="text" name="theater_row" placeholder="행 갯수"/></td>
			</tr>
			<tr>
				<td>열</td>
				<td><input type="text" name="theater_col" placeholder="열 갯수"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="seatSize" onclick="seatSet();" value="확인"/>
				</td>
			</tr>	
		</table>
		<div id="theaterSet">
			
		</div>
	</form>
	
	<script type="text/javascript">
		function seatSet(){
			var row = document.hostTheaterAddForm.theater_row.value;
			var col = document.hostTheaterAddForm.theater_col.value;
			alert("행 : " + row + "칸 , 열 : " + col + "칸" );
			
			
		}
	</script>
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