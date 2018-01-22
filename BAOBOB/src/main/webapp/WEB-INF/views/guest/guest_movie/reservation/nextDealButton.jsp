<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<!-- 내 전용 script -->
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
<!-- 좌석관련 script -->
<script type="text/javascript" src="${projectRes}ybh/js/seat.js"></script>


<!-- 예매선택된 스케줄정보 -->
<div style="font-size:13px; font-weight:bold;">
	<br>
	<a onclick="movieTicket3('${adultCnt}', '${teenagerCnt}', '${theater_schedule_index}')">
		<img src="${projectRes}/images/ybh/post.png" style="height:80px">
	</a>
	<br>결제
</div>