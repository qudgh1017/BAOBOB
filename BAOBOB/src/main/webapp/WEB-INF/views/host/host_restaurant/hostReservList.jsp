<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
<link rel="stylesheet" href="${restaurant_css}">
<link rel="stylesheet" href="${projectRes}chg/css/reserv_reset.css"> <!-- CSS reset -->
<link rel="stylesheet" href="${projectRes}chg/css/reserv_style.css"> <!-- Resource style -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${restaurant_js}"></script>
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'y-mm-dd'
		});
	});
</script>

<!-- 실시간 예약 현황 조회 -->
<script type="text/javascript">
	function restaurantView(date, startTime, endTime, index) {
		$.ajax({
			url : "restaurantView?date=" + date + "&startTime=" + startTime + "&endTime=" + endTime + "&index=" + index,
			type : 'GET',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(dto) {
				spaceBody(dto.state, dto.table_col, dto.table_row);
			},
			error : function() {
				alert('error');
			}
		})
	}
</script>
<!-- 실시간 예약 현황 조회 -->

<style type="text/css">
	body .p_body {
		min-height: 450px;
	}
	
	body .p_div {
		display: flex;
		justify-content: center;
	} /* flex-wrap:wrap; */
	.m_btn {
		width: 40px;
		height: auto;
		background: lightgray;
		border: transparent;
		border-radius: 0.2em;
		padding: 5px;
		margin: 2px;
	}
	
	.p_img {
		width: 100%;
		height: auto;
	}
		
	#spaceDiv .p_btn {
		max-width: 40px;
		height: fit-content;
		background: lightgray;
		border: transparent;
		border-radius: 0.2em;
		padding: 5px;
		margin: 2px;
	} /* flex:1 0 120px; */
	
	.card-body .form-control {
		margin-top: 5px;
	}
</style>
</head>
<body class="fixed-nav sticky-footer bg-dark" onload="spaceBody('${info}', '${col}', '${row}');" >
	<!-- Navigation -->
	<%@ include file="_navigation.jsp"%>
	
	<div class="content-wrapper">
		<div class="container-fluid" style="width: 1000px;">
			<div class="col-lg-10">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-fw fa-table"></i> 예약 목록
					</div>
					<div class="card-body">
						<div style="text-align: center;">
							<input class="form-control" type="text" style="display: inline-block; width: 165px; text-align: center;" name="date" id="datepicker" 
								class="datepicker" placeholder="달력 보기" value="${date}" />
							<input class="form-control" style="display: inline-block; width: 100px; background-color: #343a40; color: white;" type="button" name="hostReservAddForm"
								onclick="reservView(${sessionScope.memStep});" value="조회" />
						</div>
						<div class="cd-schedule loading">
							<div class="timeline">
								<ul>
									<li><span>11:00</span></li>
									<li><span>11:30</span></li>
									<li><span>12:00</span></li>
									<li><span>12:30</span></li>
									<li><span>13:00</span></li>
									<li><span>13:30</span></li>
									<li><span>14:00</span></li>
									<li><span>14:30</span></li>
									<li><span>15:00</span></li>
									<li><span>15:30</span></li>
									<li><span>16:00</span></li>
									<li><span>16:30</span></li>
									<li><span>17:00</span></li>
									<li><span>17:30</span></li>
									<li><span>18:00</span></li>
									<li><span>18:30</span></li>
									<li><span>19:00</span></li>
									<li><span>19:30</span></li>
									<li><span>20:00</span></li>
								</ul>
							</div>
							
							<!-- .timeline -->
							<div class="events">
								<ul>
									<li class="events-group">
										<div class="top-info" id="selectDay0">
											<span><c:if test="${date == null}">선택날짜</c:if>${date}</span>
										</div>
										<ul>
											<c:forEach var="dto" items="${dtos}" varStatus="status">
												<li class="single-event" 
													data-start="<fmt:formatDate type="both" pattern="HH:mm" value="${dto.schedule_startTime}" />"
													data-end="<fmt:formatDate type="both" pattern="HH:mm" value="${dto.schedule_endTime}" />"
													data-content="" data-event="event-${status.index + 1}">
													<a href="" onclick="restaurantView('${date}', '${dto.schedule_startTime}', '${dto.schedule_endTime}', ${sessionScope.memStep});"><em class="event-name" style="display: none;">예약 정보</em></a>
												</li>
											</c:forEach>
										</ul>
									</li>
								</ul>
								<div class="event-modal">
									<header class="header">
										<div class="content">
											<span class="event-date"></span>
											<h3 class="event-name"></h3>
											<div id="spaceDiv"></div>
										</div>
										<div class="header-bg">
										</div>
									</header>
									
									<div class="body">
										<div class="event-info"></div>
										<div class="body-bg"></div>
									</div>
									<a href="#0" class="close">Close</a>
								</div>
								<div class="cover-layer"></div>
							</div>
							
							<!-- .cd-schedule -->
							<script src="${projectRes}chg/js/modernizr.js"></script>
							<script>
								if (!window.jQuery) {
									document.write('<script src="/baobobs/resources/chg/js/jquery-3.0.0.min.js"><\/script>');
								}
							</script>
							<script src="${projectRes}chg/js/main.js"></script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="_footer.jsp"%>
</body>
</html>