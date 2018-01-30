<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title></title>
</head>
<body>
<!-- 	<div style="width:270px; float:left;"> -->
<%-- 		<p><img src="/baobob/resources/images/phc/${movieVO.movie_poster}" style="height:300px;"/></p> <br> --%>
<!-- 	</div> -->
<form name="hostScheduleModProForm" action="hostScheduleModPro" method="POST">
	<div style="width:100%;" align="center">
		<input type="hidden" name="theater_schedule_index" value="${scheduleVO.theater_schedule_index}"/>
		<table style="margin-top:110px; margin-bottom:50px; width:400px;">
			<tr>
				<td width="30%" height="40px" align="center">시작시간</td>
<%-- 				<td><fmt:formatDate type="both" pattern="YY-MM-DD HH:mm" value="${scheduleVO.schedule_startTime}" /></td> --%>
				<td width="70%"><input type="text" name="startDate" style="width:82px; height:35px; padding-left:5px;" value="<fmt:formatDate type="both" pattern="YY-MM-dd" value="${scheduleVO.schedule_startTime}" />"/>
					<input type="text" name="startTime" style="width:55px; height:35px; padding-left:5px;" value="<fmt:formatDate type="both" pattern="HH:mm" value="${scheduleVO.schedule_startTime}" />"/>
			</tr>
			<tr>
				<td align="center" height="40px">상영관</td>
				<td>
					<select name="theater_index" style="height:35px;">
							<option value="">상영관 선택</option>
						<c:forEach var="theaterVOs" items="${theaterVOS}">
							<option value="${theaterVOs.theater_index}" <c:if test="${theaterVOs.theater_index == theaterVO.theater_index}">
								selected
							</c:if> >${theaterVOs.theater_index}관(${theaterVOs.theater_row}행, ${theaterVOs.theater_col}열)</option>
							
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" height="40px">영화</td>
				<td>
					<select name="movie_index" style="height:35px;">
						<option value="">영화 선택</option>
						<c:forEach var="movieVOs" items="${movieVOS}">
							<option value="${movieVOs.movie_index}" <c:if test="${movieVOs.movie_index == movieVO.movie_index}">
								selected
							</c:if>>${movieVOs.movie_title}(${movieVOs.movie_runTime}분)</option>
						</c:forEach>
					</select>
				</td>
			</tr>
					
		</table>
		<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px;" type="submit" name="" value="스케줄 수정하기"/>
		&nbsp;&nbsp;
		<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px;" onclick="chkDeleteSchedule(${scheduleVO.theater_schedule_index});" type="button" name="" value="스케줄 삭제하기"/>
					
	</div>
</form>
</body>
</html>