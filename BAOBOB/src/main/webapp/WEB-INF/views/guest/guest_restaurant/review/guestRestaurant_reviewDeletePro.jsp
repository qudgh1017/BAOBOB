<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/resources/setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><center>리뷰 삭제</center></h2>
	<!-- 비밀번호가 다른경우 : '삭제 에러' 메시지 -->
	<c:if test="${selectCnt==0}">
		<script type="text/javascript">
			alert('아이디가 존재하지 않습니다');
		</script>
	</c:if>
	<c:if test="${selectCnt==-1}">
		<script type="text/javascript">
			alert('비밀번호가 일치하지 않습니다');
		</script>
	</c:if>
	<!-- 비밀번호가 일치하는 경우 -->
	<c:if test="${selectCnt!=0}">
		<!-- 1. 삭제 실패인 경우 : '삭제 실패' 메시지 -->
		<c:if test="${deleteCnt==0}">
			<script type="text/javascript">
				alert('글 삭제에 실패했습니다. \n 확인 후 다시시도하세요!!');
				window.location="guestRestaurant_review?pageNum=${pageNum}&restaurant_index=${restaurant_index}";
			</script>
		</c:if>
		<!-- 2. 답글이 없는경우 삭제 성공인 경우 : '삭제 성공' 메시지 -->
		<c:if test="${deleteCnt==1}">
			<script type="text/javascript">
				alert('글 삭제 성공!!');
				window.location="guestRestaurant_review?pageNum=${pageNum}&restaurant_index=${restaurant_index}";
			</script>
		</c:if>
	</c:if>

</body>
</html>