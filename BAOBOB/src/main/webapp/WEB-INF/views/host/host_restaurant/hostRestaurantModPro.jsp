<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<body>
	<!-- 매장 수정 실패 -->
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("수정 실패");
		</script>
	</c:if>
	
	<!-- 매장 수정 성공 -->
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("매장 정보가 수정 되었습니다.");
			window.location="hostRestaurantList";
		</script>
	</c:if>
</body>
</html>