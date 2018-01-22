<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<br>
<!-- 예매선택된 스케줄정보 -->
<div style="font-size:13px; font-weight:bold;">
	<br>
	<a onclick="ToSeat('${movie_index}', '${theater_schedule_index}')">
		<img src="${projectRes}/images/ybh/post.png" style="height:80px">
	</a>
	<br>좌석선택
</div>




