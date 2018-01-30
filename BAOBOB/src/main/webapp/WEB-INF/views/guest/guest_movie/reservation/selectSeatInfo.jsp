<!-- AJAX처리된 페이지: AJAX처리된 reserveSeatInfo페이지에서 좌석 선택시 그 해당 좌석의 정보를 보내서 값 처리해서 필요한 정보의 형태 바꿔주기-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>

<% 
	String[] seatRow = {"A","B","C","D","E","F","G","H","I","J","k","L",
	                    "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
	request.setAttribute("seatRow",seatRow);
%>
<!-- ajaxSeatInfo의 정보를 쌓아주는 msg -->
<!-- 좌석정보(A1 B3 이런거) -->
<c:forEach var="seat" items="${seats}">
	${seatRow[seat.seat_row-1]}${seat.seat_col}
</c:forEach>