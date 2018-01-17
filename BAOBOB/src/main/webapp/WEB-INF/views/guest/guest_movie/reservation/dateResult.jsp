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
	<br>
	<c:forEach var="schedule" items="${schedules}">
		<button type="button" class="btn btn-black" data-toggle="button" aria-pressed="false" autocomplete="off" style="width:95%; height:50px; ">
			<div class="reserveTab" align="left" >
				
				<fmt:formatDate value="${schedule.schedule_startDate}" pattern="YYYY.MM.dd(E) HH:mm" />
			</div>
		</button>
	</c:forEach>
</c:if>	
