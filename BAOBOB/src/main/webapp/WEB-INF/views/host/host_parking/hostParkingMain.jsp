<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>주차장 관리자</title>
	
	<style type="text/css">
		.card-body{text-align:right;}
	</style>
</head>
<body class="fixed-nav sticky-footer">
	<%@ include file="hostParkingNavigation.jsp" %>

	<div class="content-wrapper">
		<div class="container-fluid">
			
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden">
						<div class="card-header">현재 이용자수</div>
						<div class="card-body">
							${notOut} 명
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-warning o-hidden">
						<div class="card-header">평균 주차 시간</div>
						<div class="card-body">
							${hour}시간  ${minute}분
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden">
						<div class="card-header">오늘 영화 이용자수</div>
						<div class="card-body">
							${movie} 명
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-danger o-hidden">
						<div class="card-header">오늘 식당 이용자수</div>
						<div class="card-body">
							${rest} 명
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script src="${projectRes}ymk/js/script.js"></script>
</body>
</html>