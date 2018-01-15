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
	<div style="width:600px;">
		<input type="hidden" name="theater_schedule_index" value="${scheduleVO.theater_schedule_index}"/>
		<table>
			<tr>
				<td>시작시간</td>
<%-- 				<td><fmt:formatDate type="both" pattern="YY-MM-DD HH:mm" value="${scheduleVO.schedule_startTime}" /></td> --%>
				<td><input type="text" name="startDate" style="width:72px;" value="<fmt:formatDate type="both" pattern="YY-MM-DD" value="${scheduleVO.schedule_startTime}" />"/>
					<input type="text" name="startTime" style="width:45px;" value="<fmt:formatDate type="both" pattern="HH:mm" value="${scheduleVO.schedule_startTime}" />"/>
			</tr>
			<tr>
				<td>상영관</td>
				<td>
					<select name="theater_index">
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
				<td>영화</td>
				<td>
					<select name="movie_index" >
						<option value="">영화 선택</option>
						<c:forEach var="movieVOs" items="${movieVOS}">
							<option value="${movieVOs.movie_index}" <c:if test="${movieVOs.movie_index == movieVO.movie_index}">
								selected
							</c:if>>${movieVOs.movie_title}(${movieVOs.movie_runTime}분)</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px;" type="submit" name="" value="스케줄 수정하기"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px;" onclick="chkDeleteSchedule(${scheduleVO.theater_schedule_index});" type="button" name="" value="스케줄 삭제하기"/>
				</td>
			</tr>
			
		</table>
	</div>
</form>
</body>
</html>