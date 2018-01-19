<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
<!-- slide -->
<!-- slide 기능 사용위한 라이브러리 -->
<%-- <link href="${projectRes}ybh/css/slick.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${projectRes}ybh/js/slick.min.js"></script>
<script type="text/javascript" src="${projectRes}ybh/js/slide.js"></script>	
 --%>	
	<style type="text/css">
		.bg{background:black;height:620px;}
		.slider{position:relative;width:1110px;height:620px;overflow:hidden;margin:0 auto;}
		.slider img{position:absolute;top:0;width:100%;height:100%;}
	</style>
</head>
<body>
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	<section class="bg">
		<div class="slider">
			<!-- <iframe class="itemL" width="1903" height="750" src="https://www.youtube.com/embed/FcEpyaDWdJM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			<iframe class="itemR" width="1903" height="750" src="https://www.youtube.com/embed/5O5PVvHTWRo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			<iframe class="itemR" width="1903" height="750" src="https://www.youtube.com/embed/_DkF1V30OCo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> -->
			<img class="item" src="${projectRes}images/ybh/movie1.jpg">
			<img class="item" src="${projectRes}images/ybh/movie2.jpg">
			<img class="item" src="${projectRes}images/ybh/movie3.jpg">
			<img class="item" src="${projectRes}images/ybh/movie4.jpg">
		</div>
	</section>
	
	
	<section>
		<div class="container">
						
						
					<%-- <jsp:include page="/WEB-INF/views/guest/guest_movie/mainPoster.jsp"/> --%>
					
					<%-- <%@ include file="/WEB-INF/views/guest/guest_movie/mainPoster.jsp" %> --%>
			<div id="ajax">
				<!-- 값들 출력될곳 -->
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
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %>
	
	<script>
		var x = 1110; //가로 초기화
		var slider = document.getElementById('slider'); //슬라이더 객체
		var slides = document.getElementsByClassName('item'); //슬라이드
		var slideMax = slides.length - 1; //마지막 슬라이드 idx
		var curSlideNo = 0; //현재 슬라이드 idx
		
		//슬라이드 정렬
		for(var i = 0; i <= slideMax; i+= 1) {
			if(i == curSlideNo) {
				slides[i].style.left = 0;
			} else {
				slides[i].style.left = -x + 'px';
			}
		}
		
		var aniStart = false; //애니메이션 재생 버튼
		var next = 1; //다음 슬라이드 idx 초기값
		
		function slideChange() {
			if(aniStart == true) {
				 return;
			}
			next = curSlideNo + 1; 
			if(next > slideMax) { //다음 슬라이드 idx가 마지막 idx보다 크면 초기화
				next = 0;
			}
			aniStart = true;
			sliding();
		}
		
		function sliding() {
			var curX = parseInt(slides[curSlideNo].style.left, 10); //현재 슬라이드 좌측 좌표. 10진수
			var nextX = parseInt(slides[next].style.left, 10); //다음 슬라이드 좌측 좌표, 10진수
			var newCurX = curX + 10;
			var newNextX = nextX + 10;
			
			//슬라이더 가로를 벗어나면
			if(newCurX >= x) {
				slides[curSlideNo].style.left = -x + 'px';
				slides[next].style.left = 0;
				curSlideNo = curSlideNo + 1; //현재 번호 up
				if(curSlideNo > slideMax) {
					curSlideNo = 0;
				}
				aniStart = false;
				return;
			}
			slides[curSlideNo].style.left = newCurX + 'px';
			slides[next].style.left = newNextX + 'px';
			setTimeout(function() {
				sliding();
			}, 20);
		}
		setInterval(slideChange(), 2000); //http://webskills.kr/archives/44
	</script>
</body>
</html>