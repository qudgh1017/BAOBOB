<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.mvc.baobob.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>       
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	/* 위시리스트 */
	$(document).ready(function() {
		$('#wishList').on('click', function() {   
			var object = new Object();
			var jsonData = JSON.stringify(object);
			$.ajax({
				//GET방식의 URL
				url : '${pageContext.request.contextPath}/wishList',
				type : 'GET',
				success : function(msg) {
					/* alert("success"); */  
					/* alert(msg); */  
					$('#result').html(msg);  
				},
				error : function() {
					alert("error");
				}
			});
		});		
	});
	
</script>

<style type="text/css">
	.button{
		margin-left:50px; 
		margin-right:50px;
		background-color: 487752; 
		border-radius:20px; 
		width:150px; 
		height:80px;
		font-family: Montserrat;
		font-size:20px;
		font-weight:900;
	}		
</style>

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
			<td style="padding:0rem 10rem; margin:0px;width:100%;height:100%;">
				<table id="mainBody">
					<caption style="margin-bottom:0px!important">무비 로그</caption>
					<thead>
				    <tr>
				    	<th>
				    		<input type="button" id="wishList" class="button" value="위시리스트">
				    		<input type="button" id="#!" class="button" value="내가 본 영화 ">
				    		<input type="button" id="#!" class="button" value="무비다이어리">
				    	</th>
				    </tr>
				    
				    <tr id="result">
				    	<!-- 결과 출력위치 -->
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