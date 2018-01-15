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
			<form action="memLWritePro" method="post" name="writeform" onsubmit="return writeCheck();" enctype="multipart/form-data">
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
							<th>File</th>
							<th colspan="3">
								<input type="file" name="file" maxlength="100" style="width:650px;">
							</th>
						</tr>
						
						<tr>
							<td colspan="4" style="border-bottom:none;">
								<input type="submit" class="button" value="Done">
								<input type="reset" class="button" value="Reset">
								<input type="button" class="button" value="List" onclick="window.location='memLost'">	
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
<%@ include file="../../common/footer.jsp" %>
	
<!-- FooterCopyright -->
<%@ include file="../../common/footerCopyright.jsp" %>
</body>
</html>