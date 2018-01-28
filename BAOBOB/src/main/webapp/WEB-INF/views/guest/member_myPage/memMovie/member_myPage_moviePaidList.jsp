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
			
			<td style="padding:0rem 5rem; margin:0px;width:100%;height:100%;">
			<!-- 알맹이td -->
			<table id="mainBody">
				<caption>예매 내역</caption>
			    <thead>
				    <tr>
				    	<th style="width:10%">번호<br>( 예매일 )</th>
				    	<th style="width:15%">포스터</th>
				        <th style="width:30%">제목</th>
				        <th style="width:10%">감독</th>
				        <th style="width:10%">상영관<br>좌석</th>
				        <th style="width:15%">상영시간</th>
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
					    	<th>
					    		<img src="${projectRes}images/phc/${dto.movie_poster}" 
					    			style="height:150px;">
					    	</th>
					        <th style="text-align:center;">
					        	${dto.movie_title}
					        	<c:if test="${dto.movie_age==0}"><img src="${projectRes}/images/ybh/전체관람가.png" style="width:15px; height:15px;"></c:if>
								<c:if test="${dto.movie_age==12}"><img src="${projectRes}/images/ybh/12세 관람가.png" style="width:15px; height:15px;"></c:if>
								<c:if test="${dto.movie_age==15}"><img src="${projectRes}/images/ybh/15세 관람가.png" style="width:15px; height:15px;"></c:if>
								<c:if test="${dto.movie_age==19}"><img src="${projectRes}/images/ybh/청소년 관람불가.png" style="width:15px; height:15px;"></c:if>
					        </th>
					        <th style="text-align:center;">${dto.movie_director}</th>
							<th>
								<!-- 상영관, 좌석 -->
								${dto.theater_index}관 <br>
								${dto.seat}
							</th>
							<th>
								<!-- 상영시간 -->
								<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${dto.schedule_startTime}" />
								~
								<fmt:formatDate type="both" pattern="yy.MM.dd HH:mm" value="${dto.schedule_endTime}" />
								<br><br>
								
								<!-- 날짜비교를 위한 선언,if문의 jstl -->
								<!-- 상영시간전에는 예약취소버튼, 상영시간후에는 결제완료 노출 -->
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${dto.schedule_endTime}" var="hisDate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${now}" var="sysDate" pattern="yyyy-MM-dd" /><br>
								<c:if test="${hisDate > sysDate}">
									<input type="button" class="button" 
										onclick="window.location='moviePaidDelPro?num=${dto.history_index}'"value="예매 취소">
								</c:if>
								
								<c:if test="${hisDate < sysDate}">
									<input type="button" class="button" onclick="#!"value="결제 완료">
								</c:if>
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