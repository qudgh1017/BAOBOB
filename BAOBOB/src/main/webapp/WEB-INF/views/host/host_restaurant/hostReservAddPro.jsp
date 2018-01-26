<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<body>
	<!-- 예약 추가 실패 -->
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("삽입 실패");
		</script>
	</c:if>
	
	<!-- 아이디 없음 -->
	<c:if test="${cnt == 2}">
		<script type="text/javascript">
			alert("존재하지 않는 아이디 입니다.\n다시 예약해주세요.");
			window.location="hostReservList";
		</script>
	</c:if>
	
	<!-- 예약 추가 성공 -->
	<c:if test="${cnt != 0 && cnt != 2}">
		<script type="text/javascript">
			alert("예약이 정상적으로 처리 되었습니다.");
			window.location="hostReservList";
		</script>
	</c:if>
</body>
</html>