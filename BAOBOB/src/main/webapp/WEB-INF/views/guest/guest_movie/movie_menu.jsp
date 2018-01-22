<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link href="${projectRes}/ybh/css/head.css" rel="stylesheet" type="text/css">
<link href="${projectRes}/ybh/css/search.css" rel="stylesheet" type="text/css">
<!-- JQuery쓰기위해 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
</head>
<html>
<body>
<header class="mainmenu text-black text-center">
	<div style="width:100%; height:100px; background-image: url('/baobob/resources/images/ybh/movie_menu.jpg');">
		<div style="height:40px;"></div>
		<div class="container" style="height:60px;">
			<div class="row">
				<div class="col-md-1"><a href="guest_movie"><h2>BAOBOX</h2></a></div>
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					    <a href="movie">영화</a>
					  	<span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background-image: url('${projectRes}images/ybh/movie_menu.jpg'); background-size: 140px 120px;">
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="movieChart?movie_state=1">무비차트</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="hdTrailer">HD 트레일러</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="movieFinder">무비파인더</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="movieReview">평점</a></li>
					  </ul>
					</div>
				</div>
		  		<div class="col-md-2">
		  			<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					    	<a href="ticket">예매</a>
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background-image: url('${projectRes}images/ybh/movie_menu.jpg'); background-size: 140px 120px;">
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="movieTicket">빠른예매</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="movieSchedule">상영시간표</a></li>
					  </ul>
					</div>
		  		</div>
		 		<div class="col-md-2">
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
		 		<div class="col-md-2">
		 			<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					    	<a href="event">이벤트&컬처</a>
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background-image: url('${projectRes}images/ybh/movie_menu.jpg'); background-size: 140px 120px;">
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="eventMembership">멤버쉽</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="eventSale">제휴/할인</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="eventPreview">무대인사</a></li>
					  </ul>
					</div>
		 		</div>
		 		<div class="col-md-2">
		 			<div class="container">
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
					</div>
		 		</div>
			</div>
		</div>
	</div>
</header>	
</body>
</html>