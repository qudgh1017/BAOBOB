<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../common/head.jsp" %>

<!-- Navigation -->
<%@ include file="../../common/navigation.jsp" %>

<!-- 개인정보 카드 -->
<%@ include file="../../common/memberCard.jsp" %>

<section class="mypageSection">
<table class=board>
	<tr>
		<!-- 사이드 메뉴 -->
		<%@ include file="../../common/sideMenu.jsp" %>	

		<!-- 알맹이 -->
		<td style="padding:0px;margin:0px;width:100%;height:100%;">
			<form action=memLDelPro method="post" name="pwdform" onsubmit="return pwdCheck();">
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
<%@ include file="../../common/footer.jsp" %>
	
<!-- FooterCopyright -->
<%@ include file="../../common/footerCopyright.jsp" %>
</body>
</html>