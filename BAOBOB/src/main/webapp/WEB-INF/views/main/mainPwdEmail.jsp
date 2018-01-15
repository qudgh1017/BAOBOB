<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp" %>
<script src="${projectRes}ymk/js/mainJS.js"></script>
<c:if test="${cnt != 0}">
	<script type="text/javascript">
		alert('인증 메일을 전송했습니다.');
		window.location='mainSignIn';
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert('인증 메일 전송 실패\n잠시 후 다시 시도하세요');
	</script>
</c:if>