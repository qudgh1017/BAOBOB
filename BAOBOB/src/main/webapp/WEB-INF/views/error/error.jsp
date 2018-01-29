<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/setting.jsp"%>
<%@ page isErrorPage="true" %>

<title>Insert title here</title>
<script type="text/javascript">
function error(errorCode) {
    alert("처리도중 에러("+errorCode+")가 발생했습니다. 메인화면으로 이동합니다.");
    window.location="mainIndex";
}
</script>

</head>
<body onload="error(${errorCode})">

</body>
</html>