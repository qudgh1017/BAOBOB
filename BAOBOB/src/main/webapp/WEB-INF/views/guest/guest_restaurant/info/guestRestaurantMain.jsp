<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레스토랑 메인 화면</title>
</head>
<body>
	<!--======= Header 시작 =======-->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Baobob Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- Restaurant_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_restaurant/restaurantMenu.jsp" %>
	<!--======= Header 종료 =======-->
	<input type="hidden" value="${restaurant_index}" name="restaurant_index">
	
	
	<!--====== Container 시작 ======-->
	<section>
		<div class="container">
			<c:if test="${restaurant_index==1 }">
				<div class="row">
					<div class="col-md-offset-1"></div>
					<div class="col-md-10">
						<br>
						<h3 align=left;>どきどきDokidoki</h3>
						<hr style="border:2px solid black;">
					</div>
					<div class="col-md-offset-1"></div>
				</div>
				
				<!-- Dokidoki 레스토랑 사진 -->
				<div class="row">
					<div class="col-md-offset-1"></div>
					<div class="col-md-10">
						<br>
						
						<div id="Restaurant" style="background-image: url(${projectRes}/images/mhj/choice/jap_main.jpg); height:400px; background-repeat:no-repeat;">
							<div style="height:280px;"></div>
							<div style="background:rgba(0, 0, 0, 0.7); color:white; height:120px">
								<br>
								모던한 공간 속에서 감각적인 일본의 맛과 멋을 만날 수 있는 공간입니다. <br>
								합리적인 가격의 음식을 편안하고 세련된 분위기에서 일본의 새로운 미식 문화를 즐기며 <br>
								친구 또는 지인들과 특별한 시간을 함께 하시길 바랍니다.<br>
							</div>
						</div>
						<hr style="border:2px solid black;">
					</div>
					<div class="col-md-offset-1"></div>
				</div>
			</c:if>
			<c:if test="${restaurant_index==2 }">
				<div class="row">
						<div class="col-md-offset-1"></div>
						<div class="col-md-10">
							<br>
							<h3 align=left;>바오밥</h3>
							<hr style="border:2px solid black;">
						</div>
						<div class="col-md-offset-1"></div>
					</div>
					
					<!-- 바오밥 레스토랑 사진 -->
					<div class="row">
						<div class="col-md-offset-1"></div>
						<div class="col-md-10">
							<br>
							
							<div id="Restaurant" style="background-image: url(${projectRes}/images/mhj/choice/kor_main.jpg); height:400px; background-repeat:no-repeat;">
								<div style="height:280px;"></div>
								<div style="background:rgba(0, 0, 0, 0.7); color:white; height:120px">
									<br>
									모던한 공간 속에서 감각적인 일본의 맛과 멋을 만날 수 있는 공간입니다. <br>
									합리적인 가격의 음식을 편안하고 세련된 분위기에서 일본의 새로운 미식 문화를 즐기며 <br>
									친구 또는 지인들과 특별한 시간을 함께 하시길 바랍니다.<br>
								</div>
							</div>
							<hr style="border:2px solid black;">
						</div>
						<div class="col-md-offset-1"></div>
					</div>
			</c:if>	
			<c:if test="${restaurant_index==3 }">
				<div class="row">
						<div class="col-md-offset-1"></div>
						<div class="col-md-10">
							<br>
							<h3 align=left;>BOUTBACK</h3>
							<hr style="border:2px solid black;">
						</div>
						<div class="col-md-offset-1"></div>
					</div>
					
					<!-- BOUTBACK레스토랑 사진 -->
					<div class="row">
						<div class="col-md-offset-1"></div>
						<div class="col-md-10">
							<br>
							
							<div id="Restaurant" style="background-image: url(${projectRes}/images/mhj/choice/boutback_main.jpg); height:400px; background-repeat:no-repeat;">
								<div style="height:340px;"></div>
								<div style="background:rgba(0, 0, 0, 0.7); color:white; height:60px;">
									정통의 맛과 조리법, 신선한 재료로 정성껏 준비한 메뉴를 가족, 친구와 함께 나누는 공간입니다<br>
									눈에 보이는 것을 쫓지 않고 투박하게 쉬운 길로 가지 않고 정직하게 True Taste를 찾겠습니다 
								</div>
							</div>
							<hr style="border:2px solid black;">
						</div>
						<div class="col-md-offset-1"></div>
					</div>
			</c:if>	
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
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
	<!--======= Footer 종료=======-->
</body>
</html>