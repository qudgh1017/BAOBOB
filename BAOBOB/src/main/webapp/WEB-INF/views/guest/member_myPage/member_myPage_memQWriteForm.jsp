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

<!-- 개인정보 카드 -->
<div class="mybaobob">
	<table class="board">
	    <thead>
	    	<tr>
	    		<td colspan=3>
	    		<span class="text-uppercase bigfont" style="text-align:left">${memId}님</span>&emsp;
				<a href="memPForm"  title="회원정보 수정"><i class="material-icons">edit</i></a>
				<hr style="border: dotted 3px white;">
				<h4 class="text-capitalize" style="text-align:left">고객님은 SVIP입니다.</h4>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td rowspan=2>
					<img class="mybaobob" src="${projectRes}images/lgt/default_img.png">
	    		</td>
		    	<th class="middlefont">POINT</th>
		    	<th class="middlefont">TOTAL POINT</th>
		    </tr>
			<tr>
		        <td class="samllfont">14000점</td>
		        <td class="samllfont">26000점</td>
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
			<a href="memMyPageMain" class="active" style="cursor:pointer">My BAOBOB</a>
			<a href="#" class="active">SERVICE</a>
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
			<form action="memQWritePro" method="post" name="writeform" onsubmit="return writeCheck();">
				<!-- contentForm에서 get방식으로 저장한 num과 ref삼총사를  hidden으로 가지고 있는다. -->
				<!-- 현재페이지에서는 쓸모없지만 submit으로 넘어가는 writePro에서 쓰려고 넘기고 넘기는 과정이다. -->	
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="ref" value="${ref}">
				<input type="hidden" name="ref_step" value="${ref_step}">
				<input type="hidden" name="ref_level" value="${ref_level}">
				
				<table id="mainBody" style="width:800px; margin:auto;">
					<caption>Write Content</caption>
				
					<thead>
						<tr>
							<th style="width:100px">Writer</th>
							<td style="width:150px">${memId}</td>
							
							<th style="width:100px">Passwoard</th>
							<td style="width:150px">
								<input type="password" name="pwd" maxlength="10" style="width:220px;">
							</td>
								
						</tr>
					
						<tr>
							<th>Title</th>
							<th colspan="3">
								<input type="text" name="subject" maxlength="50" style="width:650px;">
							</th>	
						</tr>
					
						<tr>
							<th>Content</th>
							<th colspan="3">
								<textarea rows="10" cols="40" name="content" style="width:650px; text-align:left;"></textarea>
							</th>
						</tr>
						
						<tr>
							<td colspan="4" style="border-bottom:none;">
								<input type="submit" class="button" value="Done">
								<input type="reset" class="button" value="Reset">
								<input type="button" class="button" value="List" onclick="window.location='memQuestion'">	
							</td>	
						</tr>
								
					</thead>
				</table>  
				
	    	</form>
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