<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer">
	<%@ include file="hostParkingNavigation.jsp" %>

	<div class="content-wrapper" id="result">
		<c:if test="${page == 1}">
			<%@ include file="hostParkingSetting.jsp" %>
		</c:if>
	</div>

	<%@ include file="../common/footer.jsp" %>
	
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script src="${projectRes}ymk/js/script.js"></script>
</body>
</html>