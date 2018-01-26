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
     	dateFormat: 'y-mm-dd',
     	minDate: 0
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
							<i class="fa fa-fw fa-table"></i> 예약 취소
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable">
									<thead>
										<tr>
											<th style="text-align: center;"><i class="fa fa-fw fa-table"></i>날짜 선택</th>
											<th style="text-align: center;"><i class="fa fa-fw fa-clock-o"></i>시간 선택</th>
											<th style="text-align: center;"><i class="fa fa-fw fa-user-circle"></i>아이디</th>
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
											<td style="text-align: center;">
												<input class="form-control" type="text" style="display: inline-block; width: 145px; text-align: center;" name="member_id" id="member_id" 
													placeholder="예약 아이디" />
											</td>
										</tr>
										<tr>
											<td colspan="4" style="text-align: center;">
												<input style="background-color: #343a40; color: white; border: 1px solid black; width: 200px; height: 40px;" 
													type="button" value="확인" onclick="reservDel(${sessionScope.memStep})" />
											</td>
										</tr>
									</tbody>
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