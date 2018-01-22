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

//무비다이어리 페이징 처리를 위한 AJAX
function movieDiaryPage(page){
	var object = new Object();
	var jsonData = JSON.stringify(object);
	$.ajax({
		//GET방식의 URL
		url : '${pageContext.request.contextPath}/movieDiaryPage?pageNum=' + page,
		type : 'GET',
		success : function(msg) {
			/* alert("success"); */  
			/* alert(msg); */  
			$('#result2').html(msg);  
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
	
	<!-- 작성한 무비다이어리 -->
	<tr id="result2">
		<td>
			<table id="mainBody" style="width:800px; margin:auto;">
			    <thead>
				    <tr style="border-bottom: 3px solid black;">
				    	<th style="width:5%">Number</th>
				        <th style="width:25%">Title</th>
				        <th style="width:10%">Date</th>
				    </tr>
			    </thead>
			    
			    <!-- 게시글이 있으면 -->
				<c:if test="${cnt > 0 }">
					<c:forEach var="dto" items="${dtos}">
						<!-- 게시글 -->
					    <tbody>
					    <tr>
					    	<td style="text-align:center; border-bottom:none!important;">
					    		${number}<br>
					    		<c:set var="number" value="${number-1}"/>
								<%-- (${dto.num } / ${dto.ref} / ${dto.ref_step} / ${dto.ref_level}) --%>
					    	</td>
					        <td style="text-align:left; border-bottom:none!important;">${dto.board_subject}</td>
					        <td style="border-bottom:none!important;">
					        	<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.board_reg_date}" />
							</td>
					    </tr>
					    <tr>
					    	<td colspan="3" style="text-align:left; border-bottom: 3px solid black;">
					    		${dto.board_content}
					    		</td>
					    </tr>
					    </tbody>
					    <%-- </c:if> --%>
				    </c:forEach>
			    </c:if>
			    
			    <!-- 게시글이 없으면 -->
				<c:if test="${cnt == 0 }">
					<tr>
						<td colspan="6" align="center">
							No contents...
						</td>
					</tr>
				</c:if>
			</table>
			
			<!-- 페이징 컨트롤 -->	
			<div class="container" style="margin-top:50px">
				<div class="row">
					<div class="col-md-12" align="center">
						<c:if test="${cnt > 0}">
							<!-- 처음[◀◀] / 이전블록[◀] 특수문자:ㅁ + 한자키 -->
							<c:if test="${startPage > pageBlock}">
								<a id="wishListPageStart" href="wishList">[&laquo;]</a>
								<a id="wishListPagePrev" href="#!">[&lsaquo;]</a>
							</c:if>
							
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i != currentPage}">
									<a onclick="movieDiaryPage(${i});" href="#!">[${i}]</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음블록 [▶] / 끝[▶▶] -->
							<c:if test="${pageCount > endPage}">
								<a id="wishListPageNext" href="wishList?pageNum=${startPage + pageBlock}">[&rsaquo;]</a>
								<a id="wishListPageEnd" href="wishList?pageNum=${pageCount}">[&raquo;]</a> 
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