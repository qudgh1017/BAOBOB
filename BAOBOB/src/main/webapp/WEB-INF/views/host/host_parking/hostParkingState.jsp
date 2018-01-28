<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		.container-fluid{margin-bottom:15px;}/* 내용 영역 */
		
		body .p_body{min-height:450px;overflow-x:auto;}
		body .p_div{display:flex;width:fit-content;margin:0 auto;}/* flex-wrap:wrap; */
		.p_img{width:100%;height:auto;}
		body .p_btn{max-width:40px;height:fit-content;background:lightgray;border:transparent;border-radius:0.2em;padding:5px;margin:2px;} /* flex:1 0 120px; */
		
		body .test{display:block;position:fixed;width:50%;max-width:500px;background:white;padding-top:15px;}
		#moveNum{display:none;position:absolute;width:100px;height:50px;background:cadetblue;
    			 border-radius:0.5em;text-align:center;font-size:24px;line-height:45px;}
	</style>
</head>
<body class="fixed-nav sticky-footer bg-dark" onload="parkingStatus('${col}', '${row}', '${states}');">

	<!-- Navigation -->
	<%@ include file="hostParkingNavigation.jsp" %>
	
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="card mb-3">
				<div class="card-header">실시간 주차 상태</div>
				<div class="card-body p_body" id="spaceDiv"></div>
				<div class="card-footer small text-muted">
					주차 구역을 선택하면 해당 정보가 나타납니다.
				</div>
			</div>
			<div class="row test" id="result">
				<!-- 구역 정보 -->
			</div>
			<div id="moveNum"></div>
		</div>
	</div>
	
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
	
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script src="${projectRes}ymk/js/parkingState.js"></script>
	<script type="text/javascript">
		setInterval(function() {
			sendRequest(state_callback, 'hostParkingStateAjax', 'GET', '');
		}, 10000);
		
		function state_callback() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					var data = httpRequest.responseText;
					var arr = data.split('|');
					console.log('arr 0 = ' + arr[0]);
					console.log('arr 1 = ' + arr[1]);
					console.log('arr 2 = ' + arr[2]);
					parkingStatus(arr[0], arr[1], arr[2]);
				}
			}
		}
	</script>
</body>
</html>