<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<body>
	<!-- 결제 처리 실패 -->
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("결제 실패");
		</script>
	</c:if>
	
	<!-- 아이디 없음 -->
	<c:if test="${cnt == 2}">
		<script type="text/javascript">
			alert("존재하지 않는 아이디 입니다.\n다시 결제해주세요.");
			window.location="hostReservList";
		</script>
	</c:if>
	
	<!-- 포인트 부족 -->
	<c:if test="${cnt == 3}">
		<script type="text/javascript">
			alert("포인트가 부족합니다.\n다시 결제해주세요.");
			window.location="hostReservList";
		</script>
	</c:if>
	
	<!-- 결제 처리 성공 -->
	<c:if test="${cnt != 0 && cnt != 2 && cnt != 3}">
		<script type="text/javascript">
			alert("정상적으로 결제 되었습니다.");
			window.location="hostReservList";
		</script>
	</c:if>
</body>
</html>