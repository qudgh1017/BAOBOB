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
				<caption>내가 이용한 레스토랑</caption>
			    <thead>
				    <tr>
				    	<th style="width:10%">번호<br>( 결제일 )</th>
				        <th style="width:30%">레스토랑 명</th>
				        <th style="width:10%">전화번호</th>
				        <th style="width:15%">예약일</th>
				    </tr>
			    </thead>
			    
			    <!-- 게시글이 있으면 -->
				<c:if test="${cnt > 0 }">
					<c:forEach var="dto" items="${dtos}">
						<!-- 게시글 -->
					    <tbody>
					    <tr>
					    	<th style="text-align:center;">
					    		${number}
					    		<c:set var="number" value="${number-1}"/>
					    		<br>
					    		<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.history_date}" />
					    	</th>
					        <th style="text-align:center;">
					        	${dto.restaurant_name}
					        </th>
					        <th style="text-align:center;">
					        	${dto.restaurant_tel}
					        </th>
							<td>
								<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.schedule_starttime}" />
								~
								<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.schedule_endtime}" />
							</td>
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
						<a href="moviePaidList">&laquo;</a>.
						<a href="moviePaidList?pageNum=${startPage - pageBlock}">&lsaquo;</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
					
						<c:if test="${i == currentPage}">
							<a href="#!" class="active"><b>[${i}]</b></a>
						</c:if>
						
						<c:if test="${i != currentPage}">
							<a href="moviePaidList?pageNum=${i}">[${i}]</a>
						</c:if>
						
					</c:forEach>
					
					<c:if test="${pageCount > endPage }">
						<a href="moviePaidList?pageNum=${startPage + pageBlock}">&rsaquo;</a>
						<a href="moviePaidList?pageNum=${pageCount}">&raquo;</a>
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