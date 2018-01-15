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
											<span><b>[${dto.member_id}]</b></span>
										</td>
										<td><input type="button" value="상세 정보" onclick="window.location='hostEmployeeView?id=${dto.member_id}'"></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${cnt_empl == 0}">
								<tr>
									<td>등록된 직원이 없습니다.</td>
								</tr>
							</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="_footer.jsp" %>
</body>
</html>