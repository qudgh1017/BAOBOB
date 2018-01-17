<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp"%>

<div class="container">
<br><br><br><br>

<h2><center>예약 확인</center></h2>
<br>
<table class="table center-block" style="width: 260px;">
	<tr>
		<th>영화명</th>
		<td>${sdto.title1}</td>
	</tr>
	<tr>
		<th>상영관</th>
		<td>1층 ${dto.theater_num}관</td>
	</tr>
	<tr>
		<th>일시</th>
		<td><fmt:formatDate value="${sdto.showtime}" pattern="YYYY.MM.dd(E) HH:mm" /></td>
	</tr>
	<tr>
		<th>좌석</th>
		<td>${dto.seat_num}</td>
	</tr>
	<tr>
		<td colspan="2"><button class="btn" type="button" onclick="location.href='/uuplex/c-box'">메인으로</button></td>
	</tr>
</table>
</div>
