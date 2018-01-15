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
	
	<form action="hostMenuModPro" method="POST" name="add_mod_form" enctype="multipart/form-data">
		<div class="content-wrapper">
			<div class="container-fluid" style="width: 1000px;">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-fw fa-dashboard"></i> 메뉴 수정
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table border=1 style="border: lightgray; width: 800px;">
								<tr>
									<td>&bull; 메뉴명</td>
									<td><input type="text" name="name" value="${dto.restaurant_menu_name}" required></td>
								</tr>
								<tr>
									<td>&bull; 가격</td>
									<td><input type="text" name="price" value="${dto.restaurant_menu_price}" onkeydown='return onlyNumber(event)'
										onkeyup='removeChar(event)' style='ime-mode: disabled;' required></td>
								</tr>
								<tr>
									<td>&bull; 메뉴 소개</td>
									<td><textarea name="content" rows="5" cols="50" required>${dto.restaurant_menu_content}</textarea></td>
								</tr>
								<tr>
									<td rowspan="2">&bull; 메뉴 이미지</td>
									<td><input type="file" id="img" name="img" accept="image/*" value="${restaurant_images}${dto.restaurant_menu_img}" required></td>
								</tr>
								<tr>
									<td><img src="${restaurant_images}${dto.restaurant_menu_img}" id="imgView" name="imgView" style="width: 400px;"></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;">
										<input size="10" type="submit" value="메뉴 수정" style="background-color: black; color: white; border: 1px solid;">
										<input size="10" type="reset" value="취소" style="background-color: lightgray; color: black; border: 1px solid;">
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
