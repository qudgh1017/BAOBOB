<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/resources/setting.jsp"%>
<body>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<!-- 내꺼 JavaScript 참조 -->
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>

<!-- 글 작성시 -->
<c:if test="${pro==1}">
	<!-- 성공 -->
	<c:if test="${cnt==1}">  
		<script type="text/javascript">
			subAlert(review_insert);
		</script>
	</c:if>
	
	<!-- 실패 -->
	<c:if test="${cnt==0}">  
		<script type="text/javascript">
			subAlert(review_insert_error);
		</script>
	</c:if>
</c:if>

<!-- 글 수정시 -->
<c:if test="${pro==2}">
	<!-- 성공 -->
	<c:if test="${cnt==1}">  
		<script type="text/javascript">
			subAlert(review_modify);
		</script>
	</c:if>
	
	<!-- 실패 -->
	<c:if test="${cnt==0}">  
		<script type="text/javascript">
			subAlert(review_modify_error);
		</script>
	</c:if>
</c:if>

<!-- 글 삭제시 -->
<c:if test="${pro==3}">
	<!-- 성공 -->
	<c:if test="${cnt==1}">  
		<script type="text/javascript">
			subAlert(review_delete);
		</script>
	</c:if>
	
	<!-- 실패 -->
	<c:if test="${cnt==0}">  
		<script type="text/javascript">
			subAlert(review_delete_error);
		</script>
	</c:if>
</c:if>	
</body>
</html>