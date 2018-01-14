<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ include file="/resources/setting.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/baobob/resources/reset.css">
<c:set var="projectRes" value="/baobob/resources/" />


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <style type="text/css">

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="${projectRes}phc/js/script.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
 $(function() {
   $( "#datepicker" ).datepicker({
     dateFormat: 'y-mm-dd'
   });
   
   $( "#timepicker" ).timepicker({
	   step: 30, 
	   timeFormat: "HH:mm"
   });
 });
</script>
</head>

<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp" %>
	
	<div class="content-wrapper">

	<form action="hostScheduleAddPro" method="post" >
		<center><h3><b>스케줄 등록</b></h3></center>
		<hr style="border:3px solid black;">
		<table align="center" style="border:1px solid black;">
			<tr>
				<td>날짜 선택</td>
				<td><input type="text" name="schedule_startDate" id="datepicker" class="datepicker" value="${schedule_startDate}" placeholder="날짜 선택" required/></td>
			</tr>
			<tr>
				<td>시간 선택</td>
				<td><input type="text" name="schedule_startTime" placeholder="시간선택"  id="timepicker" required size="8" maxlength="5" value="${schedule_startTime}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px;" type="button" value="확인" onclick="checkPosTheater();"/>
				</td>
			</tr>
			<c:if test="${confirm==1}">
			<tr>
				<td>영화 선택</td>
				<td>
					<select name="movie_index">
							<option value="">영화 선택</option>
						<c:forEach var="movieVO" items="${movieVOS}">
							<option value="${movieVO.movie_index}">${movieVO.movie_title}(${movieVO.movie_runTime}분)</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>상영관 선택</td>
				<td>
					<select name="theater_index">
							<option value="">상영관 선택</option>
						<c:forEach var="theaterVO" items="${theaterVOS}">
							<option value="${theaterVO.theater_index}">${theaterVO.theater_index}관(${theaterVO.theater_row}행, ${theaterVO.theater_col}열)</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px;" type="submit" value="스케줄 등록"/>
				</td>
			</tr>
			</c:if>
		</table>
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</div>
	
	<!-- Footer -->
	<%@ include file="movie_footer.jsp" %>
</body>
</html>