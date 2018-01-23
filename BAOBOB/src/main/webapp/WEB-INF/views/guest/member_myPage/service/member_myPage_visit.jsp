<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="spring.mvc.baobob.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>      
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>분실물 문의</title>
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
			
			<td style="padding:0rem 10rem; margin:0px;width:100%;height:100%;">
			<!-- 알맹이td -->
			<table id="mainBody">
				<caption>방문 내역</caption>
			    <thead>
				    <tr>
				    	<th style="width:20%">번호</th>
				        <th style="width:40%">이용 내역</th>
				        <th style="width:40%">이용시간</th>
				    </tr>
			    </thead>
			    
			    <!-- 게시글이 있으면 -->
				<c:if test="${cnt > 0}">
					
					<!-- 게시글 -->				
					<c:forEach var="historyDtos" items="${historyDtos}">
					
					    <tbody>
					    <tr>
					    	<th style="text-align:center;">
					    		${number}
					    		<c:set var="number" value="${number-1}"/>
					    	</th>
					    	
					        <th style="text-align:center;">
					        	<!-- 주차장 이용시 -->
					        	<c:forEach var="parkDtos" items="${parkDtos}">
						        	<c:if test="${historyDtos.history_index == parkDtos.history_index}">
						        		주차장
							        	<br>
						        	</c:if>
					        	</c:forEach>
					        	
					        	<!-- 레스토랑 이용시 -->
					        	<c:forEach var="restaurantDtos" items="${restaurantDtos}">
						        	<c:if test="${historyDtos.history_index == restaurantDtos.history_index}">
						        		레스토랑( ${restaurantDtos.restaurant_name} )
						        	</c:if>
					        	</c:forEach>
					        	
					        	<!-- 영화관 이용시 -->
					        	<c:forEach var="movieDtos" items="${movieDtos}">
						        	<c:if test="${historyDtos.history_index == movieDtos.history_index}">
						        		영화관( ${movieDtos.movie_title} )
						        	</c:if>
					        	</c:forEach>
					        </th>
					        
					        <th style="text-align:center;">
					        	<!-- 주차장 이용 시간 -->
					        	<c:forEach var="parkDtos" items="${parkDtos}">
						        	<c:if test="${historyDtos.history_index == parkDtos.history_index}">
				        				<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${parkDtos.p_history_in}" /> 
				        				~ 
				        				<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${parkDtos.p_history_out}" />
						        		<br>
						        	</c:if>
					        	</c:forEach>
					        	
					        	<!-- 레스토랑 이용 시간 -->
					        	<c:forEach var="restaurantDtos" items="${restaurantDtos}">
						        	<c:if test="${historyDtos.history_index == restaurantDtos.history_index}">
						        		<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${restaurantDtos.schedule_starttime}" />
						        		~
						        		<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${restaurantDtos.schedule_endtime}" />
						        		<br>
						        	</c:if>
					        	</c:forEach>
					        	
					        	<!-- 영화관 이용 시간 -->
					        	<c:forEach var="movieDtos" items="${movieDtos}">
						        	<c:if test="${historyDtos.history_index == movieDtos.history_index}">
						        		<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${movieDtos.schedule_startTime}" />
										~
										<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${movieDtos.schedule_endTime}" />
						        	</c:if>
					        	</c:forEach>
					        </th>
							
					    </tr>
					    </tbody>
				    </c:forEach>
				    
			    </c:if>
			    
			    <!-- 게시글이 없으면 -->
				<c:if test="${cnt == 0 }">
					<tr>
						<td colspan="7" align="center">
							No contents...
						</td>
					</tr>
				</c:if>
			</table>
				
			<!-- 페이징 컨트롤 -->
			<div class="pagination">
				<c:if test="${cnt > 0 }">
					<c:if test="${startPage > pageBlock }">
						<a href="visit">&laquo;</a>.
						<a href="visit?pageNum=${startPage - pageBlock}">&lsaquo;</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
					
						<c:if test="${i == currentPage}">
							<a href="#!" class="active"><b>[${i}]</b></a>
						</c:if>
						
						<c:if test="${i != currentPage}">
							<a href="visit?pageNum=${i}">[${i}]</a>
						</c:if>
						
					</c:forEach>
					
					<c:if test="${pageCount > endPage }">
						<a href="visit?pageNum=${startPage + pageBlock}">&rsaquo;</a>
						<a href="visit?pageNum=${pageCount}">&raquo;</a>
					</c:if>
				</c:if>			  
			</div>
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