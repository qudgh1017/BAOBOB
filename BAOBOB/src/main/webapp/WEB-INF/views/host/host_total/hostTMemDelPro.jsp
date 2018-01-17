<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 삭제에러 -->
	<c:if test="${deleteCnt != 1}">
	<script type="text/javascript">
		errorAlert(deleteError);		
	</script>
	</c:if>	
	
	<c:if test="${deleteCnt == 1}">
	<script type="text/javascript">
		alert("회원삭제 처리 되었습니다.");
		window.location="hostTMemList";
	</script>
	</c:if>	
</body>
</html>