<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${restaurant_css}" rel="stylesheet" type="text/css">
<script src="${restaurant_js}"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark">
	<!-- Navigation -->
	<%@ include file="_navigation.jsp" %>
	
 	<div class="content-wrapper">
		<div class="container-fluid row">
			<div class="col-lg-10">
				<div class="card mb-3">
					<div class="card-header">매장 추가</div>
					<div class="card-body p_body">
						<div id="spaceDiv"></div>
					</div>
					<div class="card-footer small text-muted">
						<button class="btn btn-primary" value="1" onclick="spaceTypeChange();">등록</button>
					</div>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="card mb-3">
					<div class="card-header">매장 정보 입력</div>
					<div class="card-body">
						매장명 <input class="form-control" id="name" type="text" required><br>
						전화번호  <input class="form-control" id="tel" type="text" required>
					</div>
				</div>
				
				<div class="card mb-3">
					<div class="card-header">매장 설정</div>
					<div class="card-body">
						가로  <input class="form-control" id="widthX" type="number" min="1" max="100" onchange="spaceDivChange();" required><br>
						세로  <input class="form-control" id="heightY" type="number" min="1" max="100" onchange="spaceDivChange();" required>
						
						<hr>
						
						<button class="m_btn" onclick="spaceType('0');"><img class="p_img" src="${restaurant_images}icon_tmp.png"></button>
						<button class="m_btn" onclick="spaceType('1');"><img class="p_img" src="${restaurant_images}table.jpg"></button>
						<button class="m_btn" onclick="spaceType('2');"><img class="p_img" src="${restaurant_images}icon_enter.png"></button>
					</div>
				</div>
			</div>
		</div>
	</div> 
	
	<!-- Footer -->
	<%@ include file="_footer.jsp" %>
</body>
</html>