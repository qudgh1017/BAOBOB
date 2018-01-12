<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 글쓰기 성공 -->
	<c:if test="${cnt == 1 }">
		<script type="text/javascript">
			alert("글쓰기에 성공하였습니다.");
			window.location="memQuestion";
		</script>
		
	</c:if>
	
	<!-- 글쓰기 실패 -->
	<c:if test="${cnt != 1 }">
		<script type="text/javascript">
			errorAlert(insertError);
		</script>
	</c:if>
</body>
</html>