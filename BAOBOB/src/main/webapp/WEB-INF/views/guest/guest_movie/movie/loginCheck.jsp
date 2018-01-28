<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
	<%@ include file="/resources/ybh/js/loginService.js"%>
</script>
<%@ include file="/resources/setting.jsp"%>
<body>
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	
	<!-- 로그인 sub로 띄울 창 -->
	<section style="padding:10">
		<div class="container" align="center">
			<div>
				로그인이 필요한 서비스 입니다.<br>
				로그인 페이지로 이동하시겠습니까?<br>
			</div>
			<div style="padding-top:10px">
				<button class="btn btn-primary" onclick="mainSignIn();">확인</button>
				<button class="btn btn-black" onclick="cancel()">취소</button>
			</div>
		</div>
	</section>
</body>
</html>