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
	
	<form action="hostEmployeeAddPro" method="POST" name="add_mod_form" enctype="multipart/form-data" onsubmit="return addCheck(${dto.member_id})">
		<input type="hidden" name="id" value="${dto.member_id}">
		<div class="content-wrapper">
			<div class="container-fluid" style="width: 1000px;">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-fw fa-sitemap"></i> 직원 등록
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
									<td>&bull; 생년월일</td>
									<td>${dto.member_birth}</td>
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
									<td>&bull; 가입일</td>
									<td>${dto.member_reg_date}</td>
								</tr>
								<tr>
									<td>&bull; 주민번호 뒷자리</td>
									<td><input type="text" name="jumin2" placeholder="주민번호 뒷자리" onkeydown='return onlyNumber(event)'
										onkeyup='removeChar(event)' style='ime-mode: disabled;' required></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;">
										<input class="btn btn-secondary" style="background-color: #007bff; color: white;" size="10" type="submit" value="직원 등록">
										<input class="btn btn-secondary" style="background-color: #868e96; color: white;" size="10" type="button" value="취소" onclick="window.history.back();">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<!-- Footer -->
	<%@ include file="_footer.jsp"%>
</body>
</html>
