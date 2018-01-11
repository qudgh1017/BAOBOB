<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/resources/setting.jsp" %>
<script src="${projectRes}ymk/js/mainJS.js"></script>

<c:if test="${cnt != 0}">
	<c:choose>
		<c:when test="${sessionScope.memStep == 13}">
			<script type="text/javascript">
				errorAlert('인증 후 로그인 가능합니다.');
			</script>
		</c:when>
		<c:when test="${sessionScope.memStep == 1}">
			<!-- 종합관리자 url --> 
		</c:when>
		<c:when test="${sessionScope.memStep == 2}">
			<!-- 영화관리자 url -->
		</c:when>
		<c:when test="${sessionScope.memStep == 3}">
			<!-- 영화직원 -->
		</c:when>
		<c:when test="${sessionScope.memStep == 4}">
			<!-- 식당 총관리 -->
		</c:when>
		<c:when test="${sessionScope.memStep == 5}">
			<!-- 식당관리자 -->
		</c:when>
		<c:when test="${sessionScope.memStep == 6}">
			<!-- 식당직원 -->
		</c:when>
		<c:when test="${sessionScope.memStep == 7}">
			<!-- 주차장 관리자 -->
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				window.location='mainIndex';
			</script>
		</c:otherwise>
	</c:choose>
</c:if>

<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert('로그인 정보가 일치하지 않습니다.');
	</script>
</c:if>