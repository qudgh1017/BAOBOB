<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>

	<link rel="stylesheet" href="${projectRes}ymk/css/loader.css">
	<style type="text/css">
		body .p_body{min-height:450px;overflow-x:auto;}
		body .p_div{display:flex;width:fit-content;margin:0 auto;}/* flex-wrap:wrap; */
		
		/* icon button */
		.m_btn{width:40px;height:auto;background:lightgray;border:transparent;border-radius:0.2em;padding:5px;margin:2px;}
		.p_img{width:100%;height:auto;}
		
		/* parring space icon button */
		body .p_btn{max-width:40px;height:fit-content;background:lightgray;border:transparent;border-radius:0.2em;padding:5px;margin:2px;} /* flex:1 0 120px; */
		
		/* input */
		.form-control{margin-top:5px;}
		
		/* list */
		.clearfix{clear:both;}
		.itemL{float:left;width:45%;}
		.itemR{float:right;width:45%;}
		#owo{margin-bottom:10px;}
	</style>
</head>
<body class="fixed-nav sticky-footer bg-dark" onload="spaceBody('${pSpace.p_space_info}', '${pSpace.p_space_col}', '${pSpace.p_space_row}');">
<c:if test="${sessionScope.memStep != null && (sessionScope.memStep == 1 || sessionScope.memStep == 7)}">

	<!-- Navigation -->
	<%@ include file="hostParkingNavigation.jsp" %>
	
 	<div class="content-wrapper">
		<div class="container-fluid row">
			<div class="col-lg-9">
				<div class="card mb-3">
					<div class="card-header">주차장 구역 상태</div>
					<div class="card-body p_body" id="spaceDiv">
						<!-- <div id="spaceDiv"></div> -->
					</div>
					<div class="card-footer small text-muted">
						아이콘을 선택하여 주차 구역을 설정해주세요.
						<!-- <button class="btn btn-primary" >등록</button> -->
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card mb-3">
					<button class="btn btn-primary" onclick="spaceTypeChange();">저장</button>
				</div>
				<div class="card mb-3">
					<div class="card-header">주차장 구역 설정</div>
					<div class="card-body">
						<ul>
							<li>
								<ul class="clearfix">
									<li class="itemL">가로</li>
									<li class="itemR">세로</li>
								</ul>
							</li>
							<li>
								<ul class="clearfix">
									<li class="itemL"><input class="form-control" id="widthX" type="number" min="1" max="100" value="${pSpace.p_space_col}" onchange="spaceDivChange();" required></li>
									<li class="itemR"><input class="form-control" id="heightY" type="number" min="1" max="100" value="${pSpace.p_space_row}" onchange="spaceDivChange();" required></li>
								</ul>
							</li>
						</ul>
						
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
				
				<div class="card mb-3">
					<div class="card-header">기본 요금</div>
					<div class="card-body">
						<ul>
							<li>
								<ul class="clearfix">
									<li class="itemL">기본 시간(분)</li>
									<li class="itemR">기본 요금</li>
								</ul>
							</li>
							<li id="owo">
								<ul class="clearfix">
									<li class="itemL"><input class="form-control" name="baseTime" id="baseTime" type="number" min="0" max="1440" value="${pf.p_fee_base_time}" required></li>
									<li class="itemR"><input class="form-control" name="baseFee" id="baseFee" type="number" min="0" max="10000" value="${pf.p_fee_base_price}" required></li>
								</ul>
							</li>
							<li>
								<ul class="clearfix">
									<li class="itemL">초과 시간 (분)</li>
									<li class="itemR">초과 요금</li>
								</ul>
							</li>
							<li>
								<ul class="clearfix">
									<li class="itemL"><input class="form-control" name="excTime" id="excTime" type="number" min="0" max="1440" value="${pf.p_fee_exc_time}" required></li>
									<li class="itemR"><input class="form-control" name="excFee" id="excFee" type="number" min="0" max="10000" value="${pf.p_fee_exc_price}" required></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<div class="card mb-3">
					<div class="card-header">무료 요금</div>
					<div class="card-body">
						영화 1건당 무료 주차 시간(분) <input class="form-control" name="movieTime" id="movieTime" type="number" min="0" max="1440" value="${pf.p_fee_movie_time}" required><br>
						식당 1건당 무료 주차 시간(분) <input class="form-control" name="restTime" id="restTime" type="number" min="0" max="1440" value="${pf.p_fee_rest_time}" required><br>
					</div>
				</div>
				
			</div>
		</div>
	</div> 
	
	<div class="col-md-3 bg" id="myLoader">
	  <div class="loader" id="loader-4">
	    <span></span>
	    <span></span>
	    <span></span>
	  </div>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
	
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script src="${projectRes}ymk/js/parkingSetting.js"></script>
</c:if>
<c:if test="${sessionScope.memStep == null && (sessionScope.memStep != 1 || sessionScope.memStep != 7)}">
	<script src="${projectRes}ymk/js/script.js"></script>
	<script type="text/javascript">
		stepAlert();
	</script>
</c:if>
</body>
</html>