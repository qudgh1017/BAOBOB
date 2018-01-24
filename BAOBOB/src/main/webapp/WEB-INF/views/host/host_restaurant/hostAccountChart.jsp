<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/resources/chg/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">
	<!-- Navigation -->
	<%@ include file="_navigation.jsp"%>

	<!-- 제한 연령별 매출 -->
	<c:set var="age1" value="${movieAgeChart['0']}"></c:set>
	<c:set var="age2" value="${movieAgeChart['12']}"></c:set>
	<c:set var="age3" value="${movieAgeChart['15']}"></c:set>
	<c:set var="age4" value="${movieAgeChart['19']}"></c:set>

	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="col-lg-6">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-table">제한연령별 결산</i>
					</div>
					<div class="card-body">
						<div style="display: -webkit-box;" align="center">
							<div id="movieAgeChart" style="width: 100%; height: 500px;"></div>
						</div>
						영화관 총 매출액 : ${movieSale}원
					</div>
					<div class="card-footer small text-muted">BAOBOX</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="_footer.jsp"%>

	<script src="${projectRes}adminBootstrap/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript">
		// 로딩 완료시 함수 실행하여 차트 생성
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
	</script>
</body>
</html>