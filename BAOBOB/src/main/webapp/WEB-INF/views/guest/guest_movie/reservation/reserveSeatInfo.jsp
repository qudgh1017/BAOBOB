<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ include file="/resources/setting.jsp"%>
<!-- CSS,JavaScript 참조 -->
<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
<br>
${allCnt}
<% 
	String[] seatRow = {"A","B","C","D","E","F","G","H","I","J","k","L",
	                    "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
	request.setAttribute("seatRow",seatRow);
%>

<!-- 좌석도  -->
<input type="button" style="color:white; background-color:lightgray; background:rgba(0, 0, 0, 0.6); width:${seatInfo.totalCol*45}px; height:25px;"  value="SCREEN"> <br><br>

<c:forEach var="row" begin="0" end="${seatInfo.totalRow-1}" step="1">
	<div class="btn-group" data-toggle="buttons">
	${seatRow[row]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:forEach var="col" begin="1" end="${seatInfo.totalCol}" step="1">
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==0}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; border:0;">
			   <input type="checkbox" name="seat_index" style="width:30; height:30;" disabled autocomplete="off">
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==1}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; background-image: url('${projectRes}/images/phc/icon/theater_in.png');">
			   <input type="checkbox" name="seat_index" style="width:30; height:30;" disabled autocomplete="off">
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==2}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; background-image: url('${projectRes}/images/phc/icon/theater_out.png');">
			   <input type="checkbox" name="seat_index" style="width:30; height:30;" disabled autocomplete="off">
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==3}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; border:2px solid green;">
			   <span style="width:30; height:30;"><input type="checkbox" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">${col}</span>
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==4}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; border:2px solid red;">
				<span style=" width:30; height:30;"><input type="checkbox" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">${col}</span>
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==5}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; border:2px solid pink;">
				<span style=" width:30; height:30;"><input type="checkbox" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">${col}</span>
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==6}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; background-image: url('${projectRes}/images/phc/icon/theater_comp.png');">
 				<span style=" width:30; height:30;"><input type="checkbox" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">${col}</span>
			</label>
		</c:if>
	</c:forEach>
	</div>
	<br>
</c:forEach>
