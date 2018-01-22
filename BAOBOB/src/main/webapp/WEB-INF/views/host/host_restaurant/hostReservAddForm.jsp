<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${restaurant_css}">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${restaurant_js}"></script>
<script type="text/javascript">
$(function() {
	$( "#datepicker" ).datepicker({
     	dateFormat: 'y-mm-dd'
	});
   
	$( "#timepicker" ).timepicker({
	   	step: 30, 
	   	timeFormat: "HH:mm",
	   	minHour: 11,
	   	maxHour: 20,
	   	dynamic: false
   	});
});
</script>
</head>
<body class="fixed-nav sticky-footer bg-dark" onload="spaceBody2('${info}', '${col}', '${row}');">
	<!-- Navigation -->
	<%@ include file="_navigation.jsp" %>
	
	<c:if test="${sessionScope.memStep != 4}">
		<div class="content-wrapper">
			<div class="container-fluid" style="width: 1200px;">
				<div class="col-lg-10">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-fw fa-table"></i> 예약 등록
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable">
									<thead>
										<tr>
											<th style="text-align: center;"><i class="fa fa-fw fa-table"></i>날짜 선택</th>
											<th style="text-align: center;"><i class="fa fa-fw fa-clock-o"></i>시간 선택</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="text-align: center;">
												<input class="form-control" type="text" style="display: inline-block; width: 165px; text-align: center;" name="datepicker" id="datepicker" 
													class="datepicker" placeholder="날짜 선택" value="${date}" />
											</td>
											<td style="text-align: center;">
												<input class="form-control" type="text" style="display: inline-block; width: 165px; text-align: center;" name="timepicker" id="timepicker" 
													class="datepicker" placeholder="시간 선택" value="${time}" />
											</td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;">
												<input style="background-color: #343a40; color: white; border: 1px solid black; width: 200px; height: 40px;" 
														type="button" value="확인" onclick="checkPosRestaurant(${sessionScope.memStep})" />
											</td>
										</tr>
									</tbody>
									<c:if test="${confirm==1}">
										<tr>
											<td colspan="2" style="text-align: center;">
												<div class="container-fluid row">
													<div class="col-lg-9">
														<div class="card mb-3" align="center">
															<div class="card-header"><b>테이블 선택</b></div>
															<div class="card-body p_body">
																<div id="spaceDiv"></div>
															</div>
														</div>
													</div>
													<div class="col-lg-3">
														<div class="card mb-3">
															<div class="card-header"><b>예약</b></div>
															<div class="card-body">
																<input class="form-control" id="widthX" type="number" style="display: none;" min="1" max="100" value="${col}" onload="spaceDivChange();" onchange="spaceDivChange();" required><br>
																<input class="form-control" id="heightY" type="number" style="display: none;" min="1" max="100" value="${row}" onload="spaceDivChange();" onchange="spaceDivChange();" required>
																
																<button class="m_btn" onclick="spaceType('3')"><img class="p_img" src="${restaurant_images}table_use.jpg"></button>
															</div>
															<div class="card-footer small text-muted">
																<button class="btn btn-primary" value="1" onclick="spaceTypeChange2(${sessionScope.memStep});">예약</button>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:if>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.memStep == 4}">
		<script type="text/javascript">
			errorAlert('이용할 수 없는 메뉴입니다.\n식당 관리자 계정으로 로그인해주세요.');
		</script>
	</c:if>
	<!-- Footer -->
	<%@ include file="_footer.jsp" %>
</body>
</html>