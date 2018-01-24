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
				<caption>분실물 문의</caption>
			    <thead>
				    <tr>
				    	<th style="width:15%">Number</th>
				    	<th style="width:15%">Img</th>
				        <th style="width:30%">Title</th>
				        <th style="width:15%">Writer</th>
				        <th style="width:15%">Date</th>
				        <th style="width:5%">ReadCnt</th>
				        <th style="width:10%">IP</th>
				    </tr>
			    </thead>
			    
			    <!-- 게시글이 있으면 -->
				<c:if test="${lostCnt > 0 }">
					<c:forEach var="dto" items="${lostDtos}">
						<!-- 게시글 -->
						<c:if test="${dto.board_type eq 3}">
					    <tbody>
					    <tr>
					    	<th style="text-align:center;">
					    		${number}<br>
					    		<c:set var="number" value="${number-1}"/>
					    	</th>
					    	<th>
					    		<img src="${projectRes}images/lgt/lost/${dto.board_img}" style="width:100px; height:70px;">
					    	</th>
					        <th style="text-align:center;">
							 	<!-- 추가 -->
								<c:if test="${dto.board_ref_level > 1}"> <!-- 들여쓰기 > 1 -->
									<c:set var="wid" value="${(dto.board_ref_level-1)*10}" />
									<img src="${projectRes}images/lgt/boardImages/level.gif" border="0" width="${wid}" height="15">						
								</c:if>
								<!-- 들여쓰기 > 0 : 답변글 -->
								<c:if test="${dto.board_ref_level > 0 }">
									<img src="${projectRes}images/lgt/boardImages/re.gif" border="0" width="20" height="15">
								</c:if>
								<!-- /추가 -->				        
					        	<a href="memLostContentForm?num=${dto.board_index}&pageNum=${pageNum}&number=${number+1}">
					        		${dto.board_subject}
					        	</a>
					        	<!-- hot이미지 -->
								<c:if test="${dto.board_readCnt > 10 }">
									<img src="${projectRes}images/lgt/boardImages/hot.gif" border="0" width="20" height="15">
								</c:if>
					        </th>
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
				    	<td colspan="7" style="border-bottom: none; text-align:right;">
				    		<input type="button" class="button" value="문의하기" style="width:auto;"
									onclick="window.location='memLWriteForm'">
				    	</td>
				    </tr>
			    </c:if>
			    
			    <!-- 게시글이 없으면 -->
				<c:if test="${lostCnt == 0 }">
					<tr>
						<td colspan="7" align="center">
							No contents...
						</td>
					</tr>
				</c:if>
			</table>
				
			<!-- 페이징 컨트롤 -->
			<div class="pagination">
				<c:if test="${lostCnt > 0 }">
					<c:if test="${startPage > pageBlock }">
						<a href="memLost">&laquo;</a>.
						<a href="memLost?pageNum=${startPage - pageBlock}">&lsaquo;</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
					
						<c:if test="${i == currentPage}">
							<a href="#!" class="active"><b>[${i}]</b></a>
						</c:if>
						
						<c:if test="${i != currentPage}">
							<a href="memLost?pageNum=${i}">[${i}]</a>
						</c:if>
						
					</c:forEach>
					
					<c:if test="${pageCount > endPage }">
						<a href="memLost?pageNum=${startPage + pageBlock}">&rsaquo;</a>
						<a href="memLost?pageNum=${pageCount}">&raquo;</a>
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