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
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">상영영화</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">상영예정작</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">추천영화</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">무비파인더</a></li>
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
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">예매가이드</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">빠른예매</a></li>
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
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">극장소개</a></li>
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
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">멤버쉽</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">제휴/할인</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">무대인사</a></li>
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