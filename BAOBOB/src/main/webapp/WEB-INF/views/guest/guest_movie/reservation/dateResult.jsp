<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>

<!-- 영화별 스케줄 없을때 -->
<c:if test="${cnt==0}">
	등록된 스케줄이 없습니다.
</c:if>
<!-- 영화별 스케줄 있을때 -->
<c:if test="${cnt>0}">
	<div class="btn-group" data-toggle="buttons" align="center" style="display:block;">
		<!-- 스케줄 정보 -->
		<c:forEach var="schedule" items="${schedules}">
		
			<c:set var="startTime" value="${schedule.schedule_startTime}"/>
			<c:set var="currentTime" value="<%=new Timestamp(System.currentTimeMillis())%>"/>
			
			<!-- 스케줄 시작시간인데 현재시각 지난경우 예매 불가능하게 -->
			<c:if test="${startTime<=currentTime}">
				<label onclick="clickSchedule('${schedule.theater_schedule_index}','${schedule.movie_index}');" class="btn" style="height:30px; width:60px; border:1px solid gray;">
				    <input type="radio" name="date" disabled autocomplete="off">
					<div align="left" style="font-size:15px; color:gray;">
						<fmt:formatDate value="${schedule.schedule_startDate}" pattern="HH:mm"/><br>마감
					</div>
			 	</label>
		 	</c:if>
		 	
		 	<!-- 스케줄 시작시간 현재시간 이후 남은 것만 예매 가능하게 -->
		 	<c:if test="${startTime>currentTime}">
			 	<label onclick="clickSchedule('${schedule.theater_schedule_index}','${schedule.movie_index}');" class="btn" style="height:30px; width:60px; border:1px solid black;">
				    <input type="radio" name="date" autocomplete="off">
					<div align="left" style="font-size:15px;">
						<fmt:formatDate value="${schedule.schedule_startDate}" pattern="HH:mm"/>
					</div>
			 	</label>
			 	<!-- 관련 상영관, 좌석 정보 (시작시간 옆에 띄어주기)-->
			 	<span style="font-size:13px;">
				 	<c:if test="${schedule.schedule_MDNstate==0}">
				 		<img src="${projectRes}/images/ybh/sun.png" style="width:20px; height:20px;">
				 	</c:if>
				 	<c:if test="${schedule.schedule_MDNstate==2}">
				 		<img src="${projectRes}/images/ybh/moon.png" style="width:20px; height:20px;">
					</c:if>
					${schedule.theater_index}관,
					(${schedule.schedule_empty_seat}석)
			 	</span>
		 	</c:if>
		<br><br>
		</c:forEach>
	 	<hr>
	</div>
</c:if>	

<%-- <fmt:formatDate value="${schedule.schedule_startDate}" pattern="YYYY.MM.dd(E) HH:mm" /> --%>
<!-- TO_CHAR(변수,'YYMMDD') = TO_CHAR(SYSDATE,'YYMMDD') -->
