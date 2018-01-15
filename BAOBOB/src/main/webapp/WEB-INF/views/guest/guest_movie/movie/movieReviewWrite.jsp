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

<section style="padding-top:0px; margin:0 auto;">
	<div class="container">
		<div class="row">
			<div class="col-md-12" align="center">
				<h3>${movie.movie_title}</h3>
				<hr><br><br>
				<form action="movieReviewPro" name="movieReviewPro" method="post">
					<input type="radio" name="review_grade" value="0">좋아요
					<input type="hidden" name="member_id" value="${memId}">
					${memId}
					<input type="radio" name="review_grade" value="1">싫어요<br><br>	
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
	<br>
	<br>
	<br>
</body>
</html>