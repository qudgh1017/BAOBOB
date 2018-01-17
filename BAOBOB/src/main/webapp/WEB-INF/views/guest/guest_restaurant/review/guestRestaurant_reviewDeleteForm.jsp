<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/resources/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>guestRestaurant_reviewDeleteForm</title>
</head>
<body>
	<h2><center>리뷰 삭제</center></h2>
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
	</form>
</body>
</html>