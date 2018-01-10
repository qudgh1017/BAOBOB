<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		.p_clear{clear:both}
		.p_li{min-height:500px;}
		.p_img{width:30px;height:30px;}
		.p_btn{background:lightgray;border:transparent;border-radius:0.2em;padding:5px;margin:2px;}
	</style>
	
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script src="${projectRes}ymk/js/script.js"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="../common/navigation.jsp" %>
	
	
 	<div class="content-wrapper">
		<ul class="p_clear">
			<li class="p_li" id="spaceDiv">
			</li>
			<li class="p_li">
				가로 : <input id="widthX" type="number" min="1" max="100" value="0" onchange="spaceDivChange();">
				세로 : <input id="heightY" type="number" min="1" max="100" value="0" onchange="spaceDivChange();"><br>
				<hr>
				<button class="p_btn" onclick="spaceType('4')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_default.png"></button>
				<button class="p_btn" onclick="spaceType('3')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_desabled.png"></button>
				<button class="p_btn" onclick="spaceType('2')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_pregnant_woman.png"></button>
				<button class="p_btn" onclick="spaceType('1')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_electic_car.png"></button>
				<button class="p_btn" onclick="spaceType('0')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_tmp.png"></button>
				<br>
				<button class="p_btn" onclick="spaceType('9')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_enter.png"></button>
				<button class="p_btn" onclick="spaceType('8')"><img class="p_img" src="${projectRes}images/ymk/host_parking/icon_exit.png"></button>
			</li>
			<li>
				<button class="a" value="1" onclick="spaceTypeChange();">등록</button>
			</li>
		</ul>
	</div> 
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>