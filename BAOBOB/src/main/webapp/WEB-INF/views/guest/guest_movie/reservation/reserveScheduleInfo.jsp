<!-- AJAX처리된 페이지: movieTicket페이지에서 스케줄 선택시 선택한 스케줄정보를 보여주는 페이지(검은색 창) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<br>
<!-- 예매선택된 스케줄정보 -->
<div style="font-size:13px; font-weight:bold;">
	일시:&nbsp;&nbsp;&nbsp;
	<!-- 시간 처리 -->
	<fmt:formatDate value="${schedule.schedule_startTime}" pattern="YYYY.MM.dd(E) HH:mm" />~
	<fmt:formatDate value="${schedule.schedule_endTime}" pattern="HH:mm" />
	<c:if test="${schedule.schedule_MDNstate==0}">
		<img src="${projectRes}/images/ybh/sun.png" style="width:20px; height:20px;">					
	</c:if>
	<c:if test="${schedule.schedule_MDNstate==2}">
		<img src="${projectRes}/images/ybh/moon.png" style="width:20px; height:20px;">					
	</c:if>
	<br><br>
	상영관:&nbsp;&nbsp;&nbsp;${schedule.theater_index}관
</div>