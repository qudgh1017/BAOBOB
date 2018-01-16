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
	<%@ include file="../../common/head.jsp" %>
	<!-- Baobob Navigation -->
	<%@ include file="../../common/navigation.jsp" %>
	<!-- Restaurant_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_restaurant/restaurantMenu.jsp" %>
	<!--======= Header 종료 =======-->
	
	
	<!--====== Container 시작 ======-->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
					<br>
					<h3 align=left;>どきどきDokidoki</h3>
					<hr style="border:2px solid black;">
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			
			<!-- 레스토랑 사진 -->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
					<br>
					
					<div id="Restaurant" style="background-image: url(${projectRes}/images/mhj/choice/jsp2.jpg); height:400px; background-repeat:no-repeat;">
						<div style="height:250px;"></div>
						<div style="background:rgba(0, 0, 0, 0.7); color:white; height:150px">
							<br>
							<br>
							한국소프트웨어인재개발원<br>
							서울특별시 금천구 가산동 426-5 월드 메르디앙 벤처 센터 2 차 410 호<br>
						</div>
					</div>
					<hr style="border:2px solid black;">
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			
			<!-- 위치 -->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
					<br>
					<div id="location">
						<h3 class="text-center text-uppercase text-secondary mb-0">location</h3>
				   		<hr class="star-dark mb-3">
				   		
				   		<iframe width="100%" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=%ED%95%9C%EA%B5%AD%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%EC%9D%B8%EC%9E%AC%EA%B0%9C%EB%B0%9C%EC%9B%90&key=AIzaSyDB_MnAbfzP3Tep6MpXBiY7KHTk2PkMoUo" allowfullscreen></iframe>
					</div>
					<hr style="border:2px solid black;">
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			
			<!-- 교통안내 -->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
					<br>
					<h4>교통안내</h4>
					<hr style="border:2px solid black;">
					지하철<br><br>
					1호선 | 구로역 AK플라자(구 애경백화점)으로 통하는 연결통로 이용<br><br>
					버스<br>
					간선버스 : 503, 571, 160, 260, 503, 600,<br>
					지선버스 : 5615, 5622, 5626, 5630, 5712, 5714, 6512, 5614,  <br>              5615, 5714, 6512, 6513, 6637, 6638, 6639
					좌석버스 : 718<br><br>
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			
			<!-- 주차안내 -->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
					<br>
					<h4>주차안내</h4>
					<hr style="border:2px solid black;">
					주차정보<br><br>
					평일주중(~밤 9시까지) : 3시간 30분 무료(초과 10분당 : 1,000원)<br>
					주말/공휴일 : 3시간 30분 2,000원 (초과 10분당 : 1,000원)<br>
					21시 이후(입차시간 기준) : 1,000원<br>
					<br>
					특이사항<br>
					- AK플라자(구 애경백화점) 주차장 이용 가능<br>
					- 당일 영화 티켓제시 시 무료 주차 또는 요금 할인 가능<br>
					- 백화점 영업시간 종료 이후에는 동문주차장 이용을 부탁드립니다<br><br>
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			
		</div>
		
		
	</section>
	<!--===== Container 종료 =====-->
	
	<br><br><br><br><br><br><br><br>
	
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
	<%@ include file="../../common/footerCopyright.jsp" %>
	<!--======= Footer 종료=======-->
	
</body>
</html>