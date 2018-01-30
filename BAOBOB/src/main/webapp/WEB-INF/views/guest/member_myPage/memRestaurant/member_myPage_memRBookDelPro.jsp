<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${cnt == 1 }">
		<script type="text/javascript">
			alert("예약이 취소되었습니다.");
			window.location="memRBookList";
		</script>
		
	</c:if>
	
	<c:if test="${cnt != 1 }">
		<script type="text/javascript">
			alert("예약취소에 실패하였습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>