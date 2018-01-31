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
	
	<!-- 총 관리자 메뉴는 총 관리자만 이용할 수 있다. -->
	<c:if test="${sessionScope.memStep == 4}">
	<div class="content-wrapper">
		<div class="container-fluid" style="width: 1000px;">
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-fw fa-dashboard"></i> 매장 목록
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th style="width: 600px; text-align: center;">매장정보</th>
									<th style="width: 100px; text-align: center;">수정</th>
									<th style="width: 100px; text-align: center;">삭제</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${cnt_restaurant > 0}">
								<c:forEach var="dto" items="${dtos_restaurant}">
									<tr>
										<td style="text-align: center;">
											<span><b>[${dto.restaurant_name}]</b> - </span>
											<span style="font-size: 12px; color: gray">${dto.restaurant_tel}</span><br>
										</td>
										<td style="text-align: center;">
											<button class="btn btn-secondary" style="display: inline-block; line-height: 1.0;" value="1" onclick="window.location='hostRestaurantModForm?index=${dto.restaurant_index}'">수정</button>
										<td style="text-align: center;">
											<button class="btn btn-secondary" style="display: inline-block; line-height: 1.0;" value="1" onclick="delCheck(${dto.restaurant_index}, '${dto.restaurant_name}');">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${cnt_restaurant == 0}">
								<tr>
									<td colspan="3" style="text-align: center;">등록된 매장이 없습니다.</td>
								</tr>
							</c:if>
							</tbody>
						</table>
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