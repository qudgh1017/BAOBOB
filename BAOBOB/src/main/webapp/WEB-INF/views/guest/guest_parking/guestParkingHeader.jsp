<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.back_img{position:fixed;top:0;width:100%;height:100%;object-fit:cover;}
	body .section{margin:15rem 0;}
	.img-fluid{border-radius:0.5em;}
	#inform{width:700px;margin:0 auto;}
	body .input{height:100px;font-size:32px;text-align:center;}
	.btn{background:#2c3e50!important;color:white;}
	.back_btn{height:50px;border:1px solid #495057;padding:0 25px;}
 	.copyright{bottom:0;left:0;position:fixed;width:100%;}
</style>

<nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
	<div class="container">
		<c:if test="${sessionScope.memStep == 1 || sessionScope.memStep == 7}">
			<a class="navbar-brand js-scroll-trigger" href="mainIndex">Baobob</a>
		</c:if>
		<c:if test="${sessionScope.memStep != 7}">
			<a class="navbar-brand js-scroll-trigger" href="guestParkingMain">Baobob</a>
		</c:if>
		<button class="btn back_btn" id="back_btn" onclick="window.history.back();">뒤로</button>
	</div>
</nav>