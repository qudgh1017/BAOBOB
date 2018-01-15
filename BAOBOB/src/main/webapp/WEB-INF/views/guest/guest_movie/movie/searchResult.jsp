<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>
<!-- <script type="text/javascript">

//page Controller 눌렀을때
$('.page').click(function() {
	alert("hit");
	var keyword = document.getElementById("keyword").value;
	var sel = document.getElementById("select").value;
	//movie_janre이름을 가진 것 중 체크된 것만 값 가져오기
   var size = document.getElementsByName("movie_janre").length;
   var movie_janre = new Array();
   for(var i = 0; i < size; i++){
      if(document.getElementsByName("movie_janre")[i].checked == true){
   		movie_janre[i] = document.getElementsByName("movie_janre")[i].value;
 	  }else{
 		 movie_janre[i] = -1;
 	  }
   	}
 	//movie_country이름을 가진 것 중 체크된 것만 값 가져오기
	var movie_country = new Array();
 	size = document.getElementsByName("movie_country").length;
	for(var i = 0; i < size; i++){
		if(document.getElementsByName("movie_country")[i].checked == true){
			movie_country[i] = document.getElementsByName("movie_country")[i].value;
		}else{
			movie_country[i] = -1;
		}
	}
 //movie_age이름을 가진 것 중 체크된 것만 값 가져오기
   var movie_age = new Array();
   size = document.getElementsByName("movie_age").length;
	for(var i = 0; i < size; i++){
		if(document.getElementsByName("movie_age")[i].checked == true){
			movie_age[i] = document.getElementsByName("movie_age")[i].value;
		}else{
			movie_age[i] = -1;
		}
	}
   alert(keyword);
   alert(sel);


   $.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
    
	$.ajax({
		url: 'searchResult',
		type: 'GET',
		data: {
			keyword, sel, movie_janre, movie_country, movie_age
		},
		
		success: function(msg) {
			$('#result').html(msg);					
		},				
		error: function() {
			alert('오류');
		}			
	});			
});
</script> -->

페이지 처리 필요..!!


<div class="container">
	<div class="row">

		<div class="col-md-offset-1"></div>
		<div class="col-md-10" align="center">
			<div align="center">
				<image src="${projectRes}images/ybh/search_results.gif">
				<hr style="border: 2px solid black;">
				<h5>
					아래의 선택조건에 해당하는 영화가 총
					<%-- ${cnt} --%>
					건 검색되었습니다.
				</h5>
			</div>
			<div align="left">
			<!-- 페이지 이동을 위해 -->
			<input type="hidden" id="keyword" name="keyword" value="${keyword}">
			<input type="hidden" id="select" name="select"  value="${sel}">
			<input type="hidden" id="movie_janre" name="movie_janre" value="${movie_janre}">
			<input type="hidden" id="movie_country" name="movie_country" value="${movie_country}">
			<input type="hidden" id="movie_age" name="movie_age" value="${movie_age}">			
						
				${sel}: ${keyword} <br>
				<c:forEach var="janre" items="${movie_janre}">
					영화장르 : ${janre} <br>
				</c:forEach>
				제작국가 : ${movie_country} <br> 연령 : ${movie_age} <br> <br>
				<br>
			</div>
		</div>
		<div class="col-md-offset-1"></div>

		<c:if test="${cnt>0}">
			<!-- <tr> -->
			<c:forEach var="movie" items="${movies}">
				<div class="col-md-3" style="margin: 10px auto">
					<a onclick="hdTrailerPlaying(${movie.movie_index});"><img
						src="${projectRes}images/phc/${movie.movie_poster}"></a>
					<%-- <a href="hdTrailerPlaying?movie_index=${movie.movie_index}"><img src="${projectRes}images/phc/${movie.movie_poster}"></a> --%>
				</div>
			</c:forEach>
			<!-- </tr> -->
		</c:if>

		<!-- 게시글이 없으면 -->
		<c:if test="${cnt == 0}">
			<div class="col-md-12" align="center">등록된 영화가 없습니다.</div>
		</c:if>
	</div>
</div>

<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-md-12" align="center">
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀] / 이전블록[◀] 특수문자:ㅁ + 한자키 -->
					<c:if test="${startPage > pageBlock}">
						<a href="searchResult">[◀◀]</a>
						<a href="searchResult - pageBlock}">[◀]</a>
					</c:if>
	
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a class="page" href="searchResult?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
	
					<!-- 다음블록 [▶] / 끝[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a class="page" href="searchResult?pageNum=${startPage + pageBlock}">[▶]</a>
						<a class="page" href="searchResult?pageNum=${pageCount}">[▶▶]</a>
						<!-- 마지막페이지로 -->
					</c:if>
	
				</c:if>
			</div>
		</div>
	</div>





<%
	request.setCharacterEncoding("UTF-8");
	//String movie_title = request.getParameter("movie_title");
	//String[] movie_janre = request.getParameterValues("movie_janre");
	//String[] movie_country = request.getParameterValues("movie_country");
	//String[] movie_age = request.getParameterValues("movie_age");
%>


