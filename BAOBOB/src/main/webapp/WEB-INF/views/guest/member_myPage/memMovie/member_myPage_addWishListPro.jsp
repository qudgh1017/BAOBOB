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
			if(confirm("위시리스트에 추가하였습니다. \n위시리스트로 이동하시겠습니까?") == true){
				window.location="MovieLog";
			}else{
				
				window.location="movieDetail?movie_index="+${movie_index};
				
			}
		</script>
		
	</c:if>
	
	<c:if test="${cnt != 1 }">
		<script type="text/javascript">
			alert("위시리스트 추가에 실패하였습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>