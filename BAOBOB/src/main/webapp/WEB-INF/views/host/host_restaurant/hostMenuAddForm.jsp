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
	<%@ include file="_navigation.jsp"%>
		
	<form action="hostMenuAddPro" method="POST" name="addform" enctype="multipart/form-data" onsubmit="return addCheck()">
		<div style="border: 1px" class="content-wrapper">
			<input type="text" name="name" placeholder="메뉴명"><br>
			<input type="text" name="content" placeholder="메뉴 설명"><br>
			<input type="text" name="price" placeholder="가격"><br>
			<input type="file" name="img" accept="image/*"><br>
			<input type="submit" value="메뉴 추가">
			<input type="reset" value="취소">
		</div>
	</form>
	<!-- Footer -->
	<%@ include file="_footer.jsp"%>
</body>
</html>
