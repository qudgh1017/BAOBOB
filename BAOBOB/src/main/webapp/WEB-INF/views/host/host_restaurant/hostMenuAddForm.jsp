<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/chg/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="${restaurant_css}" rel="stylesheet" type="text/css">
<script src="${restaurant_js}"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		// File 선택(값 변경) Event 함수
		$('#img').change(function() {
			preview(this);
		});

		// 미리보기 함수
		function preview(input) {
			if (input.files && input.files[0]) {
		       	var reader = new FileReader();
		
		       	//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
		       	reader.onload = function (e) {
		          	$('#imgView').attr('src', e.target.result);
		       	};

		      	reader.readAsDataURL(input.files[0]);
	    	}
	  	}
	});
</script>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="_navigation.jsp"%>
	
	<form action="hostMenuAddPro" method="POST" name="add_mod_form" enctype="multipart/form-data">
		<c:if test="${sessionScope.memStep != 4}">
			<div class="content-wrapper">
				<div class="container-fluid" style="width: 1000px;">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-fw fa-dashboard"></i> 메뉴 추가
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table border=1 style="border: lightgray; width: 800px;">
									<tr>
										<th>&bull; 메뉴명</th>
										<td><input type="text" name="name" placeholder="메뉴명" required></td>
									</tr>
									<tr>
										<th>&bull; 가격</th>
										<td><input type="text" name="price" placeholder="가격(원)" onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)' style='ime-mode: disabled;' required></td>
									</tr>
									<tr>
										<th>&bull; 메뉴 소개</th>
										<td><textarea name="content" rows="5" cols="50" placeholder="메뉴 소개" required></textarea></td>
									</tr>
									<tr>
										<th rowspan="2">&bull; 메뉴 이미지</th>
										<td><input type="file" id="img" name="img" accept="image/*" required></td>
									</tr>
									<tr>
										<td><img src="" id="imgView" name="imgView" style="width: 400px;"></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;">
											<input class="btn btn-primary" style="background-color: #007bff; color: white; border: 1px solid #007bff;" type="submit" value="메뉴 추가" />
											<input class="btn btn-secondary" style="background-color: #343a40; color: white; border: 1px solid #343a40;" type="reset" value="취소 " />
										</td>
									</tr>
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
	</form>
	
	<!-- Footer -->
	<%@ include file="_footer.jsp"%>
</body>
</html>
