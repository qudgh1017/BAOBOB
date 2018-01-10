<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp" %>

<c:if test="${cnt != 0}">
	<script type="text/javascript">
		alert('가입 처리되었습니다.');
		window.location='mainIndex';
	</script>
</c:if>

<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert('가입 처리 실패');
	</script>
</c:if>