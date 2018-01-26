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
<body class="bg-dark" style="margin-top:200px;">
	
	
	
	<div class="container-fluid">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">
				<i class="fa fa-fw fa-pencil"></i>
				리뷰 수정
			</div>
			<div class="card-body" style="padding:10px">
				<form id="reviewForm" action="Restaurant_revieModifyPro" method="POST">
					<input type="hidden" value="${restaurant_index}" name="restaurant_index">
					<input type="hidden" value="${dto.review_index}" name="review_index">
					<input type="hidden" value="${pageNum}" name="pageNum">
					<table class="table table-bordered" border="1" style="text-align:center; margin-bottom:0px;">
						<tr>
							<th rowspan="3" style="vertical-align:middle;">
								<span style="color:orange;"><h4>${dto.member_id}</h4></span>
							</th>
							<td>
								<c:if test="${dto.review_grade==1}">
									<span>
										<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
										<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
										<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
										<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
									</span>
								</c:if>
								<c:if test="${dto.review_grade==2}">
									<span>
										<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
										<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
										<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
									</span>
								</c:if>
								<c:if test="${dto.review_grade==3}">
									<span>
										<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
										<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
									</span>
								</c:if>
								<c:if test="${dto.review_grade==4}">
									<span>
										<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOff.gif">
									</span>
								</c:if>
								<c:if test="${dto.review_grade==5}">
									<span>
										<img id="image1" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image2" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image3" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image4" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
										<img id="image5" src="/baobob/resources/images/mhj/choice/icon_starOn.gif">
									</span>
								</c:if>
							</td>
						</tr>
						<tr>	
							<td>
								${dto.review_reg_date}
							</td>
						</tr>
						<tr>
							<td>
								<textArea class="form-control" rows="3" cols="35" name="review_content" required>${dto.review_content}</textArea>	
							</td>			
						</tr> 
						<tr>
							<td colspan="2">
								<button class="btn btn-primary" style="display: inline-block; width:80px; color:white; margin-right:5px;" type="submit">확인</button>
								<button class="btn btn-secondary" style="display: inline-block; width:80px; color:white;" type="reset" onclick="window.history.go(-3);">취소</button>
							</td>
						</tr>
					</table> 
					
				</form>	
			</div>
		</div>
	</div>
</body>
</html>