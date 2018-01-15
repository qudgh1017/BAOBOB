<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp" %>
<script src="${projectRes}ymk/js/mainJS.js"></script>

<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert('인증 메일이 전송되었습니다.\n인증 후 가입 처리가 완료됩니다.');
		window.location='mainIndex';
	</script>
</c:if>

<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert('가입 처리 실패');
	</script>
</c:if>

<c:if test="${cnt == 9}">
	<script type="text/javascript">
		errorAlert('인증 메일 전송 실패');
	</script>
</c:if>