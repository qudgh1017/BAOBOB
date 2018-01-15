<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>
<html>
<body>
	<!-- 직원 등록 실패 -->
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("등록 실패");
		</script>
	</c:if>
	
	<!-- 직원 등록 성공 -->
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("새로운 직원을 등록했습니다.");
			window.location="hostEmployeeList";
		</script>
	</c:if>
</body>
</html>