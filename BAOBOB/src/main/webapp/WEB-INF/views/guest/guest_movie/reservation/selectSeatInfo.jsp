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