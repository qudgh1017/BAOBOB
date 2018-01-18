<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/resources/mhj/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>레스토랑 예약</title>
<!--===== 부트스트랩 없어도 되는거 같음 =====-->
<!-- Bootstrap core CSS-->
<link href="${projectRes}adminBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="${projectRes}adminBootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="${projectRes}adminBootstrap/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${projectRes}adminBootstrap/css/sb-admin.css" rel="stylesheet">
<!--===== 부트스트랩 없어도 되는거 같음 =====-->
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

<body class="bg-dark" onload="spaceBody('${info}', '${col}', '${row}');">
	<div class="container-fluid">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">
				<i class="fa fa-fw fa-home"></i>
				레스토랑 이름
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<i class="fa fa-fw fa-user-circle"></i>
							<label for="exampleInputEmail1">테이블 수</label> 
							<input class="form-control" name="table" type="text" placeholder="table">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<i class="fa fa-fw fa-table"></i>
							<label for="exampleInputPassword1">날짜</label> 
							<input class="form-control" type="text" style="display: inline-block; text-align: center;" 
									name="datepicker" id="datepicker" class="datepicker" placeholder="날짜 선택" value="${date}" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<i class="fa fa-fw fa-clock-o"></i>
							<label for="exampleInputPassword1">시간</label> 
							<input class="form-control" type="text" style="display: inline-block;  text-align: center;" 
									name="timepicker" id="timepicker" class="datepicker" placeholder="시간 선택" value="${time}" />
						</div>
					</div>
				</div>
				<input class="btn btn-primary btn-block" style="background-color: #343a40; color: white;"
						type="button" value="확인" onclick="guestReserv_chkTable();"/>
				
				<div class="container-fluid" style="margin-top: 15px; padding-left:0px; padding-right:0px;" >
					<!-- 테이블/날짜/시간선택 -> 확인 없으면 -->
					<c:if test="${confirm!=1}">
						<button class="btn btn-primary btn-block" type="reset" onclick="window.history.back();">취소</button>
					</c:if>
				
					<!-- 확인을 누르면 -->
					<c:if test="${confirm==1}">
						<div class="col-lg-12" style="padding-left:0px; padding-right:0px;">
							<div class="card mb-3" align="center">
								<div class="card-header"><b>테이블 선택</b></div>
								<div class="card-body p_body" style="min-height:260px;">
									<div id="spaceDiv"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-12" style="padding-left:0px; padding-right:0px;">
							<div class="card mb-3" align="center">
								<div class="card-header">매장 설정</div>
								<div class="card-body">
									<input class="form-control" id="widthX" type="number" style="display: none;" min="1" max="100" value="${col}" onload="spaceDivChange();" onchange="spaceDivChange();" required>
									<input class="form-control" id="heightY" type="number" style="display: none;" min="1" max="100" value="${row}" onload="spaceDivChange();" onchange="spaceDivChange();" required>
									
									<button class="m_btn" onclick="spaceType('3')"><img class="p_img" src="${restaurant_images}table_use.jpg"></button>
									
								</div>
								<div class="card-footer small text-muted">
									<button class="btn btn-primary btn-block" type="button" value="1" onclick="spaceTypeChange2('1');">예약 접수</button>
									<button class="btn btn-primary btn-block" type="reset" onclick="window.history.go(-2);">취소</button>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
