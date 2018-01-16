<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
/* function reviewSuccess(movie_index){
	window.close();
	opener.location.href="movieDetail?movie_index="+movie_index; //오픈해준 페이지 reload
} */
</script>
<%@ include file="/resources/setting.jsp"%>
<body>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>

<!-- 리뷰 적은 경우 -->
<c:if test="${cnt==0}">
	<section style="padding-top:0px; margin:0 auto;">
		<div class="container">
			<div class="row">
				<div class="col-md-12" align="center">
					해당 리뷰를 이미 작성하셨습니다.
				</div>
			</div>
		</div>
	</section>
</c:if>

<!-- 리뷰 안적은 경우 -->
<c:if test="${cnt==1}">  
	<section style="padding-top:0px; margin:0 auto;">
		<div class="container">
			<div class="row">
				<div class="col-md-12" align="center">
					<h3>${movie.movie_title}</h3>
					<hr><br><br>
					<form action="movieReviewPro" name="movieReviewPro" method="post">
						<!-- member, movie테이블 값 불러와서 movieReview에 저장하기위해 index, id값 보냄 -->
						<input type="hidden" name="member_id" value="${memId}">
						<input type="hidden" name="movie_index" value="${movie.movie_index}">
						
						<input type="radio" name="review_grade" value="1">좋아요
						${memId}
						<input type="radio" name="review_grade" value="0">싫어요<br><br>	
						<textarea name="review_content" placeholder="리뷰작성" rows="7" cols="100" style="resize:none; width:500px"></textarea>
						
						<input type="submit" value="작성">&nbsp; <!-- onclick="reviewSuccess();" -->
						<input type="reset" value="다시작성">
					</form>
				</div>
			</div>
			<%-- <div class="row">
				<div class="col-md-10" align="left" style="border:1px solid white; height:200px;">
					<span style="color:white; font-size:13px">${movie.movie_content}</span>
				</div>
			</div> --%>
		</div>
	</section>
</c:if>
	<br>
	<br>
	<br>
</body>
</html>