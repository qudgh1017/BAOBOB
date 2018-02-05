<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
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
	<a class="navbar-brand" href="hostTMain">종합 관리자</a>
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarResponsive"
		aria-controls="navbarResponsive" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			
			<!-- Charts -->
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
					<i class="fa fa-fw fa-area-chart"></i> 
					<span class="nav-link-text">결산</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseComponents">
					<li><a href="hostTMovie">영화관 결산</a></li>
					<li><a href="hostTRestaurant">식당 결산</a></li>
					<li><a href="hostTParkingChart">주차장 결산</a></li>
				</ul>
			</li>
			
			<!-- Member MGMT -->
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Member MGMT">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
					<i class="fa fa-fw fa-sitemap"></i> 
					<span class="nav-link-text">회원, 직원 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseMulti">
					<li><a href="hostTMemList">회원, 직원 목록</a></li>
					<li><a href="hostTMemAdd">회원, 직원 추가</a></li>
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
		<ul class="navbar-nav ml-auto">
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