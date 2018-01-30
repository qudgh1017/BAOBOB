<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<br>

<% 
	String[] seatRow = {"A","B","C","D","E","F","G","H","I","J","k","L",
	                    "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
	request.setAttribute("seatRow",seatRow);
%>


<!-- 좌석도  -->
<button type="button" style="color:white; background-color:lightgray; background:rgba(0, 0, 0, 0.6); width:${seatInfo.totalCol*25}px; height:25px;">SCREEN</button> <br><br>

<c:if test="${seatInfo.totalRow<15 || seatInfo.totalCol<8}">
	<c:set var="size" value="30"/>
	<c:set var="fontSize" value="12"/>
</c:if>
<c:if test="${(seatInfo.totalRow>=15 && seatInfo.totalRow<=24)  || (seatInfo.totalCol>=8 && seatInfo.totalCol<=12)}">
	<c:set var="size" value="25"/>
	<c:set var="fontSize" value="11"/>
</c:if>
<c:if test="${seatInfo.totalRow>24 || seatInfo.totalCol>12}">
	<c:set var="size" value="20"/>
	<c:set var="fontSize" value="10"/>
</c:if>

<!-- 좌석도 이중포문으로 행렬 뿌려주기(좌석상태) -->
<c:forEach var="row" begin="0" end="${seatInfo.totalRow-1}" step="1">
	${seatRow[row]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	<c:forEach var="col" begin="1" end="${seatInfo.totalCol}" step="1">
	
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==0}">
		   <button id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" name="seat_index" style="width:${size}; height:${size}; border:0;" disabled autocomplete="off"></button>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==1}">
		   <button id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" name="seat_index" disabled autocomplete="off">
		   		<img src="${projectRes}/images/phc/icon/theater_in.png" style="height:${size}; width:${size};">
		   </button>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==2}">
		   <button id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" name="seat_index" disabled autocomplete="off">
		   		<img src="${projectRes}/images/phc/icon/theater_out.png" style="height:${size}; width:${size};">
		   </button>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==3}">
		   <button id="btn${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" style="width:${size}; height:${size}; border:2px solid green;" onclick="CountChecked(this)" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">
		   		<span style="font-size:${fontSize}px">${col}</span>
		   </button>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==4}">
			<button id="btn${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" style="width:${size}; height:${size}; border:2px solid red;" onclick="CountChecked(this)" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">
				<span style="font-size:${fontSize}px">${col}</span>
			</button>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==5}">
			<button id="btn${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" style="width:${size}; height:${size}; border:2px solid pink;" onclick="CountChecked(this)" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">
				<span style="font-size:${fontSize}px">${col}</span>
			</button>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==6}">
			<button id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" name="seat_index" disalbed autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">
				<img src="${projectRes}/images/phc/icon/theater_comp.png" style="height:${size}; width:${size};">
			</button>
		</c:if>
	</c:forEach>
	<br>
</c:forEach>
