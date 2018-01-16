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
			<!--종합 관리자 -->
			<script type="text/javascript">
				errorAlert('종합관리자');
			</script>
		</c:when>
		<c:when test="${sessionScope.memStep == 2 || sessionScope.memStep == 3}">
			<!-- 영화 관리자 | 영화 직원  -->
			<c:redirect url="hostMovie"/>
		</c:when>
		<c:when test="${sessionScope.memStep == 4 || sessionScope.memStep == 5 || sessionScope.memStep == 6}">
			<!-- 식당 총관리 | 식당 관리자 | 식당 직원 -->
			<c:redirect url="hostReservList"/>
		</c:when>
		<c:when test="${sessionScope.memStep == 7}">
			<!-- 주차장 관리자 -->
			<c:redirect url="hostParkingMain"/>
		</c:when>
		<c:otherwise>
			<c:redirect url="mainIndex"/>
		</c:otherwise>
	</c:choose>
</c:if>

<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert('로그인 정보가 일치하지 않습니다.');
	</script>
</c:if>