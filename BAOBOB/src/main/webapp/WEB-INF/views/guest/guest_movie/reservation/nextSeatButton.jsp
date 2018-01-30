<!-- AJAX처리된 페이지: movieTicket페이지에서 스케줄 선택시 선택한(영화,스케줄정보를 가지고) 다음버튼을 보여주는 페이지(검은색 창) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
<br>

<!-- 예매선택된 스케줄정보 -->
<div style="font-size:13px; font-weight:bold;">
	<br>
	<!-- 로그인 했을때: 클릭시 다음페이지로(정보가지고) -->
	<c:if test="${sessionScope.memId != null}">
		<a onclick="ToSeat('${movie_index}', '${theater_schedule_index}')">
			<img src="${projectRes}/images/ybh/post.png" style="height:80px">
		</a>
	</c:if>
	<!-- 로그인 안했을 때: 클릭시 sub창으로 로그인이 필요한 창 -->
	<c:if test="${sessionScope.memId == null}">
		<a onclick="loginCheck()">
			<img src="${projectRes}/images/ybh/post.png" style="height:80px">
		</a>
	</c:if>
	<br>좌석선택
</div>




