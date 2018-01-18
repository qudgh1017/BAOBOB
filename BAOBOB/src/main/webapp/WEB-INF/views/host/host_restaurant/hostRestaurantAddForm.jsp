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
	
	<!-- 총 관리자 메뉴는 총 관리자만 이용할 수 있다. -->
	<c:if test="${sessionScope.memStep == 4}">
 	<div class="content-wrapper">
		<div class="container-fluid row" style="margin: 0 auto; width: 80%; text-align: center;">
			<div class="col-lg-10">
				<div class="card mb-3">
					<div class="card-header" style="text-align: center;">
						<span>
							<i class="fa fa-fw fa-wrench"></i>
							<b> 매장 추가</b>
						</span>
						</div>
					<div class="card-body p_body">
						<div id="spaceDiv"></div>
					</div>
					<div class="card-footer small text-muted" style="text-align: center;">
						<button class="btn btn-primary" style="width: 200px;" value="1" onclick="spaceTypeChange();">등록</button>
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
	</c:if>
	<c:if test="${sessionScope.memStep != 4}">
		<script type="text/javascript">
			errorAlert('이용할 수 없는 메뉴입니다.\n총 관리자 계정으로 로그인해주세요.');
		</script>
	</c:if>
	
	<!-- Footer -->
	<%@ include file="_footer.jsp" %>
</body>
</html>