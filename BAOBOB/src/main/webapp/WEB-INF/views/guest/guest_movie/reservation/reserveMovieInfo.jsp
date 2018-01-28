<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<br>
<!-- 예매선택된 영화정보 -->
<div style="display:inline-block;">
	<img src="${projectRes}/images/phc/${movie.movie_poster}" style="width:90px;height:110px;">
</div>
<div style="display:inline-block; font-size:13px; font-weight:bold; margin-left:10px;">
	${movie.movie_title}
	<br><br>
	<c:if test="${movie.movie_age==0}">전체관람가</c:if>
	<c:if test="${movie.movie_age!=0}">${movie.movie_age}세 이상 관람가</c:if>
</div>