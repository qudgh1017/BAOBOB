<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<style type="text/css">
		body .p_body{min-height:450px;}
		body .p_div{display:flex;width:fit-content;margin:0 auto;}/* flex-wrap:wrap; */
		.p_img{width:100%;height:auto;}
		body .p_btn{max-width:40px;height:fit-content;background:lightgray;border:transparent;border-radius:0.2em;padding:5px;margin:2px;} /* flex:1 0 120px; */
	</style>
</head>
<body class="fixed-nav sticky-footer bg-dark" onload="parkingStatus('${col}', '${row}', '${states}');">

	<!-- Navigation -->
	<%@ include file="hostParkingNavigation.jsp" %>
	
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="card mb-3">
				<div class="card-header">실시간 주차 현황</div>
				<div class="card-body p_body" id="spaceDiv"></div>
				<div class="card-footer small text-muted">Update 2018-11-11 10:00</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
	
	<script src="${projectRes}ymk/js/parkingState.js"></script>
</body>
</html>