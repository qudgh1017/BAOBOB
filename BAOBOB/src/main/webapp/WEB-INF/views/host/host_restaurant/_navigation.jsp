<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<!-- Bootstrap core CSS-->
	<link href="${projectRes}adminBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom fonts for this template-->
	<link href="${projectRes}adminBootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<!-- Page level plugin CSS-->
	<link href="${projectRes}adminBootstrap/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="${projectRes}adminBootstrap/css/sb-admin.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	
	<a class="navbar-brand" href="#">
		<c:if test="${sessionScope.memStep == 4}">
			BAOBOB - 식당 관리
		</c:if>
		<c:if test="${sessionScope.memStep == 51 || sessionScope.memStep == 61}">
			도키도키 (ときどき) 관리
		</c:if>
		<c:if test="${sessionScope.memStep == 52 || sessionScope.memStep == 62}">
			바오밥 관리
		</c:if>
		<c:if test="${sessionScope.memStep == 53 || sessionScope.memStep == 63}">
			BOUTBACK steakhouse 관리
		</c:if>
	</a>
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarResponsive"
		aria-controls="navbarResponsive" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<li class="nav-item" data-toggle="tooltip" data-placement="right">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-wrench"></i>
					<span class="nav-link-text">총 관리자 메뉴</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseComponents">
					<li><a href="hostRestaurantList">매장 목록</a></li>
					<li><a href="hostRestaurantAddForm">매장 추가</a></li>
					<li><a href="hostAllMenuList">매장별 메뉴 보기</a></li>
					<li><a href="hostAllEmployeeList">매장별 직원 보기</a></li>
					<li><a href="hostAllAccountChart">결산</a></li>
				</ul>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents2" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-table"></i>
					<span class="nav-link-text">예약 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseComponents2">
					<li><a href="hostReservList">예약 및 주문 현황</a></li>
					<li><a href="hostReservAddForm">예약 추가</a></li>
				</ul>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-dashboard"></i> 
					<span class="nav-link-text">메뉴 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseExamplePages">
					<li><a href="hostMenuList">메뉴 목록</a></li>
					<li><a href="hostMenuAddForm">메뉴 추가</a></li>
				</ul>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-sitemap"></i> 
					<span class="nav-link-text">직원 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseMulti">
					<li><a href="hostEmployeeList">직원 목록</a></li>
					<li><a href="hostMemberList">직원 추가</a></li>
				</ul>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right">
				<a class="nav-link" href="hostRestaurantAccount">
					<i class="fa fa-fw fa-area-chart"></i> 
					<span class="nav-link-text">결산</span>
				</a>
			</li>
		</ul>
		<ul class="navbar-nav sidenav-toggler">
			<li class="nav-item">
				<a class="nav-link text-center" id="sidenavToggler"> 
					<i class="fa fa-fw fa-angle-left"></i>
				</a>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item dropdown">
				<div class="dropdown-menu" aria-labelledby="messagesDropdown">
					<h6 class="dropdown-header">New Messages:</h6>
					<div class="dropdown-divider"></div>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item small" href="#">View all messages</a>
				</div></li>
			<li class="nav-item dropdown">
				<div class="dropdown-menu" aria-labelledby="alertsDropdown">
					<h6 class="dropdown-header">New Alerts:</h6>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#"> 
						<span class="text-success">
							<strong> 
								<i class="fa fa-long-arrow-up fa-fw"></i>
								Status Update
							</strong>
						</span> 
						<span class="small float-right text-muted">11:21 AM</span>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#"> 
						<span class="text-danger">
							<strong> 
								<i class="fa fa-long-arrow-down fa-fw"></i>
								Status Update
							</strong>
						</span> 
						<span class="small float-right text-muted">11:21 AM</span>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#"> 
						<span class="text-success">
							<strong> 
								<i class="fa fa-long-arrow-up fa-fw"></i>
								Status Update
							</strong>
						</span> 
						<span class="small float-right text-muted">11:21 AM</span>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item small" href="#">View all alerts</a>
				</div>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="mainIndex">
					BAOBOB
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="mainSignOut">
					<i class="fa fa-fw fa-sign-out"></i>Logout
				</a>
			</li>
		</ul>
	</div>
</nav>
</body>