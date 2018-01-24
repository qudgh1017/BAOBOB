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
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="직원 관리">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion"> 
					<i class="fa fa-fw fa-user-md"></i> 
					<span class="nav-link-text">직원 관리</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseComponents">
					<li><a href="hostMovieEmp">직원 목록</a></li>
					<li><a href="hostMovieEmpAddForm">직원 채용</a></li>
				</ul>
			</li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="예매 관리">
				<a class="nav-link" href="hostMovieRes"> 
					<i class="fa fa-fw fa-table"></i> 
					<span class="nav-link-text">예매 관리</span>
				</a>
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
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
					<i class="fa fa-fw fa-envelope"> </i> 
					<span class="d-lg-none">
						Messages 
						<span class="badge badge-pill badge-primary">12 New</span>
					</span> 
					<span class="indicator text-primary d-none d-lg-block"> 
						<i class="fa fa-fw fa-circle"></i>
					</span>
				</a>
				<div class="dropdown-menu" aria-labelledby="messagesDropdown">
					<h6 class="dropdown-header">New Messages:</h6>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#"> 
						<strong>David Miller</strong> 
						<span class="small float-right text-muted">11:21 AM</span>
						<div class="dropdown-message small">Hey there! This new
							version of SB Admin is pretty awesome! These messages clip off
							when they reach the end of the box so they don't overflow over
							to the sides!
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#"> 
						<strong>Jane Smith</strong>
						<span class="small float-right text-muted">11:21 AM</span>
						<div class="dropdown-message small">
							I was wondering if you
							could meet for an appointment at 3:00 instead of 4:00. Thanks!
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#"> 
						<strong>John Doe</strong> 
						<span class="small float-right text-muted">11:21 AM</span>
						<div class="dropdown-message small">
							I've sent the final
							files over to you for review. When you're able to sign off of
							them let me know and we can discuss distribution.
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item small" href="#">View all messages</a>
				</div></li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
					<i class="fa fa-fw fa-bell"></i> 
					<span class="d-lg-none">
						Alerts 
						<span class="badge badge-pill badge-warning">6 New</span>
					</span> 
					<span class="indicator text-warning d-none d-lg-block"> 
						<i class="fa fa-fw fa-circle"></i>
					</span>
				</a>
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
						<div class="dropdown-message small">
							This is an automated
							server response message. All systems are online.
						</div>
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
						<div class="dropdown-message small">
							This is an automated server response message. All systems are online.
						</div>
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
						<div class="dropdown-message small">
							This is an automated
							server response message. All systems are online.
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item small" href="#">View all alerts</a>
				</div></li>
			<li class="nav-item">
				<form class="form-inline my-2 my-lg-0 mr-lg-2">
					<div class="input-group">
						<input class="form-control" type="text" placeholder="Search for..."> 
							<span class="input-group-btn">
							<button class="btn btn-primary" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
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