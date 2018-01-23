<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/setting.jsp"%>
    
<html>
<head>
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
<title>레스토랑 메뉴</title>
</head>
<body>

<!--======= Header 시작 =======-->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Baobob Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	
	<!-- 레스토랑 메뉴 -->
	<%@ include file="/WEB-INF/views/guest/guest_restaurant/restaurantMenu.jsp" %>
	
	<!--===== Header 식당1-사진 =====-->
	<%-- <header class="bg-primary text-white text-center head_header" style="background-color: #2c3e50!important;">
	<div class="head_screen"><!-- container -->
		<h1>Japanese Food</h1>
		<!-- <h2>Multiplex Baobob</h2> -->
	</div>
	<img class="img-fluid mb-5 d-block mx-auto" src="${projectRes}images/mhj/choice/jap_2.jpg" width="100%" height="100px">
	</header> --%>
	<!--======= Header 종료 =======-->
	
	<section>
		<div class="container">
			<c:if test="${restaurant_index==1}"> 
				<div class="row">
					<div class="col-md-offset-1"></div>
					<div class="col-md-10">
						<br>
						<h3 align=left;>どきどきDokidoki</h3>
						<hr style="border:2px solid black;">
					</div>
					<div class="col-md-offset-1"></div>
				</div>
			</c:if>
			<c:if test="${restaurant_index==2}"> 
				<div class="row">
					<div class="col-md-offset-1"></div>
					<div class="col-md-10">
						<br>
						<h3 align=left;>바압</h3>
						<hr style="border:2px solid black;">
					</div>
					<div class="col-md-offset-1"></div>
				</div>
			</c:if>
			<c:if test="${restaurant_index==3}"> 
				<div class="row">
					<div class="col-md-offset-1"></div>
					<div class="col-md-10">
						<br>
						<h3 align=left;>BOUTBACK</h3>
						<hr style="border:2px solid black;">
					</div>
					<div class="col-md-offset-1"></div>
				</div>
			</c:if>
			
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10">
				<!--====== Container 시작 ======-->
				<!-- <div class="container"> -->
				
					<h2>메뉴 갯수: ${cnt}</h2>					
					<hr style="border:2px solid black;">
					<br>
					
					<c:if test="${cnt>0}">
						<c:forEach var="dto" items="${dtos}">
							<%-- ${restaurant_index}<br>
							${dto.restaurant_tel}<br>
							${dto.restaurant_name}<br> --%>
							번호 : ${dto.restaurant_menu_index}<br>
							사진 : ${dto.restaurant_menu_img}<br>
							이름 : ${dto.restaurant_menu_name}<br>
							설명 : ${dto.restaurant_menu_content}<br>
							가격 : ${dto.restaurant_menu_price}<br>
							<br>
							<br>
						</c:forEach>
					</c:if>
					
					<c:if test="${cnt==0}">
					메뉴가 없서요.
					</c:if>
				<!-- </div> -->
				<!--====== Container 종료 ======-->
				</div>
				<div class="col-md-offset-1"></div>
			</div>
		</div>
	</section>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
	<!-- Footer -->
</body>
</html>