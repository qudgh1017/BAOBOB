<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<!-- Bootstrap core CSS-->
<link
	href="${projectRes}adminBootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link
	href="${projectRes}adminBootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="${projectRes}adminBootstrap/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${projectRes}adminBootstrap/css/sb-admin.css"
	rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
		
		<a class="navbar-brand" href="hostParkingMain">주차장 관리자</a>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="setting">
					<a class="nav-link" href="hostParkingSetting"> 
						<i class="fa fa-fw fa-wrench"></i> 
						<span class="nav-link-text">주차장 관리</span>
					</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="state">
					<a class="nav-link" href="hostParkingState"> 
						<i class="fa fa-fw fa-dashboard"></i>
						<span class="nav-link-text">실시간 주차 상태</span>
					</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="grape">
					<a class="nav-link" href="hostParkingChart"> 
						<i class="fa fa-fw fa-area-chart"></i> 
						<span class="nav-link-text">주차 현황</span>
					</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="pay">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion"> 
						<i class="fa fa-fw fa-table"></i> 
						<span class="nav-link-text">납부 관리</span>
					</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents">
						<li><a href="hostParkingPay">납부 내역</a></li>
						<li><a href="hostParkingPayChart">납부 결산</a></li>
					</ul>
				</li>
			</ul>

			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item">
					<a class="nav-link text-center" id="sidenavToggler"> 
						<i class="fa fa-fw fa-angle-left"></i>
					</a>
				</li>
			</ul>
			<c:if test="${sessionScope.memId != null}">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="mainSignOut">
						<i class="fa fa-fw fa-sign-out"></i>Logout
					</a>
				</li>
			</ul>
			</c:if>
		</div>
	</nav>
</body>