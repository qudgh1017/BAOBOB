<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="common/navigation.jsp" %>
	
	<c:set var="janre1" value="${movieChart['janre1']}"></c:set>
	<c:set var="janre2" value="${movieChart['janre2']}"></c:set>
	<c:set var="janre3" value="${movieChart['janre3']}"></c:set>
	<c:set var="janre4" value="${movieChart['janre4']}"></c:set>
	<c:set var="janre5" value="${movieChart['janre5']}"></c:set>
	<c:set var="janre6" value="${movieChart['janre6']}"></c:set>
	<c:set var="janre7" value="${movieChart['janre7']}"></c:set>
	<c:set var="janre8" value="${movieChart['janre8']}"></c:set>
	<c:set var="janre9" value="${movieChart['janre9']}"></c:set>
	<c:set var="janre10" value="${movieChart['janre10']}"></c:set>
		
	<div class="content-wrapper">
		<div class="card-header"><i class="fa fa-table">영화관 결산</i></div>
		<div class="card-body" >
			<div id="firstChat" style="width:100%; height:500px;"></div>
				총 매출액 : ${movieSale}원
		</div>
			
		<div class="card-footer small text-muted">BAOBOX</div>
	</div>
		
	<!-- Footer -->
	<%@ include file="common/footer.jsp" %>	
			
	<script type="text/javascript">
		// 로딩 완료시 함수 실행하여 차트 생성
		google.charts.setOnLoadCallback(drawChartFirst);
		var firstChart_options = {
				title : '장르별 결산', 
				width : 1000, 
				height : 400, 
				bar : {groupWidth : '30%'},
				legend : {position : 'bottom'}};
	   			fill: rgb(51, 102, 204);
		function drawChartFirst(){
			var data = google.visualization.arrayToDataTable([['Element', '장르별', { role: 'style' }],
				                                              ['janre1', ${janre1}, '#40212B'],
														      ['janre2', ${janre2}, '#40212B'],
															  ['janre3', ${janre3}, '#40212B'],
															  ['janre4', ${janre4}, '#40212B'],
															  ['janre5', ${janre5}, '#40212B'],
															  ['janre6', ${janre6}, '#40212B'],
															  ['janre7', ${janre7}, '#40212B'],
															  ['janre8', ${janre8}, '#40212B'],
															  ['janre9', ${janre9}, '#40212B'],
															  ['janre10', ${janre10}, '#40212B']
															]);
			
			var firstChart = new google.visualization.ColumnChart(document.getElementById('firstChat'));
			firstChart.draw(data, firstChart_options);
		}
	</script>
			
	

</body>
</html>