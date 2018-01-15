<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp"%>

<c:if test="${cnt != 0}">
	비밀번호는 '${pwd}'입니다.
	30초 후 BAOBOB 로그인 화면으로 이동합니다.
	<script type="text/javascript">
		setTimeout(function() {
			window.location = 'mainSignIn';
		}, 30000);
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert('인증 실패');
		window.location = 'mainSignIn';
	</script>
</c:if>