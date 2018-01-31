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

		<c:if test="${cnt== 1 }">
			<script type="text/javascript">
				alert("영화 등록 성공!");
				window.location = "hostMovie";
			</script>
		</c:if>
		<c:if test="${cnt!= 1 }">
			<script type="text/javascript">
				alert("영화 등록 실패");
				window.history.back(-2);
			</script>
		</c:if>
	</div>

	<!-- Footer -->
	<%@ include file="movie_footer.jsp"%>
</body>
</html>