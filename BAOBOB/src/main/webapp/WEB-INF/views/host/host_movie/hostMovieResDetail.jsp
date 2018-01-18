<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title></title>
</head>
<body >
<form onload="getScheduleSeatInfo(${vo.theater_col}, ${vo.theater_row}, ${state})">
	<div style="width:600px;" align="center">
		<input type="hidden" name="theater_schedule_index" value="${scheduleVO.theater_schedule_index}"/>
		<table style="width:500px;">
			<tr>
				<td> 시작시간 </td>
				<td><fmt:formatDate type="both" pattern="YY-MM-DD HH:mm" value="${scheduleVO.schedule_startTime}" /></td>
			</tr>
			<tr>
				<td> 상영관 </td>
				<td>${theaterVO.theater_index}관</td>
			</tr>
			<tr>
				<td> 영화 </td>
				<td>${movieVO.movie_index}</td>
			</tr>
			<tr>
				<td colspan="2">
<%-- 					<input type="button" value="예매현황 보기" onclick="getScheduleSeatInfo(${vo.theater_col}, ${vo.theater_row}, ${state})"> --%>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="theaterSeat" align="center">
					
					</div>
				</td>
			</tr>
		</table>
	</div>

	
</form>
</body>
</html>