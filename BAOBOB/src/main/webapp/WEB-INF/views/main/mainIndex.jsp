<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/resources/setting.jsp"%>
<html>
  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Baobob</title>
    
    <style type="text/css">
     	.head_header{position:relative;}
    	.head_screen{top:54%;left:39%;position:absolute;}
    	
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

<body id="page-top">	
	<%@ include file="../guest/common/head.jsp" %>

	<!-- Navigation -->
	<%@ include file="../guest/common/navigation.jsp" %>
	
	<!-- Header -->
	<header class="bg-primary text-white text-center head_header">
		<div class="head_screen"><!-- container -->
			<h1 class="text-uppercase mb-0">Baobob</h1>
			<h2 class="font-weight-light mb-0">Multiplex Baobob</h2>
		</div>
		<img class="img-fluid mb-5 d-block  mx-auto" src="${projectRes}images/ymk/main/main_screen.jpg">
	</header>
	
	   <!-- Portfolio Grid Section -->
	<section class="portfolio" id="Menu">
	  <div class="container">
	    <h2 class="text-center text-uppercase text-secondary mb-0">Menu</h2>
	    <hr class="star-dark mb-5">
	    <div class="row">
			<div class="col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="guest_movie">
					<img class="img-fluid" src="${projectRes}images/ymk/main/movieIcon.png">
				</a>
			</div>
			<div class="col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="guestRestaurantList">
					<img class="img-fluid" src="${projectRes}images/ymk/main/foodIcon.png">
				</a>
			</div>
			<div class="col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="#">
					<img class="img-fluid" src="${projectRes}images/ymk/main/serviceIcon.png">
				</a>
			</div>
	    </div>
	  </div>
	</section>
	
	<!-- About Section -->
	<section class="bg-primary text-white mb-0" id="Notice">
	  <div class="container">
	    <h2 class="text-center text-uppercase text-white">Notice</h2>
	    <hr class="star-light mb-5">
	    <div class="row">
	      <div class="col-lg-4 ml-auto">
	        <p class="lead">BAOBOB는 B형 3명, A형 1명, O형 2명을 뜻한다.</p>
	      </div>
	      <div class="col-lg-4 mr-auto">
	        <p class="lead"><a class="notice_a" href="#">개인정보 이용내역 안내</a></p>
	      </div>
	    </div>
	    <!-- <div class="text-center mt-4">
	      <a class="btn btn-xl btn-outline-light" href="#">
	        <i class="fa fa-download mr-2"></i>
	        Download Now!
	      </a>
	    </div> -->
	  </div>
	</section>
	
	<!-- Contact Section -->
	<section id="Advert">
	  <div class="container">
	    <h2 class="text-center text-uppercase text-secondary mb-0">Advert</h2>
	    <hr class="star-dark mb-5">
	    <div class="row">
	    	<div class="col-md-6 col-lg-12 advertDiv">
	    		<img class="img-fluid" src="${projectRes}images/ymk/main/advert01.jpg">
	    	</div>
	    </div>
	  </div>
	</section>
	
	<section class="portfolio" id="Event">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">Event</h2>
	    	<hr class="star-dark mb-5">
	    	<div class="row">
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#">
						<div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fa fa-search-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="${projectRes}images/ymk/main/event01.png" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#">
						<div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fa fa-search-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="${projectRes}images/ymk/main/event02.png" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#">
						<div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fa fa-search-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="${projectRes}images/ymk/main/event03.png" alt="">
					</a>
				</div>
		    </div>
		</div>
	</section>
	
	
	<section class="portfolio" id="Alliance">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">Alliance</h2>
	    	<hr class="star-dark mb-5">
	    	<div class="row">
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#">
						<img class="img-fluid" src="${projectRes}images/ymk/main/banner01.png" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#">
						<img class="img-fluid" src="${projectRes}images/ymk/main/banner02.png" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#">
						<img class="img-fluid" src="${projectRes}images/ymk/main/banner03.png" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#">
						<img class="img-fluid" src="${projectRes}images/ymk/main/banner04.png" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#">
						<img class="img-fluid" src="${projectRes}images/ymk/main/banner05.png" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#">
						<img class="img-fluid" src="${projectRes}images/ymk/main/banner06.png" alt="">
					</a>
				</div>
		    </div>
		</div>
	</section>
	
	
	<section id="location">
		<h2 class="text-center text-uppercase text-secondary mb-0">location</h2>
   		<hr class="star-dark mb-5">
   		<iframe width="100%" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=%ED%95%9C%EA%B5%AD%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%EC%9D%B8%EC%9E%AC%EA%B0%9C%EB%B0%9C%EC%9B%90&key=AIzaSyDB_MnAbfzP3Tep6MpXBiY7KHTk2PkMoUo" allowfullscreen></iframe>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../guest/common/footerCopyright.jsp" %>
</body>

</html>