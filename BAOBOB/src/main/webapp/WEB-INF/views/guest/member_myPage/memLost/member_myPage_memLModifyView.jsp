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
			<c:if test="${selectCnt == 1 }">
			<form action="memLModifyPro" method="post" name="modifyform" onsubmit="return boardModifyCheck();">
			
				<!-- hidden : submit일 경우 input태그에 보이지 않는값을 넘기고 싶을때. -->
				<!-- modifyForm에서 hidden으로 넘겨준 num, pageNum을 또다시 "modifyPro"로 넘긴다 -->
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="pageNum" value="${pageNum}">	
		
				<table id="mainBody" style="width:800px; margin:auto;">
					<caption>Modify Content</caption>
				
					<thead>
						<tr>
							<th style="width:100px">Writer</th>
							<td style="width:150px">${dto.member_id}</td>
							
							<th style="width:100px">Passwoard</th>
							<td style="width:150px">
								<input type="password" name="pwd" maxlength="10" value="${dto.board_pwd}" style="width:220px;">
							</td>
								
						</tr>
					
						<tr>
							<th>Title</th>
							<th colspan="3">
								<input type="text" name="subject" maxlength="50" value="${dto.board_subject}" style="width:650px;">
							</th>	
						</tr>
					
						<tr>
							<th>Content</th>
							<th colspan="3">
								<textarea rows="10" cols="40" name="content" style="width:650px; text-align:left;">
								${dto.board_content}
							</textarea>
							</th>
						</tr>
						
						<tr>
							<th>File</th>
							<th colspan="3">
								<input type="file" name="file" maxlength="100" value="${dto.board_img}" style="width:650px;">
							</th>
						</tr>
						
						<tr>
							<td colspan="4" style="border-bottom:none;">
								<input type="submit" class="button" value="Modify">
								<input type="reset" class="button" value="Reset">
								<input type="button" class="button" value="Cancle"
									onclick="window.location='memLost?pageNum=${pageNum}'">	
							</td>	
						</tr>
								
					</thead>
				</table>  		
			</form>
			</c:if>
			<c:if test="${selectCnt != 1 }">
				<script type="text/javascript">
					errorAlert(pwdError);
				</script>
			</c:if>
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