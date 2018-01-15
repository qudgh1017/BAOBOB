<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			errorAlert(updateError);
		</script>
	</c:if>	

	<c:if test="${cnt!=0}">
		<script type="text/javascript">
			alert("개인정보 수정에 성공하였습니다.");
			window.location="memMyPageMain";
		</script>
	</c:if>
</body>
</html>