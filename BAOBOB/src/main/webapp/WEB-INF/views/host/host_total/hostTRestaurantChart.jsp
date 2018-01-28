<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<c:set var="restaurant1" value="${restaurantChart['1']}"></c:set>
	<c:set var="restaurant2" value="${restaurantChart['2']}"></c:set>
	<c:set var="restaurant3" value="${restaurantChart['3']}"></c:set>


	<!-- Navigation -->
	<%@ include file="common/navigation.jsp" %>
		
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="card mb-3">
				<div class="card-header"><i class="fa fa-table">식당 결산</i></div>
				<div class="card-body" style="height:700px">
					<div style="display: -webkit-box;">
						<div id="restaurantChart" style="width:100%; height:500px;"></div>
					</div>
					<div style="font-weight:900; font-size:30px">식당 총 매출액 : ${restaurantSale}원</div>
				</div>
				<div class="card-footer small text-muted">BAOBOX</div>
			</div>
		</div>	
	</div>
		
	<!-- Footer -->
	<%@ include file="common/footer.jsp" %>	
			
	<script type="text/javascript">
		google.charts.setOnLoadCallback(drawChartFirst);
		var firstChart_options = {
				title : '식당 결산', 
				width : 2200, 
				height : 500, 
				bar : {groupWidth : '30%'},
				legend : {position : 'bottom'}};
		function drawChartFirst(){
			var data = google.visualization.arrayToDataTable([
			  ['Element', '식당별'],
              ['한식당', ${restaurant1}],
		      ['일식당', ${restaurant2}],
			  ['양식당', ${restaurant3}]
			]);
			
			var firstChart = new google.visualization.ColumnChart(document.getElementById('restaurantChart'));
			firstChart.draw(data, firstChart_options);
		}
	</script>
	

</body>
</html>