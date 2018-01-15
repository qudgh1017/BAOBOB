<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>guestRestaurant_reviewModifyForm</title>
</head>
<body>
		<h2>리뷰 쓰기</h2>
		<hr>
		<form id="reviewForm" action="Restaurant_revieModifyPro" method="POST">
			<input type="hidden" value="${restaurant_index}" name="restaurant_index">
			<input type="hidden" value="${dto.review_index}" name="review_index">
			<input type="hidden" value="${pageNum}" name="pageNum">

			<table class="table" border="1">
				<tr>
					<th>Id</th> 
					<td>
						${dto.member_id}
					</td>
				</tr>
				
				<tr>
					<th>별점</th> 
					<td>
						<input class="input" value="${dto.review_grade}" name="review_grade" style="width:50px" required/>
					</td>
				</tr>
				
				<tr>
					<th>글 내용</th> 
					<td>
						<textArea class="input" rows="10" cols="40" name="review_content" required>${dto.review_content}</textArea>
					</td>
				</tr>
				<tr>
					<th>날짜</th> 
					<td>
						${dto.review_date}
					</td>
				</tr>
				
				
				<tr>
					<th colspan="2">
						<input class="button" type="submit" value="리뷰 수정"> 
						<input class="button" type="reset" value="취소" onclick="window.history.go(-2);"> 
					</th>
				</tr>
				
			</table>	
		</form>
</body>
</html>