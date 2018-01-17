<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		.card-body{overflow-x:hidden;}
		.md-3{margin-bottom:15px;}
	</style>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="hostParkingNavigation.jsp" %>
	
	<div class="content-wrapper">
		<div class="container-fluid">
			
			<div class="row">
				<div class="col-lg-4">
					<div class="card md-3">
						<div class="card-header">시간대별 입차수</div>
						<div class="card-body">
							<div id="dayInChart" style="width:100%; height:240px;"></div>
						</div>
						<div class="card-footer small text-muted">시간대별 입차 비율</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="card md-3">
						<div class="card-header">시간대별 출차수</div>
						<div class="card-body">
							<div id="dayOutChart" style="width:100%; height:240px;"></div>
						</div>
						<div class="card-footer small text-muted">시간대별 출차 비율</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="card md-3">
						<div class="card-header">성 비율</div>
						<div class="card-body">
							<div id="sexRatioChart" style="width:100%; height:240px;"></div>
						</div>
						<div class="card-footer small text-muted">이용자 성 비율</div>
					</div>
				</div>
			</div>
			
			<div class="card mb-3">
				<div class="card-header" id="weekTitle">올해 요일별 입/출차수</div>
				<div class="card-body">
					<button class="btn btn-primary" id="chartChange" onclick="month();">월별</button>
					<div id="weekChart" style="width:100%; height:500px;"></div>
				</div>
				<div class="card-footer small text-muted" id="weekFooter">올해 요일별 입차, 출차 현황</div>
			</div>
			
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
	
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script src="${projectRes}ymk/js/parkingCart.js"></script>
	<script src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			chartDayInTimeAvg();
			chartDayOutTimeAvg();
			sexRatioChart();
			weekChart();
		}

		function chartDayInTimeAvg() {
			var data = google.visualization.arrayToDataTable([
				['Hour', '이용자수'],
				['9시', ${HI9}],
				['10시', ${HI10}],
				['11시', ${HI11}],
				['12시', ${HI12}],
				['13시', ${HI13}],
				['14시', ${HI14}],
				['15시', ${HI15}],
				['16시', ${HI16}],
				['17시', ${HI17}],
				['18시', ${HI18}],
				['19시', ${HI19}],
				['20시', ${HI20}],
				['21시', ${HI21}]
			]);
			
			var options = {
			}
			
			var chart = new google.visualization.PieChart(document.getElementById('dayInChart'));
			chart.draw(data, options);
		}
		
		function chartDayOutTimeAvg() {
			var data = google.visualization.arrayToDataTable([
				['Hour', '이용자수'],
				['9시', ${HO9}],
				['10시', ${HO10}],
				['11시', ${HO11}],
				['12시', ${HO12}],
				['13시', ${HO13}],
				['14시', ${HO14}],
				['15시', ${HO15}],
				['16시', ${HO16}],
				['17시', ${HO17}],
				['18시', ${HO18}],
				['19시', ${HO19}],
				['20시', ${HO20}],
				['21시', ${HO21}]
			]);
			
			var options = {
			}
			
			var chart = new google.visualization.PieChart(document.getElementById('dayOutChart'));
			chart.draw(data, options);
		}
		
		function sexRatioChart() {
			var data = google.visualization.arrayToDataTable([
				['성별', '이용자수'],
				['알 수 없음', ${sex0}],
				['여', ${sex1}],
				['남', ${sex2}]
			]);
			
			var options = {}
			
			var chart = new google.visualization.PieChart(document.getElementById('sexRatioChart'));
			chart.draw(data, options);
		}
		
		function weekChart() {
			var data = google.visualization.arrayToDataTable([
				['요일', '입차', '출차'],
				['월요일', ${I2}, ${O2}],
				['화요일', ${I3}, ${O3}],
				['수요일', ${I4}, ${O4}],
				['목요일', ${I5}, ${O5}],
				['금요일', ${I6}, ${O6}],
				['토요일', ${I7}, ${O7}],
				['일요일', ${I1}, ${O1}]
			]);
			
			var options = {
				 isStacked: false,
			     vAxis: {minValue: 0}
			};
			
			var chart = new google.visualization.AreaChart(document.getElementById('weekChart'));
			chart.draw(data, options);
		}
		
		function week() {
			google.charts.load('current', {'packages':['corechart']});
		    google.charts.setOnLoadCallback(weekChart);

		    var btn = document.getElementById('chartChange');
	    	btn.innerHTML='월별';
	    	btn.setAttribute('onclick', 'month();');
	    	document.getElementById('weekTitle').innerHTML = '올해 요일별 입/출차수';
	    	document.getElementById('weekFooter').innerHTML = '올해 요일별 입차, 출차 현황';
		}
	</script>
</body>
</html>