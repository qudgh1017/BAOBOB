<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 아이디와 비밀번호가 일치 -->
	<c:if test="${selectCnt==1}">
		
		<!-- 삭제에러 -->
		<c:if test="${deleteCnt==0}">
		<script type="text/javascript">
			errorAlert(deleteError);		
		</script>
		</c:if>	

		<!-- 삭제 성공 - 세션 삭제 -->
		<c:if test="${deleteCnt!=0}">	
			<% 
			//세션 삭제
			request.getSession().invalidate();
			%>
			<!-- 1초후에 alert창 띄우고 main.do로 이동 -->
			<script type="text/javascript">
				setTimeout(function(){
					alert("회원탈퇴 처리 되었습니다.");
					window.location="mainIndex";}, 500);
			</script>
		</c:if>			

	</c:if>
	
	<!-- 비밀번호 불일치 -->
	<c:if test="${selectCnt!=1}">
		<script type="text/javascript">
		errorAlert(pwdErorr);
		</script>
	</c:if>	
</body>
</html>