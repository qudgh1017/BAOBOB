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

	<!-- Navigation -->
	<%@ include file="common/navigation.jsp" %>
		
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="card mb-3">
				<div class="card-header"><i class="fa fa-table">영화관 결산</i></div>
				<div class="card-body" >
					<div style="display: -webkit-box;">
						<div id="movieChart" style="width:100%; height:500px;"></div>
					</div>
					영화관 총 매출액 : ${movieSale}원
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
				title : '영화관 결산', 
				width : 1000, 
				height : 400, 
				bar : {groupWidth : '30%'},
				legend : {position : 'bottom'}};
		function drawChartFirst(){
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
			
			var firstChart = new google.visualization.ColumnChart(document.getElementById('movieChart'));
			firstChart.draw(data, firstChart_options);
		}
	</script>
	

</body>
</html>