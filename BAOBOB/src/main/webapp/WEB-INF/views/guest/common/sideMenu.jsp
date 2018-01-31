<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
</head>
<body>
		<td>
			<!-- SIDE MENU -->
			<div class="vertical-menu">
				<a href="memMyPageMain" class="active" style="cursor:pointer; background-color:C2EED8;">My BAOBOB</a>
				<c:if test="${vo.member_step != 8}">
					<a href="#!" class="active" style="background-color:C2EED8;">S E R V I C E</a>
					<a href="memPoint" style="background-color:C2EED8;">포인트/할인 안내</a>
					<a href="visit" style="background-color:C2EED8;">이용 내역</a>
				</c:if>
				<a href="#!" class="active" style="background-color:C2EED8;">B A O B O X</a>
				<c:if test="${vo.member_step != 8}">
					<a href="MovieLog" style="background-color:C2EED8;">BAOBOX 로그</a>
				</c:if>
				<a href="moviePaidList" style="background-color:C2EED8;">예매 내역</a>
				<a href="#!" class="active" style="background-color:C2EED8;">B A O 밥</a>
				<c:if test="${vo.member_step != 8}">
					<a href="restaurantLog" style="background-color:C2EED8;">BAO밥 로그</a>
				</c:if>
				<a href="memRBookList" style="background-color:C2EED8;">예약 내역</a>
				<a href="#!" class="active" style="background-color:C2EED8;">고객 센터</a>
				<a href="memQuestion" style="background-color:C2EED8;">1 : 1 문의</a>
				<a href="memLost" style="background-color:C2EED8;">분실물 문의</a>
			</div>
		</td>
</body>
</html>