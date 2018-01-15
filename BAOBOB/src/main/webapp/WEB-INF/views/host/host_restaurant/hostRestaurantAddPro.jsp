<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<body>
	<!-- 매장 추가 실패 -->
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("삽입 실패");
		</script>
	</c:if>
	
	<!-- 매장 추가 성공 -->
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("새로운 매장이 추가되었습니다.");
			window.location="hostRestaurantList";
		</script>
	</c:if>
</body>
</html>