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
	
	<c:set var="restaurant1" value="${restaurantChart['1']}"></c:set>
	<c:set var="restaurant2" value="${restaurantChart['2']}"></c:set>
	<c:set var="restaurant3" value="${restaurantChart['3']}"></c:set>

	<!-- Navigation -->
	<%@ include file="common/navigation.jsp" %>
	
	<div class="content-wrapper">
		<div class="container-fluid">
			
			<div class="row">
				<div class="col-lg-6" style="height:400px">
					<div class="card md-3">
						<div class="card-header">영화관 장르별 매출 현황</div>
						<div class="card-body">
							<div id="movieChart" style="width:100%; height:500px;"></div>
						</div>
						<div class="card-footer small text-muted">BAOBOX</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card md-3">
						<div class="card-header">식당별 매출 현황</div>
						<div class="card-body">
							<div id="restaurantChart" style="width:100%; height:500px;"></div>
						</div>
						<div class="card-footer small text-muted">Restaurant</div>
					</div>
				</div>
			</div>
			
			<div class="card mb-3">
				<div class="card-header" id="weekTitle">주차장 매출 현황</div>
				<div class="card-body">
					<!-- <button class="btn btn-primary" id="chartChange" onclick="month();">월별</button> -->
					<div id="parkChart" style="width:100%; height:500px;"></div>
				</div>
				<div class="card-footer small text-muted" id="weekFooter">Parking lot</div>
			</div>
			
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="common/footer.jsp" %>
	
	<script type="text/javascript">
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			drawChartMovie();
			drawChartRestaurant();
			thisYearMonthPay();
		}
		
		/* 영화 챠트 */
		var movieChart_options = {
				/* title : '영화관 결산',  */
				width : 1000, 
				height : 500, 
				bar : {groupWidth : '30%'},
				legend : {position : 'center'},
				/* is3D: true */
				};
				
		function drawChartMovie(){
			var data = google.visualization.arrayToDataTable([
			  ['Element', '장르별'],
              ['janre1', ${janre1}],
		      ['janre2', ${janre2}],
			  ['janre3', ${janre3}],
			  ['janre4', ${janre4}],
			  ['janre5', ${janre5}],
			  ['janre6', ${janre6}],
			  ['janre7', ${janre7}],
			  ['janre8', ${janre8}],
			  ['janre9', ${janre9}],
			  ['janre10', ${janre10}]
			]);
			
			var movieChart = new google.visualization.PieChart(document.getElementById('movieChart'));
			movieChart.draw(data, movieChart_options);
		}
		
		/* 식당 챠트 */
		var restaurantChart_options = {
				/* title : '식당 결산',  */
				width : 1000, 
				height : 500, 
				bar : {groupWidth : '30%'},
				legend : {position : 'bottom'}};
		function drawChartRestaurant(){
			var data = google.visualization.arrayToDataTable([
			  ['Element', '식당별'],
              ['한식당', ${restaurant1}],
		      ['일식당', ${restaurant2}],
			  ['양식당', ${restaurant3}]
			]);
			
			var restaurantChart = new google.visualization.PieChart(document.getElementById('restaurantChart'));
			restaurantChart.draw(data, restaurantChart_options);
		}
		
		/* 주차장 챠트 */
		function thisYearMonthPay() {
			var data = google.visualization.arrayToDataTable([
				['Month', '시간 금액', '실제 계산 금액'],
				['1월', ${P01}, ${U01}],
				['2월', ${P02}, ${U02}],
				['3월', ${P03}, ${U03}],
				['4월', ${P04}, ${U04}],
				['5월', ${P05}, ${U05}],
				['6월', ${P06}, ${U06}],
				['7월', ${P07}, ${U07}],
				['8월', ${P08}, ${U08}],
				['9월', ${P09}, ${U09}],
				['10월', ${P10}, ${U10}],
				['11월', ${P11}, ${U11}],
				['12월', ${P12}, ${U12}]
			]);
			
			var options = {
					isStacked: false,
					vAxis: {minValue: 0}
			}
			
			var chart = new google.visualization.AreaChart(document.getElementById('parkChart'));
			chart.draw(data, options);
		}
	</script>
</body>
</html>