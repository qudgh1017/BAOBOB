<!-- 영화페이지 메뉴단(토글 사용) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link href="${projectRes}/ybh/css/head.css" rel="stylesheet" type="text/css">
</head>
<html>
<body>
<header class="mainmenu text-black text-center">
	<div style="width:100%; height:100px; background-image: url('/baobob/resources/images/ybh/movie_menu.jpg');">
		<div style="height:40px;"></div>
		<div class="container" style="height:60px;">
			<div class="row">
				<!-- 영화 로고 -->
				<div class="col-md-2"><a href="guest_movie"><h2>BAOBOX</h2></a></div>
				<div class="col-md-1"></div>
				<!-- 영화 탭 -->
				<div class="col-md-3">
					<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					    <a href="movie">영화</a>
					  	<span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background-image: url('${projectRes}images/ybh/movie_menu.jpg'); background-size: 140px 120px;">
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="movieChart?movie_state=1">무비차트</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="hdTrailer">HD 트레일러</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="movieFinder?movie_state=1">무비파인더</a></li>
					  </ul>
					</div>
				</div>
				<!-- 예매 탭 -->
		  		<div class="col-md-3">
		  			<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
				    	<a href="ticket">예매</a>
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background-image: url('${projectRes}images/ybh/movie_menu.jpg'); background-size: 140px 120px;">
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="movieTicket">빠른예매</a></li>
					  </ul>
					</div>
		  		</div>
		  		<!-- 극장 탭 -->
		 		<div class="col-md-3">
		 			<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
				    	<a href="theater">극장</a>
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background-image: url('${projectRes}images/ybh/movie_menu.jpg'); background-size: 140px 120px;">
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="theaters">BAOBOX 극장</a></li>
					  </ul>
					</div>
		 		</div>
			</div>
		</div>
	</div>
</header>	
</body>
</html>