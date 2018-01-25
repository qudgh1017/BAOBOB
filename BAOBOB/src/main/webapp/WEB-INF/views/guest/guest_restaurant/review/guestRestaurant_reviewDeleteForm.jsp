<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/resources/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>guestRestaurant_reviewDeleteForm</title>
<script type="text/javascript">
$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})
</script>
</head>
<body>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title">Modal title</h4>
      		</div>
	      	<div class="modal-body">
	        	<p>One fine body&hellip;</p>
	      	</div>
	      	<form action="Restaurant_reviewDeletePro" method="post" name="pwdform">
				<!-- hidden : submit일 경우 input 태그에 보이지 않는 값을 넘길때 -->
				<input type="hidden" name="review_index" value="${review_index}">
				<input type="hidden" name="restaurant_index" value="${restaurant_index}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<table align="center" border="1">
					<tr>
						<th colspan="2">
							비밀번호를 입력하세요.
						</th>
					</tr>
					<tr> 
						<th>비밀번호</th>
						<td>
							<input class="input" type="password" name="member_pwd" maxlength="10" required>
						</td>	
					</tr>
		
					<tr>
						<th colspan="2"> 
							<input class="inputButton" type="submit" value="확인">
							<input class="inputButton" type="reset" value="취소" onclick="window.history.back();">
						</th>
					</tr>		
				</table>	
			</form> 
      		<div class="modal-footer">
		    	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		    	<button type="button" class="btn btn-primary">Save changes</button>
        	</div>
    	</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<%-- <h2><center>리뷰 삭제</center></h2>
	<form action="Restaurant_reviewDeletePro" method="post" name="pwdform">
		<!-- hidden : submit일 경우 input 태그에 보이지 않는 값을 넘길때 -->
		<input type="hidden" name="review_index" value="${review_index}">
		<input type="hidden" name="restaurant_index" value="${restaurant_index}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		리뷰번호 : ${review_index}<br>
		페이지번호 : ${pageNum}
		<table align="center">
			<tr>
				<th colspan="2">
					비밀번호를 입력하세요.
				</th>
			</tr>
			<tr> 
				<th>비밀번호</th>
				<td>
					<input class="input" type="password" name="member_pwd" maxlength="10" required>
				</td>	
			</tr>

			<tr>
				<th colspan="2"> 
					<input class="inputButton" type="submit" value="확인">
					<input class="inputButton" type="reset" value="취소" onclick="window.history.back();">
				</th>
			</tr>		
		</table>	
	</form> --%>
</body>
</html>