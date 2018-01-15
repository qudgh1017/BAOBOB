<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 비밀번호가 일치하지 않는 경우 : '삭제 에러' 메시지 출력 -->
	<c:if test="${selectCnt == 0 }">
		<script type="text/javascript">
			errorAlert(pwdError);
		</script>
	</c:if>
	
	<!-- 비밀번호가 일치하는 경우 -->
	<c:if test="${selectCnt != 0 }">
	
		<!-- 1. 답글이 있는경우 '답글이 있으므로 삭제 불가능합니다.' -->
		<c:if test="${deleteCnt == -1 }">
			<script type="text/javascript">
				alert("답글이 있으므로 삭제 불가능합니다.");
				window.location="memLost?pageNum=${pageNum}";
			</script>
		</c:if>		
	
		<!-- 2. 답글이 없경우 삭제 실패인 경우 '삭제 실패' -->
		<c:if test="${deleteCnt == 0 }">
			<script type="text/javascript">
				alert("글 삭제에 실패했습니다. \n확인 후 다시 시도하세요.");
				window.location="memLost?pageNum=${pageNum}";
			</script>		
		</c:if>
		
		<!-- 3. 답글이 없는 경우 삭제 성공인 경우 : '삭제성공' -->
		<c:if test="${deleteCnt == 1 }">
			<script type="text/javascript">
				alert("글 삭제에 성공했습니다.");
				window.location="memLost?pageNum=${pageNum}";
			</script>		
		</c:if>
		
	</c:if>
</body>
</html>