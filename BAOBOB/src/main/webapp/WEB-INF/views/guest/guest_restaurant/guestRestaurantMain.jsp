<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/resources/setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레스토랑 메인 화면</title>

</head>
<body>
	<!--======= Header 시작 =======-->
	<%@ include file="../common/head.jsp" %>

	<!-- Baobob Navigation -->
	<%@ include file="../common/navigation.jsp" %>
	
	<!-- Restaurant_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_restaurant/restaurantMenu.jsp" %>
	<!--======= Header 종료 =======-->
	
	
	<!--====== Container 시작 ======-->
	<div class="container">
		<h2>식당 메인 화면 입니다.</h2>
		<!--============ 일식 ============-->
		<c:if test="${restaurant_index==1}">
			일식
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</c:if>
		
		
		
		<!--============ 한식 ============-->
		<c:if test="${restaurant_index==2}">
			한식
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</c:if>
		
		
		
		<!--============ 양식 ============-->
		<c:if test="${restaurant_index==3}">
			양식
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</c:if>
	</div>
	<!--===== Container 종료 =====-->
	
	
	
	
	<!--======= Footer 시작 =======-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
				  <h4 class="text-uppercase mb-4">Location</h4>
				  <p class="lead mb-0">2215 John Daniel Drive
				    <br>Clark, MO 65243</p>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
				  <h4 class="text-uppercase mb-4">Around the Web</h4>
				  <ul class="list-inline mb-0">
				    <li class="list-inline-item">
				      <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
				        <i class="fa fa-fw fa-facebook"></i>
				      </a>
				    </li>
				    <li class="list-inline-item">
				      <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
				        <i class="fa fa-fw fa-google-plus"></i>
				      </a>
				    </li>
				    <li class="list-inline-item">
				      <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
				        <i class="fa fa-fw fa-twitter"></i>
				      </a>
				    </li>
				    <li class="list-inline-item">
				      <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
				        <i class="fa fa-fw fa-linkedin"></i>
				      </a>
				    </li>
				    <li class="list-inline-item">
				      <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
				        <i class="fa fa-fw fa-dribbble"></i>
				      </a>
				    </li>
				  </ul>
				</div>
				<div class="col-md-4">
					<h4 class="text-uppercase mb-4">About Freelancer</h4>
					<p class="lead mb-0">Freelance is a free to use, open source Bootstrap theme created by
					  <a href="http://startbootstrap.com">Start Bootstrap</a>.</p>
				</div>
			</div>
		</div>
	</footer> 
	<%@ include file="../common/footerCopyright.jsp" %>
	<!--======= Footer 종료=======-->
	
</body>
</html>