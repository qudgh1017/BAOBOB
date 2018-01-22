<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${restaurant_css}" rel="stylesheet" type="text/css">
<script src="${restaurant_js}" charset=UTF-8></script>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="_navigation.jsp" %>
	
	<c:if test="${sessionScope.memStep != 4}">
		<div class="content-wrapper">
			<div class="container-fluid" style="width: 1000px;">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-fw fa-area-chart"></i> 결산
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th style="width: 600px; text-align: center;">결산</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align: center; vertical-align: middle;">
											${account}
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