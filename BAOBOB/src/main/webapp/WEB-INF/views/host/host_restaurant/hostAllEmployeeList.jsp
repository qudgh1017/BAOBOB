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
			<div class="container-fluid row">
				<div class="col-lg-12">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-fw fa-sitemap"></i> 모든 직원 정보
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" style="border:none;">
									<tr>
										<td style="border:none;">
											<div class="card mb-3">
												<div class="card-header">
													<i class="fa fa-fw fa-sitemap"></i> [${dto_1.restaurant_name}]
												</div>
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-bordered">
															<tbody>
															<c:if test="${cnt_empl_1 > 0}">
																<c:forEach var="dto" items="${dtos_empl_1}">
																	<tr>
																		<td>
																			<span><b>${dto.member_id}</b></span>
																		</td>
																	</tr>
																</c:forEach>
															</c:if>
															<c:if test="${cnt_empl_1 == 0}">
																<tr>
																	<td colspan="2" style="text-align: center;">등록된 직원이 없습니다.</td>
																</tr>
															</c:if>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</td>
										<td style="border:none;">
											<div class="card mb-3">
												<div class="card-header">
													<i class="fa fa-fw fa-sitemap"></i> [${dto_2.restaurant_name}]
												</div>
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-bordered">
															<tbody>
															<c:if test="${cnt_empl_2 > 0}">
																<c:forEach var="dto" items="${dtos_empl_2}">
																	<tr>
																		<td>
																			<span><b>${dto.member_id}</b></span>
																		</td>
																	</tr>
																</c:forEach>
															</c:if>
															<c:if test="${cnt_empl_2 == 0}">
																<tr>
																	<td colspan="2" style="text-align: center;">등록된 직원이 없습니다.</td>
																</tr>
															</c:if>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</td>
										<td style="border:none;">
											<div class="card mb-3">
												<div class="card-header">
													<i class="fa fa-fw fa-sitemap"></i> [${dto_3.restaurant_name}]
												</div>
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-bordered">
															<tbody>
															<c:if test="${cnt_empl_3 > 0}">
																<c:forEach var="dto" items="${dtos_empl_3}">
																	<tr>
																		<td>
																			<span><b>${dto.member_id}</b></span>
																		</td>
																	</tr>
																</c:forEach>
															</c:if>
															<c:if test="${cnt_empl_3 == 0}">
																<tr>
																	<td colspan="2" style="text-align: center;">등록된 직원이 없습니다.</td>
																</tr>
															</c:if>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
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