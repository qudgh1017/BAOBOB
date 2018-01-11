<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="${restaurant_css}" rel="stylesheet" type="text/css">
<script src="${restaurant_js}"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%-- <%@ include file="_navigation.jsp" %> --%>
	
	<div class="content-wrapper" style="text-align: center;" >
		<div class="content-main">
			<b style="color: skyblue;">메뉴 목록</b>
			<hr style="border: 3px solid skyblue; margin-bottom: 0px;">
			<table border=1 style="border: lightgray; width: 800px;">
				<tr>
					<td style="width: 600px; text-align: center;">메뉴정보</td>
					<td style="width: 100px; text-align: center;">수정</td>
					<td style="width: 100px; text-align: center;">삭제</td>
				</tr>
				<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>
								<span>${dto.restaurant_menu_name} - </span>
								<span>${dto.restaurant_menu_price}원</span><br>
								<img src="${restaurant_images}${dto.restaurant_menu_img}" style="width: 190px;">
								<textarea rows="5" cols="50">${dto.restaurant_menu_content}</textarea>
							</td>
							<td><input type="button" value="수정"></td>
							<td><input type="button" value="삭제"></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${cnt == 0}">
					<tr>
						<td>등록된 메뉴가 없습니다.</td>
					</tr>
				</c:if>
			</table>
			
			<!-- 페이지 컨트롤 -->
			<table align="center">
				<th align="center">
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀] -->
						<c:if test="${cnt > 0}">
							<c:if test="${startPage > pageBlock}">
								<a href="hostMenuList">[◀◀]</a>
								<a href="hostMenuList?pageNum=${startPage - pageBlock}">[◀]</a>
							</c:if>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="hostMenuList?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음블록[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="hostMenuList?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="hostMenuList?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
					</c:if>
				</th>
			</table>
		</div>
	</div>
	<!-- Footer -->
	<%-- <%@ include file="_footer.jsp" %> --%>
</body>
</html>