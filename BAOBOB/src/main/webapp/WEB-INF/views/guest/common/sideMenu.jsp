<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<td>
			<!-- SIDE MENU -->
			<div class="vertical-menu">
				<a href="memMyPageMain" class="active" style="cursor:pointer">My BAOBOB</a>
				<c:if test="${vo.member_step != 8}">
					<a href="#!" class="active">S E R V I C E</a>
					<a href="memPoint">포인트/할인 안내</a>
					<a href="visit">방문 내역</a>
				</c:if>
				<a href="#!" class="active">B A O B O X</a>
				<c:if test="${vo.member_step != 8}">
					<a href="MovieLog">BAOBOX 로그</a>
				</c:if>
				<a href="moviePaidList">예매 내역</a>
				<a href="#!" class="active">B A O 밥</a>
				<c:if test="${vo.member_step != 8}">
					<a href="restaurantLog">BAO밥 로그</a>
				</c:if>
				<a href="memRBookList">예약 내역</a>
				<a href="#!" class="active">고객 센터</a>
				<a href="memQuestion">1 : 1 문의</a>
				<a href="memLost">분실물 문의</a>
			</div>
		</td>
		
