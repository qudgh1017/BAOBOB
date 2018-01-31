<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	<a class="navbar-brand" href="hostMovie">BAOBOX 관리자</a>
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarResponsive"
		aria-controls="navbarResponsive" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="영화 관리">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#movieManage" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-file-movie-o"></i> 
					<span class="nav-link-text">영화 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="movieManage">
					<li><a href="hostMovie">영화 목록</a></li>
					<li><a href="hostMovieAddForm">영화 등록</a></li>
				</ul>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="상영관 관리">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#theaterManage" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-list"></i> 
					<span class="nav-link-text">상영관 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="theaterManage">
					<li><a href="hostTheater">상영관 목록</a></li>
					<li><a href="hostTheaterAddForm">상영관 등록</a></li>
				</ul>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="스케줄 관리">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#scheduleManage" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-clock-o"></i> 
					<span class="nav-link-text">스케줄 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="scheduleManage">
					<li><a href="hostSchedule">스케줄 목록</a></li>
					<li><a href="hostScheduleAddForm">스케줄 등록</a></li>
				</ul>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="예매 관리">
				<a class="nav-link" href="hostMovieRes"> 
					<i class="fa fa-fw fa-table"></i> 
					<span class="nav-link-text">예매 현황</span>
				</a>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="직원 관리">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-user-md"></i> 
					<span class="nav-link-text">직원 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseComponents">
					<li><a href="hostMovieEmp">직원 목록</a></li>
					<li><a href="hostMovieEmpAddForm">직원 고용</a></li>
				</ul>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="결산">
				<a class="nav-link" href="hostMovieSettlement"> 
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
			<li class="nav-item">
				<a class="nav-link" href="mainSignOut">
				 <i class="fa fa-fw fa-sign-out"></i>Logout
				</a>
			</li>
		</ul>
	</div>
</nav>
</body>