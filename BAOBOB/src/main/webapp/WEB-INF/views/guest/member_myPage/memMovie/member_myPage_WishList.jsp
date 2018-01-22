<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.mvc.baobob.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>       
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

//위시리스트 페이징 처리를 위한 AJAX
function wishPage(page){
	var object = new Object();
	var jsonData = JSON.stringify(object);
	$.ajax({
		//GET방식의 URL
		url : '${pageContext.request.contextPath}/wishList?pageNum=' + page,
		type : 'GET',
		success : function(msg) {
			/* alert("success"); */  
			/* alert(msg); */  
			$('#result').html(msg);  
		},
		error : function() {
			alert("error");
		}
	});
}
	
</script>
<style type="text/css">
	.button{
		margin-left:50px; 
		margin-right:50px;
		background-color: 487752; 
		border-radius:20px; 
		width:150px; 
		height:80px;
	}		
</style>
</head>
<body>
<table id="mainBody">
	<tr>
		<th style="font-size:30px">위시리스트</th>
	</tr>
	
	<tr id="result">
		<td>
		<div class="container">
			<div class="row">
				<c:if test="${cnt>0}">
					<!-- <tr> -->
					<c:forEach var="movie" items="${dtos}">
						<div class="col-md-3" style="margin-right:10px auto">
							<a href="movieDetail?movie_index=${movie.movie_index}"><img style="border:5px solid black;"src="${projectRes}images/phc/${movie.movie_poster}"></a>
							<div align="left" style="width:195px;">
								<span style="font-weight:bold;">
									${movie.movie_title}
									<c:if test="${movie.movie_age==0}"><img src="${projectRes}/images/ybh/전체관람가.png" style="width:15px; height:15px;"></c:if>
									<c:if test="${movie.movie_age==12}"><img src="${projectRes}/images/ybh/12세 관람가.png" style="width:15px; height:15px;"></c:if>
									<c:if test="${movie.movie_age==15}"><img src="${projectRes}/images/ybh/15세 관람가.png" style="width:15px; height:15px;"></c:if>
									<c:if test="${movie.movie_age==19}"><img src="${projectRes}/images/ybh/청소년 관람불가.png" style="width:15px; height:15px;"></c:if>
								</span><br>
								<span style="font-weight:bold; color:gray; font-size:12px">
									20${movie.movie_rel_date} 개봉 &emsp;&emsp;
									<input type="button" onclick="window.location='delWishList?num=${movie.movie_index}'" value="삭제">
								</span>
							</div>
							<br>
						</div>
					</c:forEach>
				
				<!-- </tr> -->
				</c:if>
				
				<!-- 게시글이 없으면 -->
				<c:if test="${cnt == 0}">
					<div class="col-md-12" align="center">
						등록된 영화가 없습니다.
					</div>
				</c:if>
			</div>
		</div>		
		
		<!-- 페이징 컨트롤 -->	
		<div class="container" style="margin-top:50px">
			<div class="row">
				<div class="col-md-12" align="center">
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀] 특수문자:ㅁ + 한자키 -->
						<c:if test="${startPage > pageBlock}">
							<a id="wishListPageStart" href="wishList">&laquo;</a>
							<a id="wishListPagePrev" href="#!">&lsaquo;</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a onclick="wishPage(${i});" href="#!">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음블록 [▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a id="wishListPageNext" href="wishList?pageNum=${startPage + pageBlock}">&rsaquo;</a>
							<a id="wishListPageEnd" href="wishList?pageNum=${pageCount}">&raquo;</a> 
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
		</td>
	</tr>
</table>


</body>
</html>