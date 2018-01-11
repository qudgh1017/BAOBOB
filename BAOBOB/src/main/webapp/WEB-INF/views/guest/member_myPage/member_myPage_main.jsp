<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
	.mybaobob {
		background-color: red;
		padding: 0rem 0rem;
		margin-bottom: 2rem;
		border-radius: 0.3rem;
	}
</style> -->
</head>
<body>
	<%@ include file="../common/head.jsp" %>
	
	<!-- Navigation -->
	<%@ include file="../common/navigation.jsp" %>
	
	<!-- Header -->
	<header class="bg-primary text-white text-center head_header" style="background-color: #2c3e50!important;">
		<div class="head_screen"><!-- container -->
			<h1>My Page</h1>
			<h2>Multiplex Baobob</h2>
		</div>
		<img class="img-fluid mb-5 d-block mx-auto" 
			style="margin-bottom:0rem!important;"
			src="${projectRes}images/lgt/test(2).jpg">
	</header>
	
	<div class="mybaobob">
		<!-- <span class="text-uppercase bigfont">Gunny님</span>&emsp;
		<a href="#!" title="modify" id="modify"><i class="material-icons">edit</i></a>
		<hr style="border: dotted 3px white;">
		<h4 class="text-capitalize">고객님은 SVIP입니다.</h4> -->
		<br><br>
		<table class="board">
		    <thead>
		    	<tr>
		    		<td colspan=3>
		    		<span class="text-uppercase bigfont" style="text-align:left">Gunny</span>&emsp;
					<a href="#!" title="modify" id="modify"><i class="material-icons">edit</i></a>
					<hr style="border: dotted 3px white;">
					<h4 class="text-capitalize" style="text-align:left">고객님은 SVIP입니다.</h4>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td rowspan=2>
						<img class="mybaobob" src="${projectRes}images/lgt/default_img.png">
		    		</td>
			    	<th class="middlefont">B POINT</th>
			    	<th class="middlefont">B CLASS</th>
			    </tr>
				<tr>
			        <td class="samllfont">14000점</td>
			        <td class="samllfont">SVIP</td>
			    </tr>
		    </thead>
		</table>
	</div>
	
	<div class="vertical-menu">
		<a href="#" class="active">SERVICE</a>
		<a href="#">정보 수정</a>
		<a href="#">회원 등급</a>
		<a href="#">포인트/쿠폰</a>
		<a href="#">방문 내역</a>
		<a href="#" class="active">MOVIE</a>
		<a href="#">무비 로그</a>
		<a href="#">예매 내역</a>
		<a href="#" class="active">RESTAURANT</a>
		<a href="#">레스토랑 로그</a>
		<a href="#">레스토랑 예약</a>
		<a href="#" class="active">문의 내역</a>
		<a href="#">1:1 문의</a>
		<a href="#">분실물 문의</a>
	</div>
	

	
		
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
		
	<!-- FooterCopyright -->
	<%@ include file="../common/footerCopyright.jsp" %>
</body>
</html>