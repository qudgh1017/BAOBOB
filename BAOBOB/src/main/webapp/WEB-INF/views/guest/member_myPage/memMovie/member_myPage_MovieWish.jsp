<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.mvc.baobob.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>       
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>

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
			<table id="mainBody" style="width:800px; margin:auto;">
				<thead>
			    <tr>
			    	<th colspan="7">
			    		<input type="button" class="button" value="위시 리스트" onclick="window.location='memMyPageMain'" style="background-color: 487752; border-radius:20px; width:150px; height:80px;">
			    		<input type="button" class="button" value="내가 본 영화 " onclick="window.location='memMyPageMain'" style="background-color: 487752; border-radius:20px; width:150px; height:80px;">
			    		<input type="button" class="button" value="무비 다이어리" onclick="window.location='memMyPageMain'" style="background-color: 487752; border-radius:20px; width:150px; height:80px;">
			    	</th>
			    </tr>
			    <tr>
			    	<th style="width:30%">위시 리스트</th>
			    </tr>
			    <tr>
			    	<td colspan="7">
			    		
			    	</td>
			    </tr>
			    </thead>
			</table>		
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