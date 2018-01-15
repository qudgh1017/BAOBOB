<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			alert("수정되었습니다.");
			window.location="memLost?pageNum=${pageNum}";
		</script>
	</c:if>
	
	<c:if test="${cnt != 1}">
		<script type="text/javascript">
			alert(updateError);
		</script>
	</c:if>
</body>
</html>