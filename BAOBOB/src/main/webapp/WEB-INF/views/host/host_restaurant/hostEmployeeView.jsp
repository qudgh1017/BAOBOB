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
	<%@ include file="_navigation.jsp"%>
	
	<input type="hidden" name="id" value="${dto.member_id}">
	<div class="content-wrapper">
		<div class="container-fluid" style="width: 1000px;">
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-fw fa-sitemap"></i> 직원 정보
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table border=1 style="border: lightgray; width: 800px;">
							<tr>
								<td>&bull; 아이디</td>
								<td>${dto.member_id}</td>
							</tr>
							<tr>
								<td>&bull; 이름</td>
								<td>${dto.member_name}</td>
							</tr>
							<tr>
								<td>&bull; 전화번호</td>
								<td>${dto.member_tel}</td>
							</tr>
							<tr>
								<td>&bull; 이메일 주소</td>
								<td>${dto.member_email}</td>
							</tr>
							<tr>
								<td>&bull; 주민등록번호</td>
								<td>${dto.member_birth} - ${dto_empl.employee_jumin2}</td>
							</tr>
							<tr>
								<td>&bull; 성별</td>
								<td>${dto.member_sex}</td>
							</tr>
							<tr>
								<td>&bull; 주소</td>
								<td>${dto.member_address}</td>
							</tr>
							<tr>
								<td>&bull; 권한</td>
								<td>${dto.member_step}</td>
							</tr>
							<tr>
								<td>&bull; 가입일</td>
								<td>${dto.member_reg_date}</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<input size="10" type="button" value="직원 삭제" onclick="return delCheck(${dto.member_id}, 'employee');">
									<input size="10" type="button" value="취소" onclick="window.history.back();">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="_footer.jsp"%>
</body>
</html>
