<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="spring.mvc.baobob.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>      
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1 : 1 문의</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

</script>

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
<table class="board">
	<tr>
		<td>
			<!-- SIDE MENU -->
			<div class="vertical-menu">
				<a href="memMyPageMain" class="active" style="cursor:pointer">My BAOBOB</a>
				<a href="#!" class="active">SERVICE</a>
				<a href="#!">회원 등급</a>
				<a href="#!">포인트/쿠폰</a>
				<a href="#!">방문 내역</a>
				<a href="#!" class="active">MOVIE</a>
				<a href="#!">무비 로그</a>
				<a href="#!">예매 내역</a>
				<a href="#!" class="active">RESTAURANT</a>
				<a href="#!">레스토랑 로그</a>
				<a href="#!">레스토랑 예약</a>
				<a href="#!" class="active">문의 내역</a>
				<a href="memQuestion">1 : 1 문의</a>
				<a href="#!">분실물 문의</a>
			</div>
		</td>
		
	<!-- 알맹이td -->
		<td style="padding:0px;margin:0px;width:100%;height:100%;">
			<form action=memPModifyView method="post" name="pwdform" onsubmit="return pwdCheck();">
				<table id="mainBody" style="margin:auto; width:200px;">
					<caption>Check Password</caption>
					<thead>
						<tr>
							<th colspan="2">Check your password</th>
						</tr>	
					</thead>
			
					<tbody>
						<tr>
							<th>Password</th>
							<th><input type="password" name="pwd" maxlength="30" value="member_pwd 01"></th>
						</tr>
						
						<tr>
							<th colspan="2" style="border-bottom:none; text-align:center">
								<input type="submit" class="button" value=" Modify">
								<input type="reset" class="button" value="Cancle"
									onclick="window.location='memMyPageMain'">
							</th>	
						</tr>
					</tbody>
				</table>		
			</form>
		</td>
	</tr>
</table>
</section>

<!-- Footer -->
<%@ include file="../common/footer.jsp" %>
	
<!-- FooterCopyright -->
<%@ include file="../common/footerCopyright.jsp" %>	
</body>
</html>