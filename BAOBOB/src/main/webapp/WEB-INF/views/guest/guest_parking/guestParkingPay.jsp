<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		.mar{margin:19rem auto;padding:0;}
		#pay{font-size:75px;margin:0 auto;display:block;width:fit-content;margin-top:15%;}
	</style>
</head>
<body>
<c:if test="${ph != null && ph.p_history_out == null}">
	<%@ include file="../common/head.jsp" %>

	<%@ include file="guestParkingHeader.jsp" %>
	
	<section>
	  <div class="container mar">
	  	<form action="guestParkingPayPro" id="inform">
	  		<input type="hidden" name="key" value="${key}">
	  		<button class="btn btn-block input">결제</button>
	  	</form>
	  </div>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../common/footerCopyright.jsp" %>
</c:if>
<c:if test="${ph != null && ph.p_history_out != null}">
	<script type="text/javascript">
		alert("이미 출차한 차량입니다.");
		history.back();
	</script>
</c:if>
<c:if test="${ph == null}">
	<script type="text/javascript">
		alert("존재하지 않는 번호입니다.");
		history.back();
	</script>
</c:if>
</body>
</html>