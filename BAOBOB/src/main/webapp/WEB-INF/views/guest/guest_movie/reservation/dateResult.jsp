<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>

<!-- 영화별 스케줄 없을때 -->
<c:if test="${cnt==0}">
	등록된 스케줄이 없습니다.
</c:if>
<!-- 영화별 스케줄 있을때 -->
<c:if test="${cnt>0}">
	<div class="btn-group" data-toggle="buttons" style="display:block;">
	<c:forEach var="schedule" items="${schedules}">
		
		<label onclick="" class="btn" style="height:30px; width:60px;">
		    <input type="radio" name="date" id="date1" autocomplete="off">
			<div align="left" style="font-size:13px">
				<fmt:formatDate value="${schedule.schedule_startDate}" pattern="HH:mm"/>
			</div>
	 	</label>
		${schedule.theater_index}관
		${schedule.schedule_MDNstate}
	 	
		
	</c:forEach>
	</div>
</c:if>	

<%-- <fmt:formatDate value="${schedule.schedule_startDate}" pattern="YYYY.MM.dd(E) HH:mm" /> --%>
<!-- TO_CHAR(변수,'YYMMDD') = TO_CHAR(SYSDATE,'YYMMDD') -->
