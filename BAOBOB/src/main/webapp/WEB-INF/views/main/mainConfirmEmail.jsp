<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert("인증 실패");
		window.location='mainIndex';
	</script>
</c:if>

<c:if test="${cnt != 0}">
	<script type="text/javascript">
		alert("인증 완료");
		window.location='mainIndex';
	</script>
</c:if>
