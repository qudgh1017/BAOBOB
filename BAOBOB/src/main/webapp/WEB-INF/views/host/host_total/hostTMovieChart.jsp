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
				<div class="card-body" style="height:700px">
					<div style="display: -webkit-box;">
						<div id="movieChart" style="width:100%; height:500px;"></div>
					</div>
						<div style="font-weight:900; font-size:30px">영화관 총 매출액 : <fmt:formatNumber value="${movieSale}" pattern="###,###,###"/>원</div>
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
				width : 2200, 
				height : 500, 
				bar : {groupWidth : '30%'},
				legend : {position : 'bottom'}};
		function drawChartFirst(){
			var data = google.visualization.arrayToDataTable([
			  ['Element', '장르별'],
              ['가족', ${janre1}],
		      ['공포/호러', ${janre2}],
			  ['드라마', ${janre3}],
			  ['SF', ${janre4}],
			  ['멜로/로맨스', ${janre5}],
			  ['코미디', ${janre6}],
			  ['애니메이션', ${janre7}],
			  ['액션', ${janre8}],
			  ['스릴러', ${janre9}],
			  ['미스터리', ${janre10}]
			]);
			
			var firstChart = new google.visualization.ColumnChart(document.getElementById('movieChart'));
			firstChart.draw(data, firstChart_options);
		}
	</script>
	

</body>
</html>