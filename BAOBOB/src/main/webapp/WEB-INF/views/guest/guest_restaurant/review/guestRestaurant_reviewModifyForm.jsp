<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/resources/mhj/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${projectRes}adminBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="${projectRes}adminBootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="${projectRes}adminBootstrap/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${projectRes}adminBootstrap/css/sb-admin.css" rel="stylesheet">
<title>guestRestaurant_reviewModifyForm</title>
</head>
<body class="bg-dark" style="margin-top: 300px;">
	<div class="container-fluid" style="width:300px;">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header" style="padding:0.5rem;">
				<i class="fa fa-fw fa-commenting-o"></i>
				리뷰 변경
			</div>
			<div class="card-body" style="padding:5px 5px 5px 5px;">
				<form action="Restaurant_reviweModifyView" method="post" name="pwdform" style="margin-bottom:10px;">
					<!-- hidden : submit일 경우 input 태그에 보이지 않는 값을 넘길때 -->
					<input type="hidden" name="review_index" value="${review_index}">
					<input type="hidden" name="restaurant_index" value="${restaurant_index}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					
					<i class="fa fa-fw fa-lock"></i>
					<label for="exampleInputEmail1">비밀번호를 입력하세요.</label> 
					<input class="form-control" type="password" maxlength="10" style="display:inline-block; text-align: center;" 
							name="member_pwd" id="tableCnt" placeholder="비밀번호를 입력하세요" value="${tableCnt}" required>
			
					
					<!-- <input class="form-control" type="password" name="member_pwd" maxlength="10" style="text-align:center;" placeholder="비밀번호를 입력하세요" required> -->
					<div>
						<button class="btn btn-primary" style="float:right; display: inline-block; width:80px; color:white; margin-left:5px; margin-top:10px;" type="reset" onclick="window.history.back();">취소</button>
						<button class="btn btn-primary" style="float:right; display: inline-block; width:80px; color:white; margin-left:10px; margin-top:10px;" type="submit">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>