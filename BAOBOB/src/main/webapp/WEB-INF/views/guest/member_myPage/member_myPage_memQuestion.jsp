<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/head.jsp" %>

<!-- Navigation -->
<%@ include file="../common/navigation.jsp" %>

<!-- Header -->
<header class="bg-primary text-white text-center head_header" style="background-color: #2c3e50!important;">
	<div class="head_screen"><!-- container -->
		<h1>My Page</h1>
		<h2>Multiplex Baobob</h2>
	</div>
	<img class="img-fluid mb-5 d-block mx-auto" 
		style="margin-bottom:0rem!important;"
		src="${projectRes}images/lgt/test(2).jpg">
</header>

<!-- 개인정보 카드 -->
<div class="mybaobob">
	<table class="board">
	    <thead>
	    	<tr>
	    		<td colspan=3>
	    		<span class="text-uppercase bigfont" style="text-align:left">Gunny</span>&emsp;
				<a href="#!" title="modify" id="modify"><i class="material-icons">edit</i></a>
				<hr style="border: dotted 3px white;">
				<h4 class="text-capitalize" style="text-align:left">고객님은 SVIP입니다.</h4>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td rowspan=2>
					<img class="mybaobob" src="${projectRes}images/lgt/default_img.png">
	    		</td>
		    	<th class="middlefont">B POINT</th>
		    	<th class="middlefont">B CLASS</th>
		    </tr>
			<tr>
		        <td class="samllfont">14000점</td>
		        <td class="samllfont">SVIP</td>
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
			<a href="memMyPageMain" class="active">My BAOBOB</a>
			<a href="#" class="active">SERVICE</a>
			<a href="#">정보 수정</a>
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

		<td style="padding:0px;margin:0px;width:100%;height:100%;">
		<!-- 알맹이 -->
		<table class="mainBody">
			<caption>1 : 1 문의</caption>
		    <thead>
			    <tr>
			    	<th style="width:15%">Number</th>
			        <th style="width:30%">Title</th>
			        <th style="width:15%">Writer</th>
			        <th style="width:15%">Date</th>
			        <th style="width:5%">ReadCnt</th>
			        <th style="width:10%">IP</th>
			    </tr>
		    </thead>
		    
		    <!-- 게시글이 있으면 -->
			<c:if test="${cnt > 0 }">
				
				<c:forEach var="dto" items="${dtos}">
					<!-- 게시글 -->
					<c:if test="${dto.board_type eq '02'}">
				    <tbody>
				    <tr>
				    	<th>
				    		${number}<br>
				    		<c:set var="number" value="${number-1}"/>
							<%-- (${dto.num } / ${dto.ref} / ${dto.ref_step} / ${dto.ref_level}) --%>
				    	</th>
				        <td style="text-align:left;">
						 	<!-- 추가 -->
							<c:if test="${dto.board_ref_level > 1}"> <!-- 들여쓰기 > 1 -->
								<c:set var="wid" value="${(dto.board_ref_level-1)*10}" />
								<img src="${projectRes}images/lgt/boardImages/level.gif" border="0" width="${wid}" height="15">						
							</c:if>
							<!-- 들여쓰기 > 0 : 답변글 -->
							<c:if test="${dto.ref_level > 0 }">
								<img src="${projectRes}images/lgt/boardImages/re.gif" border="0" width="20" height="15">
							</c:if>
							<!-- /추가 -->				        
				        	<a href="contentForm?num=${dto.board_index}&pageNum=${pageNum}&number=${number+1}">
				        		${dto.board_subject}
				        	</a>
				        	<!-- hot이미지 -->
							<c:if test="${dto.board_readCnt > 10 }">
								<img src="${projectRes}images/lgt/boardImages/hot.gif" border="0" width="20" height="15">
							</c:if>
				        </td>
				        <td>${dto.member_id}</td>
				        <td>
				        	<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.board_reg_date}" />
						</td>
				        <td>${dto.board_readCnt}</td>
				        <td>${dto.board_ip}</td>
				    </tr>
				    </tbody>
				    </c:if>
			    </c:forEach>
			    <tr>
			    	<td colspan="6" style="border-bottom: none; text-align:right;">
			    		<input type="button" class="button" value="Write Content..." style="width:auto;"
								onclick="window.location='writeForm'">
			    	</td>
			    </tr>
		    </c:if>
		    
		    <!-- 게시글이 없으면 -->
			<c:if test="${cnt == 0 }">
				<tr>
					<td colspan="6" align="center">
						No contents...
					</td>
				</tr>
			</c:if>
		</table><br>	
		
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