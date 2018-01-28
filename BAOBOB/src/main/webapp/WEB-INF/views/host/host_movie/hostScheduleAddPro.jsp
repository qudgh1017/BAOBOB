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
	<%@ include file="movie_navigation.jsp" %>
	
	<div class="content-wrapper">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<c:if test="${cnt== 1 }">
		<script type="text/javascript">
			alert("스케줄이 등록되었습니다.");
			window.location="hostScheduleAddForm";
		</script>
	</c:if>
	<c:if test="${cnt!= 1 }">
		<script type="text/javascript">
			alert("스케줄 등록에 실패했습니다. 다시 시도해주세요.");
			window.location="hostScheduleAddForm";
		</script>
	</c:if>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</div>
	
	<!-- Footer -->
	<%@ include file="movie_footer.jsp" %>
</body>
</html>