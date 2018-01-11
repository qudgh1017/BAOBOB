<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		body .p_body{min-height:450px;}
		body .p_div{display:flex;}/* flex-wrap:wrap; */
		.m_btn{width:40px;height:auto;background:lightgray;border:transparent;border-radius:0.2em;padding:5px;margin:2px;}
		.p_img{width:100%;height:auto;}
		body .p_btn{max-width:40px;height:fit-content;background:lightgray;border:transparent;border-radius:0.2em;padding:5px;margin:2px;} /* flex:1 0 120px; */
		.form-control{margin-top:5px;}
	</style>
	
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script src="${projectRes}ymk/js/parkingSetting.js"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark" onload="spaceBody('${pSpace.p_space_info}', '${pSpace.p_space_col}', '${pSpace.p_space_row}');">

	<!-- Navigation -->
	<%@ include file="hostParkingNavigation.jsp" %>
	
 	<div class="content-wrapper">
		<div class="container-fluid row">
			<div class="col-lg-10">
				<div class="card mb-3">
					<div class="card-header">주차장 구역 상태</div>
					<div class="card-body p_body" id="spaceDiv">
						<!-- <div id="spaceDiv"></div> -->
					</div>
					<div class="card-footer small text-muted">
						<button class="btn btn-primary" value="1" onclick="spaceTypeChange();">등록</button>
					</div>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="card mb-3">
					<div class="card-header">기본 요금 설정</div>
					<div class="card-body">
						기본 시간(분)  <input class="form-control" name="baseTime" id="baseTime" type="number" min="0" max="1440" value="${pf.p_fee_base_time}"><br>
						기본 요금  <input class="form-control" name="baseFee" id="baseFee" type="number" min="0" max="10000" value="${pf.p_fee_base_price}"><br>
						초과 시간 (분) <input class="form-control" name="excTime" id="excTime" type="number" min="0" max="1440" value="${pf.p_fee_exc_time}"><br>
						초과 요금  <input class="form-control" name="excFee" id="excFee" type="number" min="0" max="10000" value="${pf.p_fee_exc_price}"><br>
					</div>
				</div>
				
				<div class="card mb-3">
					<div class="card-header">주차장 구역 설정</div>
					<div class="card-body">
						가로  <input class="form-control" id="widthX" type="number" min="1" max="100" value="${pSpace.p_space_col}" onchange="spaceDivChange();"><br>
						세로  <input class="form-control" id="heightY" type="number" min="1" max="100" value="${pSpace.p_space_row}" onchange="spaceDivChange();">
						
						<hr>
						
						<button class="m_btn" onclick="spaceType('4')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_default.png"></button>
						<button class="m_btn" onclick="spaceType('3')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_desabled.png"></button>
						<button class="m_btn" onclick="spaceType('2')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_pregnant_woman.png"></button>
						<button class="m_btn" onclick="spaceType('1')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_electic_car.png"></button>
						<button class="m_btn" onclick="spaceType('0')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_tmp.png"></button>
						<br>
						<button class="m_btn" onclick="spaceType('9')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_enter.png"></button>
						<button class="m_btn" onclick="spaceType('8')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_exit.png"></button>
					</div>
				</div>
			</div>
		</div>
	</div> 
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>