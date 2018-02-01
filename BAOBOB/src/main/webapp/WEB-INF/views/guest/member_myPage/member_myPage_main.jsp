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
<%@ include file="../common/head.jsp" %>

<!-- Navigation -->
<%@ include file="../common/navigation.jsp" %>

<!-- 개인정보 카드 -->
<%@ include file="../common/memberCard.jsp" %>

<section class="mypageSection">
<table class="board">
	<tr>
		<!-- 사이드 메뉴 -->
		<%@ include file="../common/sideMenu.jsp" %>	
		
		<!-- 알맹이td -->
		<td style="padding:0rem 5rem; margin:0px;width:100%;height:100%;">
			


<!-- ==============================메인화면 간편한 MY예매내역============================== -->
		<table id="mainBody">
		    <thead>
			    <tr>
			    	<th colspan="4" style="font-size:20px">MY 예매 내역</th>
			    </tr>
		    </thead>
		    
		    <!-- foreach가 돌지 않을때 화면에 뿌려줄 로직을 구현하기 위한 똑딱이 스위치같은 느낌의 변수선언  -->
		    <c:set var="movieCnt" value="0" />
		    
			<c:if test="${cnt > 0 }">
				<!-- session에 저장되있는 id와 1:1문의에 등록된 id와 대조해서 같은 값만 가져온다. -->
				<c:set var="memId" value="${sessionScope.memId}"/>
				<c:set var="dto" value="${dtos}" />
				
				<c:forEach var="dto" items="${dtos}">
					<c:if test="${dto.member_id eq memId}">
					
					<!-- 똑딱이 온 -->
					<c:set var="movieCnt" value="1" />
						
				    <tbody>
				    <tr>
				        <td style="text-align:center;">
				        	${dto.movie_title}
				        	<c:if test="${dto.movie_age==0}"><img src="${projectRes}/images/ybh/전체관람가.png" style="width:15px; height:15px;"></c:if>
							<c:if test="${dto.movie_age==12}"><img src="${projectRes}/images/ybh/12세 관람가.png" style="width:15px; height:15px;"></c:if>
							<c:if test="${dto.movie_age==15}"><img src="${projectRes}/images/ybh/15세 관람가.png" style="width:15px; height:15px;"></c:if>
							<c:if test="${dto.movie_age==19}"><img src="${projectRes}/images/ybh/청소년 관람불가.png" style="width:15px; height:15px;"></c:if>
				        </td>
						<td>
							<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${dto.schedule_startTime}" />
							~
							<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${dto.schedule_endTime}" />
						</td>
				    </tr>
				    </tbody>
					</c:if>
			    </c:forEach>
		    </c:if>
		    
			<!-- 예매내역에 session에 해당하는게시글이 없으면 -->
			<c:if test="${movieCnt == 0 }">
				<tr>
					<td colspan="4" align="center">
						고객님의 예매내역이 존재하지 않습니다.
					</td>
				</tr>
			</c:if>
			
		</table>
			
		<br><br><br><br><br><br>
		


<!-- ==============================메인화면 간편한 1:1문의내역============================== -->
		<table id="mainBody">
		    <thead>
			    <tr>
			    	<th colspan="4" style="font-size:20px">MY 1:1문의 내역</th>
			    </tr>
		    </thead>
		    
		    <!-- foreach가 돌지 않을때 화면에 뿌려줄 로직을 구현하기 위한 똑딱이 스위치같은 느낌의 변수선언  -->
		    <c:set var="questionCntSwitch" value="0" />
		    
		    <!-- 게시글이 있으면 -->
			<c:if test="${memQuestionCnt > 0 }">
				<!-- session에 저장되있는 id와 1:1문의에 등록된 id와 대조해서 같은 값만 가져온다. -->
				<c:set var="memId" value="${sessionScope.memId}"/>
				
				<c:forEach var="dtoQ" items="${QuestionDtos}">
					<c:if test="${dtoQ.member_id eq memId}">
					
						<!-- 똑딱이 온 -->
						<c:set var="questionCntSwitch" value="1" />
					   
					    <tbody>
					    <tr>
					    	<th style="text-align:center;">
					    		${number}<br>
					    		<c:set var="number" value="${number-1}"/>
					    	</th>
					    	
					        <td style="text-align:center;">
					        	<a href="memQuestionContentForm?num=${dtoQ.board_index}&pageNum=${pageNum}&number=${number+1}">
					        		${dtoQ.board_subject}
					        	</a>
					        </td>
					        <td>
					        	<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dtoQ.board_reg_date}" />
							</td>
					        <td>${dtoQ.board_readCnt}</td>
					    </tr>
					    </tbody>
					</c:if>
			    </c:forEach>
		    </c:if>
		    
		    <!-- 1:1문의내역에 session에 해당하는게시글이 없으면 -->
		    <!-- 똑딱이 오프된 상태 -->
			<c:if test="${questionCntSwitch == 0 }">
				<tr>
					<td colspan="4" align="center">
						고객님의 1:1문의내역이 존재하지 않습니다.
					</td>
				</tr>
			</c:if>
			
		</table>
		
		<br><br><br><br><br><br>
			


<!-- ==============================메인화면 간편한 분실물 문의내역============================== -->
		<table id="mainBody">
		    <thead>
			    <tr>
			    	<th colspan="4" style="font-size:20px">MY 분실물 문의 내역</th>
			    </tr>
		    </thead>
		    
		    <!-- foreach가 돌지 않을때 화면에 뿌려줄 로직을 구현하기 위한 똑딱이 스위치같은 느낌의 변수선언  -->
		    <c:set var="lostCntSwitch" value="0" />
		    
		    <!-- 게시글이 있으면 -->
			<c:if test="${lostCnt > 0 }">
				<c:set var="memId" value="${sessionScope.memId}"/>
				
				<c:forEach var="dtoL" items="${lostDtos}">
					<!-- session에 저장되있는 id와 분실물 문의에 등록된 id와 대조해서 같은 값만 가져온다. -->
					<c:if test="${dtoL.member_id eq memId}">
						
						<!-- 똑딱이 온 -->
						<c:set var="lostCntSwitch" value="1" />

					    <tbody>
					    <tr>
					    	<th style="text-align:center;">
					    		${number}<br>
					    		<c:set var="number" value="${number-1}"/>
					    	</th>
					    	<td>
					    		<img src="${projectRes}images/lgt/lost/${dtoL.board_img}" style="width:100px; height:70px;">
					    	</td>
					        <td style="text-align:center;">
					        	<a href="memLostContentForm?num=${dtoL.board_index}&pageNum=${pageNum}&number=${number+1}">
					        		${dtoL.board_subject}
					        	</a>
					        </td>
					        <td>
					        	<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dtoL.board_reg_date}" />
							</td>
					    </tr>
					    </tbody>
				    </c:if>
			    </c:forEach>
		    </c:if>
		    
		    <!-- 분실물 문의내역에 session에 해당하는게시글이 없으면 -->
		    <!-- 똑딱이 오프된 상태 -->
			<c:if test="${lostCntSwitch == 0 }">
				<tr>
					<td colspan="4" align="center">
						고객님의 분실불 문의내역이 존재하지 않습니다.
					</td>
				</tr>
			</c:if>
		</table>
			
		<br><br><br>
			
		</td>
	</tr>
</table>
</section>


<!-- Footer -->
<%@ include file="../common/footer.jsp" %>
	
<!-- FooterCopyright -->
<%@ include file="../common/footerCopyright.jsp" %>
</body>
</html>