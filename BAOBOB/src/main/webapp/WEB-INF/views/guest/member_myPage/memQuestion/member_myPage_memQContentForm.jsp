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
		<td style="padding:0rem 10rem; margin:0px;width:100%;height:100%;">
			<table id="mainBody">
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
<%@ include file="../../common/footer.jsp" %>
	
<!-- FooterCopyright -->
<%@ include file="../../common/footerCopyright.jsp" %>
</body>
</html>