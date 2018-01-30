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
	
	<c:if test="${sessionScope.memStep != 4}">
		<div class="content-wrapper">
			<div class="container-fluid" style="width: 1000px;">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-fw fa-sitemap"></i> 직원 목록
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th style="width: 600px; text-align: center;">직원정보</th>
										<th style="width: 100px; text-align: center;">정보 보기</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${cnt_empl > 0}">
									<c:forEach var="dto" items="${dtos_empl}">
										<tr>
											<td style="text-align: center;">
												<span><b>[${dto.member_name}] 사원</b> - (${dto.member_id})</span>
											</td>
											<td style="text-align: center; vertical-align: middle;">
												<input class="btn btn-secondary" style="background-color: #007bff; color: white;" type="button" value="상세 정보" onclick="window.location='hostEmployeeView?id=${dto.member_id}'">
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${cnt_empl == 0}">
									<tr>
										<td colspan="2" style="text-align: center;">등록된 직원이 없습니다.</td>
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
	<c:if test="${sessionScope.memStep == 4}">
		<script type="text/javascript">
			errorAlert('이용할 수 없는 메뉴입니다.\n총 관리자 계정으로 로그인해주세요.');
		</script>
	</c:if>
	
	<!-- Footer -->
	<%@ include file="_footer.jsp" %>
</body>
</html>