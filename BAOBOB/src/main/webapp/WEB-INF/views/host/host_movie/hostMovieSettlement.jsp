<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<c:set var="janre1" value="${movieChart['1']}"></c:set>
	<c:set var="janre2" value="${movieChart['2']}"></c:set>
	<c:set var="janre3" value="${movieChart['3']}"></c:set>
	<c:set var="janre4" value="${movieChart['4']}"></c:set>
	<c:set var="janre5" value="${movieChart['5']}"></c:set>
	<c:set var="janre6" value="${movieChart['6']}"></c:set>
	<c:set var="janre7" value="${movieChart['7']}"></c:set>
	<c:set var="janre8" value="${movieChart['8']}"></c:set>
	<c:set var="janre9" value="${movieChart['9']}"></c:set>
	<c:set var="janre10" value="${movieChart['10']}"></c:set>
	
	<c:set var="janre11" value="${movieJanreCountChart['1']}"></c:set>
	<c:set var="janre12" value="${movieJanreCountChart['2']}"></c:set> 
	<c:set var="janre13" value="${movieJanreCountChart['3']}"></c:set>
	<c:set var="janre14" value="${movieJanreCountChart['4']}"></c:set> 
	<c:set var="janre15" value="${movieJanreCountChart['5']}"></c:set>
	<c:set var="janre16" value="${movieJanreCountChart['6']}"></c:set> 
	<c:set var="janre17" value="${movieJanreCountChart['7']}"></c:set>
	<c:set var="janre18" value="${movieJanreCountChart['8']}"></c:set> 
	<c:set var="janre19" value="${movieJanreCountChart['9']}"></c:set>
	<c:set var="janre20" value="${movieJanreCountChart['10']}"></c:set> 
	
	<!-- 제한 연령별 매출 -->
	<c:set var="age1" value="${movieAgeChart['0']}"></c:set>
	<c:set var="age2" value="${movieAgeChart['12']}"></c:set>
	<c:set var="age3" value="${movieAgeChart['15']}"></c:set>
	<c:set var="age4" value="${movieAgeChart['19']}"></c:set>
	
	<!-- 관람객 성별 매출 -->
	<c:set var="sex1" value="${movieSexCountChart['남']}"></c:set>
	<c:set var="sex2" value="${movieSexCountChart['여']}"></c:set>
	
	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp" %>
		
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header"><i class="fa fa-table">관람객 장르별 비율</i></div>
						<div class="card-body">
							<div style="display: -webkit-box;" align="center">
								<div id="movieJanreCountChart" style="width:100%; height:500px;"></div>
							</div>
							영화관 총 매출액 : ${movieSale}원
						</div>
						<div class="card-footer small text-muted">BAOBOX</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header"><i class="fa fa-table">장르별 결산</i></div>
						<div class="card-body" >
							<div style="display: -webkit-box;" align="center">
								<div id="movieJanreChart" style="width:100%; height:500px;"></div>
							</div>
							영화관 총 매출액 : ${movieSale}원
						</div>
						<div class="card-footer small text-muted">BAOBOX</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header"><i class="fa fa-table">관람객 성별 매출</i></div>
						<div class="card-body">
							<div style="display: -webkit-box;" align="center">
								<div id="movieSexCountChart" style="width:100%; height:500px;"></div>
							</div>
							영화관 총 매출액 : ${movieSale}원
						</div>
						<div class="card-footer small text-muted">BAOBOX</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header"><i class="fa fa-table">제한연령별 결산</i></div>
						<div class="card-body" >
							<div style="display: -webkit-box;" align="center">
								<div id="movieAgeChart" style="width:100%; height:500px;"></div>
							</div>
							영화관 총 매출액 : ${movieSale}원
						</div>
						<div class="card-footer small text-muted">BAOBOX</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
		
	<!-- Footer -->
	<script src="${projectRes}adminBootstrap/vendor/jquery/jquery.min.js"></script>
	<%@ include file="movie_footer.jsp" %>	
			
	<script type="text/javascript">
		// 로딩 완료시 함수 실행하여 차트 생성
		google.charts.setOnLoadCallback(drawChartFirst);
		var firstChart_options = {
				title : '장르별 매출', 
				width : 500, 
				height : 400, 
				bar : {groupWidth : '50%'},
				legend : {position : 'bottom'}};
		function drawChartFirst(){
			var data = google.visualization.arrayToDataTable([['Element', '장르'],
														 ['가족', ${janre1}],
														 ['공포/호러', ${janre2}],
														 ['드라마', ${janre3}],
														 ['SF', ${janre4}],
														 ['멜로/로맨스', ${janre5}],
														 ['코미디', ${janre6}],
														 ['애니메이션', ${janre7}],
														 ['액션', ${janre8}],
														 ['스릴러', ${janre9}],
														 ['미스터리', ${janre10}],
														 ]);
		
			var firstChart = new google.visualization.ColumnChart(document.getElementById('movieJanreChart'));
			firstChart.draw(data, firstChart_options);
		}
		
		
		
		google.charts.setOnLoadCallback(movieJanreCountChart);
		var movieJanreCountChart_options = {
				pieHole: 0.3,
				title : '장르별 관람객 수', 
				width : 500, 
				height : 400, 
				bar : {groupWidth : '30%'},
				legend : {position : 'bottom'}};
		function movieJanreCountChart(){
			var data = google.visualization.arrayToDataTable([
														 ['Element', '장르'],
														 ['가족', ${janre11}],
														 ['공포/호러', ${janre12}],
														 ['드라마', ${janre13}],
														 ['SF', ${janre14}],
														 ['멜로/로맨스', ${janre15}],
														 ['코미디', ${janre16}],
														 ['애니메이션', ${janre17}],
														 ['액션', ${janre18}],
														 ['스릴러', ${janre19}],
														 ['미스터리', ${janre20}]
														 ]);
		
			var movieJanreCountChart = new google.visualization.PieChart(document.getElementById('movieJanreCountChart'));
			movieJanreCountChart.draw(data, movieJanreCountChart_options);
		}
		
		
		
		google.charts.setOnLoadCallback(movieAgeChart);
		var movieAgeChart_options = {
				title : '제한연령별 매출', 
				width : 500, 
				height : 400, 
				bar : {groupWidth : '30%'},
				legend : {position : 'bottom'}};
		function movieAgeChart(){
			var data = google.visualization.arrayToDataTable([
															 ['Element', '제한연령'],
															 ['전체', ${age1}],
															 ['만12세', ${age2}],
															 ['만15세', ${age3}],
															 ['만19세', ${age4}]
															 ]);
		
			var movieAgeChart = new google.visualization.ColumnChart(document.getElementById('movieAgeChart'));
			movieAgeChart.draw(data, movieAgeChart_options);
		}
		
		
		movieSexCountChart
		google.charts.setOnLoadCallback(movieSexCountChart);
		var movieSexCountChart_options = {
				title : '관람객 성별 매출', 
				width : 500, 
				height : 400, 
				bar : {groupWidth : '30%'},
				legend : {position : 'bottom'}};
		function movieSexCountChart(){
			var data = google.visualization.arrayToDataTable([
														 ['Element', '성별'],
														 ['남자', ${sex1}],
														 ['여자', ${sex2}]
														 ]);
			
			var movieSexCountChart = new google.visualization.PieChart(document.getElementById('movieSexCountChart'));
			movieSexCountChart.draw(data, movieSexCountChart_options);
		}
	</script>
	

</body>
</html>