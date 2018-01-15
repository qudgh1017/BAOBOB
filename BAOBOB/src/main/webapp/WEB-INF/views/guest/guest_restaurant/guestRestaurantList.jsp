<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
   
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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	
	<title>Baobob_Restaurant</title>
    
    <style type="text/css">
     	.head_header{position:relative;}
    	/* .head_screen{top: 0;left: 0;position: absolute;margin-left: 28.5rem;margin-top: 16rem;} */
    	.head_screen{top: 0; left: 0;position: absolute; margin-left: 45%; margin-top: 40%;} 
    	
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

<!-- ======= ajax 스크립트 ======= -->    
<!-- <script type="text/javascript">
	function load(url){
		//서버로 요청해서 통신한 후 응답을 callback 함수로 받겠다.
		//sendRequest(callback, url, method,params){}
		sendRequest(loadnews_callback, url, "post");
		
	}
	function load_get(url,params){
		//서버로 요청해서 통신한 후 응답을 callback 함수로 받겠다.
		//sendRequest(callback, url, method,params){}
		sendRequest(loadnews_callback, url, "get", params);
	}
	/* 
	콜백 함수 : 서버로부터 응답이 오면 동작할 함수(시스템이 자동호출)
				콜백함수명은 sendRequest(콜백함수명)와 동일해야 한다.
				loadnews_callback : 콜백함수, 
	*/
	function loadnews_callback(){
		var result = document.getElementById("result");

		if(httpRequest.readyState==4 ){/* complete 모든 데이터가 취득 완료된 상태 */
			if(httpRequest.status==200 ){/* 정상종료 */
				//result.innerHTML="정상종료";
				/* 	
					응답결과가 html이면 responseText로 받고, XML이면 responseXML로 받는다.
					httpRequest.responseText : news1이 클릭되면 url이 news1이 되고, news1.jsp가 출력, 
					httpRequest.responseText : news2가 클릭되면 url이 news2가 되고, news2.jsp가 출력
				*/
				result.innerHTML= httpRequest.responseText;		
			}else{
				result.innerHTML="에러발생";
			}
		}else{
			result.innerHTML = "상태 : " + httpRequest.readyState;
		}
	
	}
</script> -->
</head>
<body id="page-top">
	
	<%@ include file="../common/head.jsp" %>
	<!-- Baobob-Navigation -->
	<%@ include file="../common/navigation.jsp" %>
	
	
	
	<!--======= Header - 사진  =======-->
	<%-- <header class="bg-primary text-white text-center head_header">
		<div class="head_screen"><!-- container -->
			<h1 class="text-uppercase mb-0">Baobob</h1>
			<h2 class="font-weight-light mb-0">Multiplex Baobob</h2>
		</div>
		<img class="img-fluid mb-5 d-block mx-auto" src="${projectRes}images/mhj/choice/cook_1.jpg">
	</header>  --%>
	<header class="bg-primary text-white text-center head_header" style="background-color: #2c3e50!important;">
	<div class="head_screen"><!-- container -->
		<h1>My Page</h1>
		<h2>Multiplex Baobob</h2>
	</div>
	<img class="img-fluid mb-5 d-block mx-auto" src="${projectRes}images/mhj/choice/cook_1.jpg" width="100%" height="100px">
	<%-- <img class="img-fluid mb-5 d-block mx-auto" 
		style="margin-bottom:0rem!important;"
		src="${projectRes}images/mhj/choice/cook_1.jpg"> --%>
	</header>
	
	
	<!--======= Container - 레스토랑 선택  =======-->
		<!-- 레스토랑 선택 -->
		<!-- Portfolio Grid Section -->
		<section class="pohrertfolio" id="Restaurant">
		  <div class="container">
		    <h2 class="text-center text-uppercase text-secondary mb-0">Restaurant</h2>
		    <hr class="star-dark mb-5">
		    <div class="row">
				<div class="col-lg-4">
					<a class=" d-block mx-auto" href="guestRestaurantMain?restaurant_index=1">
						 <!-- <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div class=" my-auto w-100 text-center text-white">
								<i class="fa fa-search-plus fa-3x"></i>
							</div>
						</div>  -->
						<img class="img-fluid" src="${projectRes}images/mhj/choice/jap_1.jpg" alt="">
					</a>
				</div>
				<div class="col-lg-4">
					<a class="d-block mx-auto" href="guestRestaurantMain?restaurant_index=2">
					<!--<a class="portfolio-item d-block mx-auto" href="guestRestaurantMain?restaurant_index=2">
						 <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							 <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fa fa-search-plus fa-3x"></i>
							</div> 
						</div> -->
						<img class="img-fluid" src="${projectRes}images/mhj/choice/kor_4.jpg" alt="">
					</a>
				</div>
				<div class="col-lg-4">
				<a class=" d-block mx-auto" href="guestRestaurantMain?restaurant_index=3">
				<!-- <a class="portfolio-item d-block mx-auto" href="guestRestaurantMain?restaurant_index=3"> -->
					<!-- <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> -->
					<img class="img-fluid" src="${projectRes}images/mhj/choice/pasta_4.jpg" alt="">
				</a>
				</div>
		    </div>
		  </div>
		</section>
		
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
		<br>
		<div id="contact">contact</div>
	
	<!-- Footer -->
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
	<!-- Footer -->
	<%@ include file="../common/footerCopyright.jsp" %>
	<!--======= Footer 시작=======-->
</body>
</html>