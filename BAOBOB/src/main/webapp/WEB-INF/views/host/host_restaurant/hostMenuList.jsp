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
						<i class="fa fa-fw fa-dashboard"></i> 메뉴 목록
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th style="width: 600px; text-align: center;">메뉴정보</th>
										<th style="width: 100px; text-align: center;">수정</th>
										<th style="width: 100px; text-align: center;">삭제</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${cnt_menu > 0}">
									<c:forEach var="dto" items="${dtos_menu}">
										<tr>
											<td>
												<span><b>[${dto.restaurant_menu_name}]</b> - </span>
												<span style="font-size: 12px; color: gray">${dto.restaurant_menu_price}원</span><br>
												<div style="margin-top: 5px; padding:10px;">
													<img src="${restaurant_images}${dto.restaurant_menu_img}" style="width: 190px; float:left;">
													<p class="form-control" style="min-height: 95px; margin-top: 0px; margin-left: 15px; width: 370; float:left;">${dto.restaurant_menu_content}</p>
												</div>
											</td>
											<td style="text-align: center; vertical-align: middle;">
												<button class="btn btn-secondary" style="display: inline-block;" value="1" onclick="window.location='hostMenuModForm?index=${dto.restaurant_menu_index}'">수정</button>
											</td>
											<td style="text-align: center; vertical-align: middle;">
												<button class="btn btn-secondary" style="display: inline-block;" value="1" onclick="delCheck(${dto.restaurant_menu_index}, 'menu');">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${cnt_menu == 0}">
									<tr>
										<td colspan="3" style="text-align: center;">등록된 메뉴가 없습니다.</td>
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
			errorAlert('이용할 수 없는 메뉴입니다.\n식당 관리자 계정으로 로그인해주세요.');
		</script>
	</c:if>
	
	<!-- Footer -->
	<%@ include file="_footer.jsp" %>
</body>
</html>