<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>
<script src="${projectRes}ymk/js/mainJS.js"></script>

<c:if test="${cnt != 0}">
	<c:redirect url="mainIndex"/>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert('로그인 실패');
	</script>
</c:if>