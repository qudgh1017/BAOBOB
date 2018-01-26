<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>    
<%@include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
</head>
<style>
.active{
	background-color:#000000;
	color:white;
}
</style>
<!-- 내 전용 script -->
<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
<!-- 좌석관련 script -->
<script type="text/javascript" src="${projectRes}ybh/js/seat.js"></script>
<% 
	String[] seatRow = {"A","B","C","D","E","F","G","H","I","J","k","L",
	                    "M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
	request.setAttribute("seatRow",seatRow);
%>
<body>


	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	
<!-- 결제내역에 사용할 변수 -->
	<c:set var="sum" value="0"/>
	<c:forEach var="seat" items="${seats}">
		<c:set var="sum" value="${sum+seat.seat_price}"/>
	</c:forEach>
	<!-- 처음 초기화 -->
	<c:set var="sunSalePrice" value="0"/>
	<c:set var="moonSalePrice" value="0"/>
	<c:set var="teenagerSalePrice" value="0"/>
	<c:set var="pointSalePrice" value="0"/>
	<c:set var="totalSalePrice" value="0"/>
	
	<!-- 일반+청소년 사람수 -->
	<c:set var="totalCnt" value="${teenagerCnt+adultCnt}"/>
	<!-- 조조할인(명당 2000원) -->
	<c:if test="${schedule.schedule_MDNstate==0}">
		<c:set var="sunSalePrice" value="${totalCnt*2000}"/>
	</c:if>
	<!-- 심야할인(명당 2000원) -->
	<c:if test="${schedule.schedule_MDNstate==2}">
		<c:set var="moonSalePrice" value="${totalCnt*2000}"/>
	</c:if>	
	<!-- 청소년 할인(명당 2000원) -->
	<c:set var="teenagerSalePrice" value="${teenagerCnt*2000}"/>
	<!-- 총 할인가격 구하기 -->
	<c:set var="totalSalePrice" value="${sunSalePrice+moonSalePrice+teenagerSalePrice+pointSalePrice}"/>	
	<!-- 실제 거래가격 구하기 -->
	<c:set var="movie_history_price" value="${sum-totalSalePrice}"/>
	
	<section style="padding-top:0px;">
	<!-- form 넘겨야할 값:seat_index배열(${str_seat_index_info}(service에서 split으로 배열형으로 바꿔주기)), theater_schedule_index, totalCnt, movie_index, member_point, movie_history_price,  -->
		<form action="reservationMoviePro" name="reservationMovieForm" method="post" onsubmit="return cardInfoChk();">
			<!-- 5개 + 중간의 member_point보내주기 -->
			<div class="form-group">
				<input type="hidden" name="str_seat_index_info" value="${str_seat_index_info}">
				<input type="hidden" name="theater_schedule_index" value="${theater_schedule_index}">
				<input type="hidden" name="totalCnt" value="${totalCnt}"><!-- 총 사람수 -->
				<input type="hidden" name="movie_index" value="${movie.movie_index}">
				<input type="hidden" name="movie_history_price" value="${movie_history_price}">
			</div>
			
			<div class="container">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10" align="left">
						<br>
						<h3 align=left;>빠른 예매</h3>
						<hr style="border:2px solid black;">
					</div>
					<div class="col-md-1"></div>
				</div>
				
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10" align="center" style="height:40px; color:white; font-weight:bold; border:1px solid white; background-color:black">
						결제
					</div>
					<div class="col-md-1"></div>
				</div>
			
				<div class="row">
					<div class="col-md-1"></div>
				<!-- 포인트 및 신용카드 결제 창 -->
					<div class="col-md-7" align="left" style="padding:0; height:550px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
						<div style="width:100%; height:20px";></div>
						<div align="left" style="width:100%; height:40px; color:white; background-color:black">
							STEP1. 바오밥 point 할인
						</div>
						<div align="left" style="width:100%; height:160px;">
							<br>
							<table style="width:100%; height:100px; font-weight:bold;">
								<tr style="height:50px;">
									<td colspan="2">바오밥 포인트</td>
								</tr>
								<tr style="height:50px;">
									<td style="width:50%">
										<div class="form-group">
											사용가능 포인트: ${member.member_point}
										</div>
									</td>
									<td style="width:50%">
										<div class="form-group">
											사용할 포인트: <label><input class="form-control" name="member_point" type="text" value="0" style="width:80px;" onchange="point('${member.member_point}',this, '${totalSalePrice}', '${movie_history_price}');"></label>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div align="left" style="width:100%; height:40px; color:white; background-color:black">
							STEP2. 최종결제(카드정보 입력)
						</div>
						<div align="left" style="width:100%; height:160px;">
							<br>
							<div class="form-group">
								카드종류&nbsp;&nbsp;&nbsp;
								<select class="form-control" name="card_bank" style="width:100px; display:inline-block;">
									<option value="BC">BC카드</option>
									<option value="국민">국민카드</option>
									<option value="삼성">삼성카드</option>
									<option value="신한">신한카드</option>
									<option value="현대">현대카드</option>
									<option value="KEB">KEB카드</option>
									<option value="카카오뱅크">카카오뱅크카드</option>
									<option value="우리">우리카드</option>
								</select><br><br>
								카드번호&nbsp;&nbsp;&nbsp;
								<label><input class="form-control" name="card_num1" type="text" style="width:80px;"></label>
								&nbsp;-&nbsp;
								<label><input class="form-control" name="card_num2" type="text" style="width:80px;"></label>
								&nbsp;-&nbsp;
								<label><input class="form-control" name="card_num3" type="text" style="width:80px;"></label>
								&nbsp;-&nbsp;
								<label><input class="form-control" name="card_num4" type="text" style="width:80px;"></label>
								<br><br>
								비밀번호&nbsp;&nbsp;&nbsp;
								<label><input class="form-control" name="card_pwd" type="password" style="width:60px;"></label>**
								<br><br>
								유효기간 &nbsp;&nbsp;&nbsp;
								<label><input class="form-control" name="card_month" type="text" style="width:60px;" placeholder="month"></label>월&nbsp;&nbsp;
								<label><input class="form-control" name="card_year" type="text" style="width:60px;" placeholder="year"></label>년
							</div>
							
						</div>
					</div>
				<!-- 결제내역 창 -->
					<div class="col-md-3" align="center" style="padding:0; height:550px; color:black; font-weight:bold; border:1px solid white; background-color:white;">
						<br>
					<!-- 결제하실 금액 -->	
						<div style="width:100%; height:30px; background-color:#EEEEEE">
							결제하실 금액
						</div>
						<div align="right" style="width:100%; height:50px;">
							${sum}원
						</div>
					<!-- 할인내역 -->
						<div style="width:100%; height:30px; background-color:#DDDDDD">
							할인내역
						</div>
						<div align="right" style="width:100%; height:150px;">
							
							
							<!-- 조조할인(명당 2000원) -->
							<c:if test="${schedule.schedule_MDNstate==0}">
								<table style="width:100%; height:40px; padding:0; font-weight:bold;">
									<tr>
										<td>조조영화  ${totalCnt}명</td>
										<td align="right">-${sunSalePrice}원</td>
									</tr>
								</table>
							</c:if>
							<!-- 심야할인(명당 2000원) -->
							<c:if test="${schedule.schedule_MDNstate==2}">
								<div style="width:100%; height:40px;">
									<div align="left">심야영화  ${totalCnt}명</div> 
									<div align="right">-${moonSalePrice}원</div>
								</div>
							</c:if>
							<!-- 청소년 할인(명당 2000원) -->
							<table style="width:100%; height:40px; padding:0; font-weight:bold;">
								<tr>
									<td>청소년 ${teenagerCnt}명</td>
									<td align="right">-${teenagerSalePrice}원</td>
								</tr>
							</table>
							
							<!-- 포인트 사용시 -->
							<div style="width:100%; height:40px;">
								<table style="width:100%; height:40px; padding:0; font-weight:bold;">
									<tr>
										<td>포인트사용</td>
										<td id="point" align="right">
											${pointSalePrice}원
										</td>
									</tr>
								</table>
							</div>
						
						</div>
						<div style="width:100%; height:30px; background-color:#DDDDDD">
							총 할인 금액
						</div>
						<div id="totalSalePrice" align="right" style="width:100%; height:40px;">
							- ${totalSalePrice}원
						</div>
					<!-- 실제 결제금액 -->
						<div style="width:100%; height:30px; background-color:black; color:white">
							남은 결제금액
						</div>
						<div id="movie_history_price" align="right" style="width:100%; height:40px;">
							${movie_history_price}원
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>	
			</div>
		<!-- 밑에 정보 보여주는 창 -->	
			<div class="row" style="background-color:black; height:150px;">
				<!-- 영화정보 -->
				<div class="col-md-3" align="center"; style="border: solid 1px gray; color:white;">
					<div id="movieInfo">
						<%@include file="/WEB-INF/views/guest/guest_movie/reservation/reserveMovieInfo.jsp" %>
					</div>
				</div>
				<!-- 일시, 상영관, 인원 -->
				<div class="col-md-3" align="left" style="border: solid 1px gray; color:white">
					<div id="scheduleInfo">
						<%@include file="/WEB-INF/views/guest/guest_movie/reservation/reserveScheduleInfo.jsp" %>
					</div>
				</div>
				<!-- 좌석정보, 가격 -->
				<div class="col-md-3" align="left" style="border: solid 1px gray; color:white; font-size:13px; font-weight:bold;">
					<div id="seatInfo">
						<br>
						일반:${adultCnt}명 &nbsp;&nbsp;&nbsp;
						청소년:${teenagerCnt}명<br><br>
						좌석번호:
						<c:forEach var="seat" items="${seats}">
							${seatRow[seat.seat_row-1]}${seat.seat_col}
						</c:forEach>
					</div>
				</div>
				<!-- 좌석선택 아이콘 -->
				<div class="col-md-3" align="center" style="border: solid 1px gray; color:gray; font-weight:bold;" >
					<div id="nextDealButton" >
						<div style="font-size:13px; font-weight:bold;">
							<br>
							<button class="btn btn-danger" style="width:100px; height:80px; font-size:18px; font-weight:bold;">결  제</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
</body>
</html>