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
<%@ include file="../../common/head.jsp" %>

<!-- Navigation -->
<%@ include file="../../common/navigation.jsp" %>

<!-- 개인정보 카드 -->
<%@ include file="../../common/memberCard.jsp" %>

<section class="mypageSection">
<table class="board">
	<tr>
		<!-- 사이드 메뉴 -->
		<%@ include file="../../common/sideMenu.jsp" %>	
		
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
							<th><input type="password" name="pwd" maxlength="30"></th>
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
<%@ include file="../../common/footer.jsp" %>
	
<!-- FooterCopyright -->
<%@ include file="../../common/footerCopyright.jsp" %>	
</body>
</html>