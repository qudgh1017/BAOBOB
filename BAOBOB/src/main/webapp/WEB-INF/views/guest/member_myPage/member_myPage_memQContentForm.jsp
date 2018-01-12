<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<!-- 개인정보 카드 -->
<div class="mybaobob">
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

<section class="mypageSection">
<table class=board>
	<tr>
		<td>
		<!-- SIDE MENU -->
		<div class="vertical-menu">
			<a href="memMyPageMain" class="active">My BAOBOB</a>
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
			<a href="memQuestion">1 : 1 문의</a>
			<a href="#">분실물 문의</a>
		</div>
		</td>

		<!-- 알맹이 -->
		<td style="padding:0px;margin:0px;width:100%;height:100%;">
			<table class="mainBody">
				<caption>1 : 1 문의</caption>
				<thead>
					<tr>
						<th style="width:150px">Number</th>
						<td style="width:150px">${number}</td>
						
						<th style="width:150px">ReadCnt</th>
						<td style="width:150px">${dto.board_readCnt}</td>
					</tr>
					<tr>
						<th style="width:150px">Writer</th>
						<td style="width:150px">${dto.member_id}</td>
						
						<th style="width:150px">Date</th>
						<td style="width:150px" align="center">
							<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.board_reg_date}" />
						</td>
					</tr>
					<tr>
						<th>Title</th>
						<th colspan="3" style="text-align:left;">${dto.board_subject}</th>
					</tr>
					<tr>
						<th colspan="4" style="text-align:left; height:200px;">${dto.board_content}</th>
					</tr>
					<tr>
						<td colspan="4" style="border-bottom:none;">
							<input type="button" class="button" value="Modify"
								onclick="window.location='memQModifyForm?num=${dto.board_index}&pageNum=${pageNum}'">
							<input type="button" class="button" value="Delete"
								onclick="window.location='memQDelForm?num=${dto.board_index}&pageNum=${pageNum}'">
							<input type="button" class="button" value="Reply"
								onclick="window.location='memQWriteForm?num=${dto.board_index}&ref=${dto.board_ref}&ref_step=${dto.board_ref_step}&ref_level=${dto.board_ref_level}'">	
							<input type="button" class="button" value="List"
								onclick="window.location='memQuestion?pageNum=${pageNum}'">
						</td>	
					</tr>
				</thead>
			</table>  
		</td>
		<!-- 알맹이 끝 -->
	</tr>
</table>


</section>
	
<!-- Footer -->
<%@ include file="../common/footer.jsp" %>
	
<!-- FooterCopyright -->
<%@ include file="../common/footerCopyright.jsp" %>
</body>
</html>