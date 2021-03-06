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
				<caption>BAO밥 예약내역</caption>
			    <thead>
				    <tr>
				        <th style="width:20%">레스토랑 명</th>
				        <th style="width:20%">전화번호</th>
				        <th style="width:30%">예약일</th>
				        <th style="width:15%">예약 좌석</th>
				        <th style="width:15%">예약취소 신청</th>
				    </tr>
			    </thead>
			    
			    <!-- 이미 이용했는지 안했는지 현재시간과 대조하기 위한 변수 선언 -->
			    <c:set var="bookCnt" value="0" />
			    
			    <!-- 게시글이 있으면 -->
				<c:if test="${cnt > 0 }">
					<c:forEach var="dto" items="${dtos}">
						<!-- 이용시간이 지났으면 예약내역이 아닌 이용시간으로 출력 -->
						<c:if test="${dto.restaurant_history_state == 0}">
						<c:set var="bookCnt" value="1" />
							    <tbody>
							    <tr>
							        <th style="text-align:center;">
							        	${dto.restaurant_name}<br>
							        </th>
							        <th style="text-align:center;">
							        	${dto.restaurant_tel}
							        </th>
									<th>
										<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.schedule_starttime}" />
										~
										<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.schedule_endtime}" />
									</th>
									<th>
										${dto.restaurant_table_index}번 테이블
									</th>
									<th>
										<input type="button" class="button" 
											onclick="window.location='memRBookDel?restaurant_index=${dto.restaurant_index}&restaurant_schedule_index=${dto.restaurant_schedule_index}&table_Num=${dto.restaurant_table_index}'" value="예약 취소">
									</th>
							    </tr>
							    </tbody>
						</c:if>
						
			   		</c:forEach>
			    </c:if>
			    
			    <!-- 게시글이 없으면 -->
				<c:if test="${bookCnt == 0 }">
					<tr>
						<td colspan="7" align="center">
							BAO밥 이용내역이 존재하지 않습니다.
						</td>
					</tr>
				</c:if>
			</table>
				
			<!-- 페이징 컨트롤 -->
			<div class="pagination">
				<c:if test="${cnt > 0 }">
					<c:if test="${startPage > pageBlock }">
						<a href="memRBookList">&laquo;</a>.
						<a href="memRBookList?pageNum=${startPage - pageBlock}">&lsaquo;</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
					
						<c:if test="${i == currentPage}">
							<a href="#!" class="active"><b>[${i}]</b></a>
						</c:if>
						
						<c:if test="${i != currentPage}">
							<a href="memRBookList?pageNum=${i}">[${i}]</a>
						</c:if>
						
					</c:forEach>
					
					<c:if test="${pageCount > endPage }">
						<a href="memRBookList?pageNum=${startPage + pageBlock}">&rsaquo;</a>
						<a href="memRBookList?pageNum=${pageCount}">&raquo;</a>
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