<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link href="${projectRes}/ybh/css/head.css" rel="stylesheet" type="text/css">
<link href="${projectRes}/ybh/css/search.css" rel="stylesheet" type="text/css">
</head>
<html>
<body>
<header class="mainmenu text-black text-center">
	<div style="width:100%; height:60px; background-color:orange;">
 		<div style="height:10px;"></div>
		<div class="container" style="height:40px;">
			<div class="row">
				<div class="col-md-1"><a href="guestRestaurantList"><h2>YUMMY</h2></a></div>
				<div class="col-md-1"></div>
				<div class="col-md-2">
					  <button class="btn" type="button" id="dropdownMenu1">
					    	<a href="guestRestaurantMain?restaurant_index=${restaurant_index}">식당 안내</a>
					    <span class="caret"></span>
					  </button>
				</div>
		  		<div class="col-md-2">
					  <button class="btn" type="button" id="dropdownMenu1" >
					    	<a href="guestRestaurant_menu?restaurant_index=${restaurant_index}">메뉴</a>
					    <span class="caret"></span>
					  </button>
		  		</div>
		 		<div class="col-md-2">
					  <button class="btn" type="button" id="dropdownMenu1">
					    	<a href="guestRestaurant_reserv?restaurant_index=${restaurant_index}">예약</a>
					    <span class="caret"></span>
					  </button>
		 		</div>
		 		<div class="col-md-2">
					  <button class="btn" type="button" id="dropdownMenu1">
					    	<a href="guestRestaurant_review?restaurant_index=${restaurant_index}">리뷰</a>
					    <span class="caret"></span>
					  </button>
					  
		 		</div>
		 		<div class="col-md-2">
		 			<%-- <div class="container">
						<div class="row">
					        <div class="span12">
					        	
					            <form id="custom-search-form" class="form-search form-horizontal pull-right">
					                <div class="input-append span12">
					                    <input type="text" class="search-query" placeholder="검색" style="width:100px">
					                    <input type="image" name="submit" src="${projectRes}images/ybh/search.png" value="" style="width:40px; height:40px"/>
					                    <button type="submit" class="btn"></button>
					                </div>
					            </form>
					        </div>
						</div>
					</div> --%>
		 		</div>
			</div>
		</div>
	</div>
</header>	
</body>
</html>