<!-- 영화예매 처리페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/resources/setting.jsp"%>
<body>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<!-- alert 디자인 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 내꺼 JavaScript 참조 -->
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>

<!-- 결제 성공시 -->
<c:if test="${cnt==1 && updateCnt==1 && updateStepCnt==1}">
	<script type="text/javascript">
		reservationSuccess(reservation_success);
	</script>
</c:if>

<!-- 실패시 -->
<c:if test="${cnt==0 || updateSeatCnt==0 || updateCnt==0 || updatePoint==0 || updateStepCnt==0}">
	<script type="text/javascript">
		reservationError(reservation_error);
	</script>
</c:if>

<!-- int cnt = 0; //insert용 cnt
int updateSeatCnt = 0; //for문 돌리는 seat_state  0일때만 보냄
int updateCnt = 0; // update용 cnt
int updatePoint = 0; // member_point 썼을때
int updateStepCnt = 0; //등업용 -->
</body>
</html>