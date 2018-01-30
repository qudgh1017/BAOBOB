<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>

    
<!-- ajax script 연결! -->
<!-- <script src="resources/mhj/request.js"></script>-->
<!-- 부트스트랩 -->
<!-- <meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/myBootstrap.css"> -->
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Baobob_Restaurant</title>
  
<style type="text/css">
   	.head_header{position:relative;}
  	/* .head_screen{top: 0;left: 0;position: absolute;margin-left: 28.5rem;margin-top: 16rem;} */
  	.head_screen{top: 0; left: 0;position: absolute; margin-left: 45%; margin-top: 40%;} 
	body .mainImg {height:600px;}
	section .notice_a{color:white;}
  	.advertDiv{text-align:center;}
	@media (min-width: 992px){
		.head_screen{
		    max-width: 960px;
		}
	}
	@media (min-width: 768px){
		.head_screen{
		    max-width: 720px;
		}
	}
	@media (min-width: 576px){
		.head_screen{
		    max-width: 540px;
		}
	}
</style>

</head>
<body>
	
	<!--======= Header 시작 =======-->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Baobob Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	
	<!--======= Header - 사진  =======-->
	<%-- <header class="text-white text-center head_header" style="background-color: orange;">
		<div class="head_screen"><!-- container -->
			<h1 class="text-uppercase mb-0">Baobob</h1>
			<h2 class="font-weight-light mb-0">Multiplex Baobob</h2>
		</div>
		<img class="img-fluid mb-5 d-block  mx-auto mainImg " src="${projectRes}images/mhj/choice/cook_1.jpg">
	</header> --%>
	
	<!--======= Container - 레스토랑 선택  =======-->
		<!-- 레스토랑 선택 -->
		<!-- Portfolio Grid Section -->
		<br>
		<br>
		<br>
		
		<section class="pohrertfolio" id="Restaurant">
		  <div class="container">
		    <h2 class="text-center text-uppercase text-secondary mb-0">Restaurant</h2>
		    <hr class="star-dark mb-5">
		    <div class="row">
				<div class="col-lg-4"><!-- Restaurant1 - Dokidoki -->
					<a class=" d-block mx-auto" href="guestRestaurantMain?restaurant_index=1">
						<img class="img-fluid" src="${projectRes}images/mhj/choice/jap_1.jpg" alt="">
					</a>
					<div style="background:rgba(0, 0, 0, 0.7); font-size:1.2em; color:white; height:50px; line-height: 2.5; padding-left: 15px;">
						どきどき(Dokidoki)
						<button type="button" class="btn btn-danger" role="button" style="float:right; margin: 5px;" onclick="window.location='guestReserv_addForm?restaurant_index=1'">예약
						</button>					
					</div>					
				</div>
				<div class="col-lg-4"><!-- Restaurant2 - 바오밥 -->
					<a class="d-block mx-auto" href="guestRestaurantMain?restaurant_index=2">
						<img class="img-fluid" src="${projectRes}images/mhj/choice/kor_4.jpg" alt="">
					</a>
					<div style="background:rgba(0, 0, 0, 0.6); font-size:1.2em; color:white; height:50px; line-height: 2.5; padding-left: 15px;">
						바오밥
						<button type="button" class="btn btn-danger" role="button" style="float:right; margin: 5px;" onclick="window.location='guestReserv_addForm?restaurant_index=2'">예약
						</button>
					</div>	
				</div>
				<div class="col-lg-4"><!-- Restaurant3 - BOUTBACK -->
					<a class=" d-block mx-auto" href="guestRestaurantMain?restaurant_index=3">
						<img class="img-fluid" src="${projectRes}images/mhj/choice/pasta_4.jpg" alt="">
					</a>
					<div style="background:rgba(0, 0, 0, 0.5); font-size:1.2em; color:white; height:50px; line-height: 2.5; padding-left: 15px;">
						BOUTBACK
						<button type="button" class="btn btn-danger" role="button" style="float:right; margin: 5px;" onclick="window.location='guestReserv_addForm?restaurant_index=3'">예약
						</button>
						
						
					</div>
				</div>
		    </div>
		  </div>
		</section>
		
		<br>
		<br>
		<br>
		<br>
		<br>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_restaurant/restaurant_footer.jsp" %> 
	<!-- Footer -->
</body>
</html>