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
<input type="button" style="color:white; background-color:lightgray; background:rgba(0, 0, 0, 0.6); width:${seatInfo.totalCol*45}px; height:25px;"  value="SCREEN"> <br><br>

<!-- 좌석도 이중포문으로 행렬 뿌려주기(좌석상태) -->
<c:forEach var="row" begin="0" end="${seatInfo.totalRow-1}" step="1">
	${seatRow[row]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	<c:forEach var="col" begin="1" end="${seatInfo.totalCol}" step="1">
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==0}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; border:0;">
			   <input id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="checkbox" name="seat_index" style="width:0; height:0;" disabled autocomplete="off">
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==1}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; background-image: url('${projectRes}/images/phc/icon/theater_in.png');">
			   <input id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="checkbox" name="seat_index" style="width:0; height:0;" disabled autocomplete="off">
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==2}">
			<label  class="btn btn" style="margin:1px 1px; height:35; width:35; background-image: url('${projectRes}/images/phc/icon/theater_out.png');">
			   <input id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="checkbox" name="seat_index" style="width:0; height:0;" disabled autocomplete="off">
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==3}">
			<label id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" class="btn btn" style="margin:1px 1px; height:35; width:35; border:2px solid green;">
			   <button id="btn${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" style="width:0; height:0;" onclick="CountChecked(this)" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">${col}</button>
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==4}">
			<label id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" class="btn btn" style="margin:1px 1px; height:35; width:35; border:2px solid red;">
				<button id="btn${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" style="width:0; height:0;" onclick="CountChecked(this)" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">${col}</button>
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==5}">
			<label id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" class="btn btn" style="margin:1px 1px; height:35; width:35; border:2px solid pink;">
				<button id="btn${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="button" style="width:0; height:0;" onclick="CountChecked(this)" name="seat_index" autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">${col}</button>
			</label>
		</c:if>
		<c:if test="${seatInfo.state[(row)*seatInfo.totalCol-1+col]==6}">
			<label class="btn btn" style="margin:1px 1px; height:35; width:35; background-image: url('${projectRes}/images/phc/icon/theater_comp.png');">
 				<input id="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}" type="checkbox" style="width:0; height:0;" name="seat_index" disalbed autocomplete="off" value="${seatInfo.seat_index[(row)*seatInfo.totalCol-1+col]}">${col}
			</label>
		</c:if>
	</c:forEach>
	<br>
</c:forEach>
