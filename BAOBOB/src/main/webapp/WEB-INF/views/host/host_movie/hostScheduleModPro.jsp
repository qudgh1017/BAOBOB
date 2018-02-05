<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp"%>

	<div class="content-wrapper">
		<c:if test="${cnt > 0 }">
			<script type="text/javascript">
				alert("스케줄 수정 성공!");
				window.location = "hostSchedule";
			</script>
		</c:if>
		<c:if test="${cnt == 0 }">
			<script type="text/javascript">
				alert("스케줄 수정 실패 (다른 스케줄과 겹칩니다. 스케줄을 확인해주세요)");
				window.location = "hostSchedule";
			</script>
		</c:if>
	</div>

	<!-- Footer -->
	<%@ include file="movie_footer.jsp"%>
</body>
</html>