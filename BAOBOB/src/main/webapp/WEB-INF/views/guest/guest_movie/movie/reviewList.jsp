<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<!-- 내꺼 JavaScript 참조 -->
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
<html>
	<!-- review, movieDetail에 include할 부분 -->
	<!-- 리뷰표시 -->
	<div class="row">
		<div class="col-md-offset-1"></div>
		<div class="col-md-10" align="left" style="height:60px; background-color:#EEEEEE;">
			<div align="left" style="font-size:15px; font-weight:bold;">
				리뷰
			</div>
				<!-- 로그인 서비스 -->
				<c:if test="${memId==null}">
					<div align="right">
						<button class="btn btn-danger" onclick="loginCheck();">평점등록</button>
					</div>
				</c:if>
				<c:if test="${memId!=null}">
					<div align="right">
						<button class="btn btn-danger" onclick="reviewWrite(${movie.movie_index});">평점등록</button>
					</div>
				</c:if>
			
		</div>
		<div class="col-md-offset-1"></div>
	</div><br>
	
	<!-- 평점, 리뷰 수 -->		
	<div class="row">
		<div class="col-md-offset-1"></div>
		<div class="col-md-10" style="height:100px; ">
			<div class="row">
				<div class="col-md-3"  align="center">
					좋아요&nbsp; ${likePercent}%  
				</div>
				
				<div class="col-md-6" align="center">
					<h4>${cnt}명의</h4>
					실관람객들이 평가해주셨습니다.
				</div>
				
				<div class="col-md-3"  align="center">
					표??
				</div>
			</div>
		</div>
		<div class="col-md-offset-1"></div>
	</div><br>
	
	<!-- 리뷰 리스트 -->
	<div class="row">
		<div class="col-md-offset-1"></div>
				
		<div class="col-md-10">		
			<div class="row">
			<!-- 리뷰 있으면 -->
			<c:if test="${cnt>0}">
				<c:forEach var="review" items="${reviews}">
					<div class="col-md-6" style="margin:0px; padding:0px; border:1px solid black">
						${review.review_grade}, ${review.member_id}
						<div align="right">
							<a link align="right" onclick="reviewModifyCheck('${memId}', '${review.member_id}', '${movie.movie_index}', '${review.review_index}');">수정</a>
							<a link align="right" onclick="reviewDeleteCheck('${memId}', '${review.member_id}', '${movie.movie_index}', '${review.review_index}');">삭제</a>
						</div>
						<br>
						${review.review_content}<br><br>
						
						${review.review_reg_date}
						
					</div>
				</c:forEach>
			</c:if>
			</div>
		</div>
		
		<!-- 리뷰 없으면 -->
		<c:if test="${cnt == 0}">
			<div class="col-md-10" align="center" style="border:1px solid black">
				등록된 영화가 없습니다.
			</div>
		</c:if>
			
		<div class="col-md-offset-1"></div>
	</div><br><br>
	
	<!-- 페이지 컨트롤러 -->
	<div class="row">
		<div class="col-md-12" align="center">
			<c:if test="${cnt > 0}">
				<!-- 처음[◀◀] / 이전블록[◀] 특수문자:ㅁ + 한자키 -->
				<c:if test="${startPage > pageBlock}">
					<a href="movieDetail?movie_index=${movie.movie_index}">[◀◀]</a>
					<a href="movieDetail?movie_index=${movie.movie_index}&pageNum=${startPage - pageBlock}">[◀]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span><b>[${i}]</b></span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="movieDetail?movie_index=${movie.movie_index}&pageNum=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				
				<!-- 다음블록 [▶] / 끝[▶▶] -->
				<c:if test="${pageCount > endPage}">
					<a href="movieDetail?movie_index=${movie.movie_index}&pageNum=${startPage + pageBlock}">[▶]</a>
					<a href="movieDetail?movie_index=${movie.movie_index}&pageNum=${pageCount}">[▶▶]</a> <!-- 마지막페이지로 -->
				</c:if>
			
			</c:if>
		</div>
	</div>
</html>	
	
