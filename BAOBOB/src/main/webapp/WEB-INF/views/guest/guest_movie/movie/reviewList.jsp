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
		<div class="col-md-10" align="left" style="height:60px; background-color:#EEEEEE;">
			<div align="left" style="font-size:15px; font-weight:bold;">
				리뷰
			</div>
			<!-- 로그인 서비스 -->
			<c:if test="${memId==null}">
				<div align="right">
					<button class="btn btn-danger" onclick="loginCheck();">리뷰등록</button>
				</div>
			</c:if>
			<c:if test="${memId!=null}">
				<div align="right">
					<button class="btn btn-danger" onclick="reviewWrite(${movie.movie_index});">리뷰등록</button>
				</div>
			</c:if>
		</div>
		<div class="col-md-2"></div>
	</div><br>
	<br>
	<!-- 평점, 리뷰 수 -->		
	<div class="row">
		<div class="col-md-12" style="height:400px; ">
			<div class="row">
				<div class="col-md-5"  align="center">
					<!-- 좋아요 %에 따른 별점 -->
					<br><br><br>
					<div>
						<c:if test="${likePercent==0}">
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<br>
						</c:if>
						<c:if test="${10>likePercent && likePercent>0}">
							<i class="material-icons" style="color:orange;">star_half</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<br>
						</c:if>  
						<c:if test="${20>likePercent && likePercent>=10}">
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<br>
						</c:if> 
						<c:if test="${30>likePercent && likePercent>=20}">
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star_half</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<br>
						</c:if> 
						<c:if test="${40>likePercent && likePercent>=30}">
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<br>
						</c:if>
						<c:if test="${50>likePercent && likePercent>=40}">
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star_half</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<br>
						</c:if>
						<c:if test="${60>likePercent && likePercent>=50}">
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<br>
						</c:if>
						<c:if test="${70>likePercent && likePercent>=60}">
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star_half</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<br>
						</c:if>
						<c:if test="${80>likePercent && likePercent>=70}">
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star_border</i>
							<br>
						</c:if> 
						<c:if test="${90>likePercent && likePercent>=80}">
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star_half</i>
							<br>
						</c:if> 
						<c:if test="${100>=likePercent && likePercent>=90}">
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<i class="material-icons" style="color:orange;">star</i>
							<br>
						</c:if> 
						좋아요&nbsp; ${likePercent}%
					</div>
					<br><br>
					<div align="center">
					<h4>${cnt}명의</h4>
					회원님들이 평가해주셨습니다.
					
					<br><br><br><br>
					<h5>회원님들이 작성하신 리뷰를<br>빅데이터 분석한 결과입니다. ▶</h5>
				</div>
				</div>
				
				
				<div class="col-md-7" height="500" >
					<iframe src="movieWordcloud?movie_index=${movie.movie_index}&type=" style="width:100%; height:430px;" frameborder=0 ></iframe>
				</div>
			</div>
		</div>
	</div><br>
	
	<!-- 리뷰 리스트 -->
	<div class="row">
		<div class="col-md-10">		
			<div class="row">
			<!-- 리뷰 있으면 -->
			<c:if test="${cnt>0}">
				<c:forEach var="review" items="${reviews}">
					<div class="col-md-6" style="margin:0px; padding:0px; height:220px; border:1px solid black; background-color:#EEEEEE;">
						<!-- 좋아요/싫어요 -->
						<c:if test="${review.review_grade==0}">
							<i class="material-icons">sentiment_very_dissatisfied</i>
						</c:if>
						<c:if test="${review.review_grade==1}">
							<i class="material-icons">sentiment_very_satisfied</i>
						</c:if>
						${review.member_id}
						
						<div align="right">
							<a link align="right" onclick="reviewModifyCheck('${memId}', '${review.member_id}', '${movie.movie_index}', '${review.review_index}');">수정</a>
							<a link align="right" onclick="reviewDeleteCheck('${memId}', '${review.member_id}', '${movie.movie_index}', '${review.review_index}');">삭제</a>
						</div>
						<br>
						<textarea style="resize:none; border:0px; width:100%; height:90px; background-color:#EEEEEE;">${review.review_content}</textarea>
						${review.review_reg_date}
					</div>
				</c:forEach>
			</c:if>
			</div>
		</div>
		<div class="col-md-2"></div>
		
		<!-- 리뷰 없으면 -->
		<c:if test="${cnt == 0}">
			<div class="col-md-10" align="center" style="border:1px solid black">
				등록된 리뷰가 없습니다.
			</div>
			<div class="col-md-2"></div>
		</c:if>
	</div><br><br>
	
	<!-- 페이지 컨트롤러 -->
	<div class="row">
		<div class="col-md-10" align="center">
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
		<div class="col-md-2"></div>
	</div>
</html>	
	
