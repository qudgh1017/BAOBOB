<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<body>
	<!-- 메뉴 추가 실패 -->
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("삽입 실패");
		</script>
	</c:if>
	
	<!-- 메뉴 추가 성공 -->
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("새로운 메뉴가 추가되었습니다.");
			window.location="hostMenuList";
		</script>
	</c:if>
</body>
</html>