<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>납부 현황</title>
	
	<style>
		.rg{text-align:right;}
	</style>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<%@ include file="hostParkingNavigation.jsp" %>
	
	<div class="content-wrapper">
		<div class="container-fluid">
		
			<div class="row">
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden">
						<div class="card-header">
							<jsp:useBean id="toDay" class="java.util.Date"/>
							<fmt:formatDate var="year" value="${toDay}" pattern="yyyy"/>
							${year}년도 수익
						</div>
						<div class="card-body rg">
							<fmt:formatNumber value="${yearPrice}" type="number"/> 원
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card text-white bg-danger o-hidden">
						<div class="card-header">누적 수익</div>
						<div class="card-body rg">
							<fmt:formatNumber value="${totalPrice}" type="number"/> 원
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden">
						<div class="card-header">전년도 수익</div>
						<div class="card-body rg">
							<fmt:formatNumber value="${prevPrice}" type="number"/> 원
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3">
				<div class="card-header">올해 결산액</div>
				<div class="card-body">
					<div id="thisChart" style="width:100%; height:500px;"></div>
				</div>
				<div class="card-footer small text-muted">주차 시간에 따른 금액과 실제 받은 금액</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script src="${projectRes}ymk/js/parkingPayChart.js"></script>
	<script src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			thisYearMonthPay();	
		}
		
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
			
			var chart = new google.visualization.AreaChart(document.getElementById('thisChart'));
			chart.draw(data, options);
		}
	</script>
</body>
</html>