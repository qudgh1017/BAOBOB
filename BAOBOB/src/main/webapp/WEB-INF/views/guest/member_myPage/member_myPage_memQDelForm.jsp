<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<form action=memQDelPro method="post" name="pwdform" onsubmit="return pwdCheck();">
				<!-- hidden : submit일 경우 input태그에 보이지 않는값을 넘기고 싶을때. -->
				<!-- contentForm에서 get방식으로 넘겨준 num, pageNum을 modifyView로 넘긴다. -->	
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				
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
							<th><input type="password" name="pwd" maxlength="20"></th>
						</tr>
						
						<tr>
							<th colspan="2" style="border-bottom:none; text-align:center">
								<input type="submit" class="button" value=" Delete">
								<input type="reset" class="button" value="Cancle"
									onclick="window.history.back()">
							</th>	
						</tr>
					</tbody>
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