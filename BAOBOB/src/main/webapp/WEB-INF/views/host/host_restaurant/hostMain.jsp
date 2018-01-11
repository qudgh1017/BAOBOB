<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	/* data가 param 인경우 */
	$(document).ready(function() {
		$('#hostMenuList').click(function() {
			$.ajax({
				url : '/baobob/resources/chg/ajax/hostMenuList.jsp',
				type : 'GET',

				success : function(msg) {
					alert(msg);
					$('#result').html(msg);
				},
				error : function() {
					alert('오류');
				}
			});
		});
	});
</script>
<link href="${restaurant_css}" rel="stylesheet" type="text/css">
<script src="${restaurant_js}"></script>

</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="_navigation.jsp"%>

	<div id="result">
	</div>

	<!-- Footer -->
	<%@ include file="_footer.jsp"%>

</body>
</html>