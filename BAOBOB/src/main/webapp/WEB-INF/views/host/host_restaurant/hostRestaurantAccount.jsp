<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${restaurant_css}" rel="stylesheet" type="text/css">
<script src="${restaurant_js}" charset=UTF-8></script>
<script src="${projectRes}adminBootstrap/vendor/jquery/jquery.min.js"></script>

<!-- 구글챠트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>google.charts.load('current', {packages:['corechart']});</script>
<script type="text/javascript">
	// 금액에 콤마 찍기
	function AddComma(total) {
		total = Number(total).toLocaleString('en')
		
		document.getElementById('totalView').innerHTML = "판매액 : " + total + "원";
	}

	// 로딩 완료시 함수 실행하여 차트 생성
	google.charts.setOnLoadCallback(menuChart);
	var chart_options = {
			title : '메뉴별 매출', 
			width : 450, 
			height : 400, 
			bar : {groupWidth : '30%'},
			legend : {position : 'bottom'}
	};
	function menuChart(){
		var keys = '${keys}';
		var key = keys.split(',');
		
		var values = '${values}';
		var value = values.split(',');
		
		var data = new google.visualization.DataTable();
        data.addColumn('string', '메뉴');
        data.addColumn('number', '판매액');

        for (var i = 0; i < ${count}; i++) {
        	value[i] = value[i] * 1;
        	var dataRow = [key[i], value[i]];
            data.addRow(dataRow);
        }

        var menuChart = new google.visualization.ColumnChart(document.getElementById('menuChart'));
		menuChart.draw(data, chart_options);
	}

	// 로딩 완료시 함수 실행하여 차트 생성
	google.charts.setOnLoadCallback(drawChart);
	var chart_options2 = {
		title : '성별 비율',
		width : 450,
		height : 400,
		legend : {position : 'bottom'}
	}
	function drawChart(){
	 	var data = google.visualization.arrayToDataTable([
 		['Element', '성별'],
 		['남', ${sexChart['남']}],
 		['여', ${sexChart['여']}]
	 	]);
		var sexChart = new google.visualization.PieChart(document.getElementById('sexChart'));
		sexChart.draw(data, chart_options2);
	}
</script>
</head>
<body class="fixed-nav sticky-footer bg-dark" onload="AddComma(${total})">
	<!-- Navigation -->
	<%@ include file="_navigation.jsp" %>
	
	<c:if test="${sessionScope.memStep != 4}">
		<div class="content-wrapper">
			<div class="container-fluid" style="width: 1000px;">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-fw fa-area-chart"></i> 금월 결산
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td style="text-align: center; vertical-align: middle;">
											<div style="display: -webkit-box;">
												<div id="menuChart" style="width: 50%; height: 500px;"></div>
												<div id="sexChart" style="width: 50%; height: 500px;"></div>
											</div>
										</td>
									</tr>
									<tr>
										<td style="text-align: center; vertical-align: middle;">
											<div class="h4 mb-0 text-success" id="totalView"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.memStep == 4}">
		<script type="text/javascript">
			errorAlert('이용할 수 없는 메뉴입니다.\n식당 관리자 계정으로 로그인해주세요.');
		</script>
	</c:if>
	
	<!-- Footer -->
	<%@ include file="_footer.jsp" %>
</body>
</html>