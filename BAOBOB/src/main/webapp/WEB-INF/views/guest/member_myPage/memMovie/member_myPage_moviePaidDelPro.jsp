<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${deleteCnt == 1 }">
		<script type="text/javascript">
			alert("예매를 취소했습니다.");
			window.location="moviePaidList";
		</script>
		
	</c:if>
	
	<c:if test="${deleteCnt != 1 }">
		<script type="text/javascript">
			alert("예매 취소에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>