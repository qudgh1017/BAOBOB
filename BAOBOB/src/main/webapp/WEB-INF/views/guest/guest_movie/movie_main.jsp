<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
	<style type="text/css">
		.bg{clear:both;width:fit-content;min-height:405px;margin:0 auto;}
		#item_l{float:left;width:280px;height:405px;}
		.slider{float:left;position:relative;width:720px;height:405px;overflow:hidden;}
		.slider img{position:absolute;top:0;width:100%;height:100%;}

		#item_r{float:left;width:280px;height:405px;background:floralwhite;}
		.office_top{height:40px;background:#2a2e33;color:white;text-align:center;line-height:2rem;vertical-align:baseline;margin:0;}
		.em{font-weight:bold;margin-right:15px;font-size:20px;}
		.li{padding:10px 20px;}
		
		.slider_btn_area{clear:both;position:absolute;bottom:0;left:20rem;}
		 .slider_btn_li{float:left;}
		 .slider_btn{width:10px;height:10px;border-radius:100%;margin:5px;}
		 .s_w{background:white;}
		 .s_g{background:gray;}
		
		.yu_modal{display:none;position:fixed;top:0;left:0;right:0;bottom:0;z-index:1050;background:black;}
		.youtu{width:100%;}
		#you_btn{text-align:right;display:block;padding-right:10px;color:white;}

		.con_img{margin:0 auto;margin-top:90px;width:1280px;}		/* padding-left:25px; */
		.th_img{width:200px;height:300px;margin:0 10px;}
		.img_btn{width:50px;height:auto;}
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
		<img id="item_l" src="${projectRes}images/ybh/movie1_1.jpg">
		<div class="slider">
			<a onclick="youtube('1')"><img class="item" src="${projectRes}images/ybh/movie1.jpg" title="1987"></a>
			<a onclick="youtube('2')"><img class="item" src="${projectRes}images/ybh/movie2.jpg" title="코코"></a>
			<a onclick="youtube('3')"><img class="item" src="${projectRes}images/ybh/movie3.jpg" title="메이즈 러너"></a>
			<a onclick="youtube('4')"><img class="item" src="${projectRes}images/ybh/movie4.jpg" title="다운 사이징"></a>
			<ul class="slider_btn_area">
				<li class="slider_btn_li"><button class="slider_btn s_w" type="button" onclick="slider_btn('0');"></button>
				<li class="slider_btn_li"><button class="slider_btn s_g" type="button" onclick="slider_btn('1');"></button>
				<li class="slider_btn_li"><button class="slider_btn s_g" type="button" onclick="slider_btn('2');"></button>
				<li class="slider_btn_li"><button class="slider_btn s_g" type="button" onclick="slider_btn('3');"></button>
			</ul>
			
		</div>
		<ul id="item_r">
			<c:set var="number" value="1"/>
			<li><p class="office_top">영화 인기 순위</p>
			<c:forEach var="mov" items="${rank}">
				<li class="li">
					<em class="em">${number}</em>
					<a href="movieDetail?movie_index=${mov.movie_index}">${mov.movie_title}</a>
					<c:set var="number" value="${number + 1}"/>
				</li>
			</c:forEach> 
		</ul>
	</section>
	
	<section>
		<div class="con_img">
		
			<h3>현재 상영 영화</h3>
			<hr style="border:2px solid black;">
		
			<c:if test="${start > postSize}">
				<button type="button" onclick="window.location='guest_movie?pageNum=${pageNum - 1}';">
					<img class="img_btn" src="${projectRes}images/ybh/right.png" style="transform:rotate(180deg);">
				</button>
			</c:if>
			<c:forEach var="movie" items="${movieList}">
				<a href="movieDetail?movie_index=${movie.movie_index}">
					<img class="th_img" src="${projectRes}images/phc/${movie.movie_poster}">
				</a>
			</c:forEach>
			<c:if test="${end < movieCnt}">
				<button type="button" onclick="window.location='guest_movie?pageNum=${pageNum + 1}';">
					<img class="img_btn" src="${projectRes}images/ybh/right.png">
				</button>
			</c:if>
		</div>
	</section>
	
	
	<!-- Portfolio Modal 1 -->
	<div class="yu_modal" id="yu_modal">
		
	</div>
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %>
	
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script>
		var x = 720; //가로 초기화
		var slider = document.getElementById('slider'); //슬라이더 객체
		var slides = document.getElementsByClassName('item'); //슬라이드
		var slideMax = slides.length - 1; //마지막 슬라이드 idx
		
		var curSlideNo = 0; //현재 슬라이드 idx
		var next = 1; //다음 슬라이드 idx 초기값
		
		var slideStop = false; //슬라이드 움직임 제어
		var btn = document.getElementsByClassName('slider_btn');
		
		setInterval('slideChange()', 3000); //http://webskills.kr/archives/44
		
		//슬라이드 정렬
		for(var i = 0; i <= slideMax; i+= 1) {
			if(i == curSlideNo) {
				slides[i].style.left = 0;
			} else {
				slides[i].style.left = -x + 'px';
			}
		}
		
		var aniStop = false; //애니메이션 재생 버튼
		
		function slideChange() {
			if(!slideStop) {
				next = (curSlideNo-0) + 1; 
				if(next > slideMax) { //다음 슬라이드 idx가 마지막 idx보다 크면 초기화
					next = 0;
				}
			
				console.log(curSlideNo + "/" + next);
				aniStop = true;
				sliding();
			}
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
				
				curSlideNo = (curSlideNo-0) + 1; //현재 번호 up
				if(curSlideNo > slideMax) {
					curSlideNo = 0;
				}
				document.getElementById('item_l').setAttribute('src', '${projectRes}images/ybh/movie' + (curSlideNo + 1) +'_1.jpg');
				
				//버튼
				var prev = (curSlideNo-0) - 1;
				if(prev == -1) {
					btn[3].setAttribute('class', 'slider_btn s_g');
				} else {
					btn[prev].setAttribute('class', 'slider_btn s_g');
				}
				btn[curSlideNo].setAttribute('class', 'slider_btn s_w');
				
				aniStop = false;
			} else {
				slides[curSlideNo].style.left = newCurX + 'px';
				slides[next].style.left = newNextX + 'px';
				setTimeout(function() {
					sliding();
				}, 20);
			}
		}
		
		//영상
		function youtube(number) {
			var str = '<a id="you_btn" onclick="youtube_close();"><i class="fa fa-3x fa-times"></i></a>';
			switch(number) {
			case '1': str += '<iframe class="youtu" width="1903" height="750" src="https://www.youtube.com/embed/FcEpyaDWdJM?&autoplay=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'; break;
			case '2': str += '<iframe class="youtu" width="1280" height="720" src="https://www.youtube.com/embed/LmS5KMJTWlA?&autoplay=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'; break;
			case '3': str += '<iframe class="youtu" width="1903" height="750" src="https://www.youtube.com/embed/_DkF1V30OCo?&autoplay=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'; break;
			case '4': str += '<iframe class="youtu" width="1280" height="720" src="https://www.youtube.com/embed/NREPEKJwxpY?&autoplay=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'; break;
			}
			var modal = document.getElementById('yu_modal');
			modal.innerHTML = str;
			modal.style.display = 'block';
			
		}
		
		//영상 재생 화면 상단 버튼 => 영상 종료
		function youtube_close(){
			document.getElementById('yu_modal').style.display = '';
		}
		
		//영화 순위
		setInterval('rankListChange()', 3000);
		function rankListChange() {
			sendRequest(rankListChange_callback, 'gMovieMainRankUpdate', 'GET', '');
		}
		function rankListChange_callback() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					document.getElementById('item_r').innerHTML = httpRequest.responseText;
				}
			}
		}
		
		//슬라이드 버튼
		function slider_btn(idx) {
			slideStop = true;
			
			for(var i = 0; i < btn.length; i += 1) {
				if(idx == i) {
					btn[idx].setAttribute('class', 'slider_btn s_w');
					slides[i].style.left = 0;
				} else {
					btn[i].setAttribute('class', 'slider_btn s_g');
					slides[i].style.left = -x + 'px';
				}
			}
			document.getElementById('item_l').setAttribute('src', '${projectRes}images/ybh/movie' + ((idx-0) + 1) +'_1.jpg');
			
			curSlideNo = idx;
			
			setTimeout(function() {
				slideStop = false;
			}, 5000);
		}
	</script>
</body>
</html>