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
				alert("상영관 삭제 성공!");
				window.location = "hostTheater";
			</script>
		</c:if>
		<c:if test="${cnt!= 1 }">
			<script type="text/javascript">
				alert("상영관 삭제 실패");
				window.location = "hostTheater";
			</script>
		</c:if>
	</div>

	<!-- Footer -->
	<%@ include file="movie_footer.jsp"%>
</body>
</html>