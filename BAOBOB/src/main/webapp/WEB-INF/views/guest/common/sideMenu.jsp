<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<td>
			<!-- SIDE MENU -->
			<div class="vertical-menu">
				<a href="memMyPageMain" class="active" style="cursor:pointer">My BAOBOB</a>
				<c:if test="${vo.member_step != 8}">
					<a href="#!" class="active">SERVICE</a>
					<a href="#!">포인트/쿠폰</a>
					<a href="#!">방문 내역</a>
				</c:if>
				<a href="#!" class="active">MOVIE</a>
				<c:if test="${vo.member_step != 8}">
					<a href="MovieLog">무비 로그</a>
				</c:if>
				<a href="moviePaidList">예매 내역</a>
				<a href="#!" class="active">RESTAURANT</a>
				<c:if test="${vo.member_step != 8}">
					<a href="restaurantLog">레스토랑 로그</a>
				</c:if>
				<a href="#!">레스토랑 예약</a>
				<a href="#!" class="active">고객 센터</a>
				<a href="memQuestion">1 : 1 문의</a>
				<a href="memLost">분실물 문의</a>
			</div>
		</td>
		
