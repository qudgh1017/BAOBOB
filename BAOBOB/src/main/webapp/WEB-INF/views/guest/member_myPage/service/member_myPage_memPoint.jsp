<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="spring.mvc.baobob.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>      
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1 : 1 문의</title>
</head>
<body>
<c:if test="${sessionScope.memId != null}">
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
			
			<td style="padding:0rem 5rem; margin:0px;width:100%;height:100%;">
			<table id="mainBody">
				<caption>포인트 안내</caption>
			    <thead>
				    <tr>
				    	<th colspan="2" style="font-size:20px">회원 등급</th>
				    </tr>
				    <tr>
				    	<th style="font-size:20px">필요 누적 포인트</th>
				    	<th style="font-size:20px">고객 등급</th>
				    </tr>
			    </thead>
			    <tbody>
					<tr>
						<td>0 ~ 15000 point</td>
						<td>일반 회원</td>
					</tr>
					<tr>
						<td>15001 ~ 30000 point</td>
						<td>VIP</td>
					</tr>	
					<tr>
						<td>30001 ~ 45000 point</td>
						<td>VVIP</td>
					</tr>	
					<tr>
						<td>45001 ~ point</td>
						<td>SVIP</td>
					</tr>				    
			    </tbody>
			</table>
			
			<br><br>
			
			<table id="mainBody">
			    <thead>
				    <tr>
				    	<th colspan="3" style="font-size:20px">할인 안내</th>
				    </tr>
				    <tr>
				    	<th style="font-size:20px">사용처</th>
				    	<th style="font-size:20px">고객 등급</th>
				    	<th style="font-size:20px">할인율</th>
				    </tr>
			    </thead>
			    
			    <tbody>
					<tr>
						<th rowspan="4">BAO밥</th>
						<td>일반 회원</td>
						<td>5 %</td>
					</tr>
					<tr>
						<td>VIP</td>
						<td>10 %</td>
					</tr>
					<tr>
						<td>VVIP</td>
						<td>15 %</td>
					</tr>
					<tr>
						<td>SVIP</td>
						<td>20 %</td>
					</tr>
			    </tbody>
			    
			    <tbody>
					<tr>
						<th rowspan="2">BAOBOX</th>
						<td>조조 할인</td>
						<td>2000원 할인</td>
					</tr>			    
					<tr>
						<td>청소년 할인</td>
						<td>2000원 할인</td>
					</tr>
					<tr>
						<td colspan="3">
							&diams;&diams;포인트는 포인트 차감을 제외한 실거래 가격의 10%만큼 적립됩니다.&diams;&diams;
						</td>
					</tr>
			    </tbody>
			</table>
			
			<br><br>
			</td>
		</tr>
	</table>
	</section>
		
	<!-- Footer -->
	<%@ include file="../../common/footer.jsp" %>
		
	<!-- FooterCopyright -->
	<%@ include file="../../common/footerCopyright.jsp" %>
</c:if>
<c:if test="${sessionScope.memId == null}">
	<script type="text/javascript">
		alert('로그인 후 이용 가능합니다.');
		window.history.back();
	</script>
</c:if>	
</body>
</html>