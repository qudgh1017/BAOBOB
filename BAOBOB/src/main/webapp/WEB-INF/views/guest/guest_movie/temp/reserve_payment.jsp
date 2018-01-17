<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<script type="text/javascript">
	$('#myTab a').click(function(e) {
		e.preventDefault()
		$(this).tab('show')
	})

	$('#myTab a[href="#profile"]').tab('show') // Select tab by name
	$('#myTab a:first').tab('show') // Select first tab
	$('#myTab a:last').tab('show') // Select last tab
	$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)
</script>
<style>
.list {
	margin: 100px auto 20px;
	width: 1170px;
	height: 1000px;
}

.movieDiv {
	width: 280px;
	height: 200px;
	float: left;
	color: white;
	margin: auto 3px;
}

.movieDiv td, .centerPart td {
	width: 75px;
}

.centerPart {
	margin-top: 40px;
	margin-left: 5px;
	margin-right: 5px;
	border-left: 3px solid #8C8C8C;
	border-right: 3px solid #8C8C8C;
	width: 280px;
	height: 110px;
	float: left;
	color: white;
}

li {
	list-style-type: none;
}

.part {
	float: left;
}

.first th {
	background-color: #EAEAEA;
	text-align: center;
	font-size: 20px;
}

.second th {
	background-color: #D5D5D5;
	text-align: center;
	font-size: 20px;
}

.third th {
	background-color: #A6A6A6;
	text-align: center;
	font-size: 20px;
}

.calculate {
	margin: 10px 15px;
}

.calculate input {
	border: none;
	background-color: rgba(0, 0, 0, 0);
}

.lgcategory {
	font-size: 27px;
}

.icon1 {
	float: right;
	height: 30px;
	width: 30px;
	font-size: 30px;
}

.mainmenu li {
	font-size: 20px;
}

.paymenttable th, td {
	font-size: 17px;
}
</style>

<div class="container">
	<form action="/uuplex/c-box/reservationchk" method="post">
	<input type="hidden" name="ticketcnt" value="${param.ticketcnt}">
	<input type="hidden" name="seatnum" value="${param.seatnum}">
	<input type="hidden" name="schedule_num" value="${param.schedule_num}">
	<input type="hidden" name="id" value="${sessionScope.id}">
		<div class="list">
			<h2>
				<button type="button" class="btn btn-default btn-lg"
					style="border: 5px" onclick="history.go(-1)">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>좌석
					선택으로 돌아가기
				</button>
			</h2>

			<div class="part" style="width: 900px">

				<!-- 첫번째 아코디언 (할인 수단 선택)시작-->
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<!-- step1 분류 -->
						<div class="panel-heading"
							style="background-color: #191919; color: white;" role="tab"
							id="headingOne">
							<h4 class="panel-title lgcategory">
								<strong>STEP1</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 할인수단 선택
							</h4>
						</div>

					</div>
					<div class="panel panel-default">
						<!-- 할인 쿠폰 시작 -->
						<div class="panel-heading" style="height: 50px" role="tab"
							id="headingOne">
							<span style="float: left; margin: 0 0 0 100px; font-size: 23px;">할인
								쿠폰</span> <a style="margin-left: 590px;" data-toggle="collapse"
								data-parent="#accordion" href="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne"> <span
								class="glyphicon glyphicon-chevron-down icon1"></span>
							</a>

						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<h4>
									UU-BOX 할인 쿠폰 &nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-info" style="border: 5px;">
										<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;등록하기
									</button>
								</h4>
								<table class="table table-bordered">
									<tr>
										<th>사용가능 쿠폰</th>
										<th>유효기간</th>
									</tr>

								</table>
							</div>
						</div>
					</div>
					<!-- 할인 쿠폰 끝 -->
					<!-- 포인트 시작 -->
					<div class="panel panel-default">
						<div class="panel-heading" style="height: 50px;" role="tab"
							id="headingOne">
							<span style="float: left; margin: 0 0 0 100px; font-size: 23px;">포인트</span>
							<a style="margin-left: 590px;" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTwo"
								aria-expanded="true" aria-controls="collapseOne"> <span
								class="glyphicon glyphicon-chevron-down icon1"></span>
							</a>

						</div>

						<div id="collapseTwo" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<h4>&nbsp;&nbsp;UU-BOX 포인트</h4>
								<table class="table table-bordered">
									<tr>
										<td>현재 보유 포인트 : 3,806P</td>
										<td>사용할 포인트 : <input type="text" name="avPoint"
											style="width: 70px">&nbsp;P
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
											name="useAll" value="useAll">모두 사용
										</td>
									</tr>
								</table>
								<span style="color: #8C8C8C; font-size: 10px">
									&nbsp;&nbsp;&nbsp;UU-BOX 포인트는 1,000P부터 10P단위로 사용가능합니다. </span>
							</div>
						</div>
					</div>

				</div>
				<!-- 첫번째 아코디언 끝-->

				<!-- 두번째 아코디언 (결제정보입력)시작-->
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<!-- step1 분류 -->
						<div class="panel-heading"
							style="background-color: #191919; color: white;" role="tab"
							id="headingOne">
							<h4 class="panel-title lgcategory">
								<strong>STEP2</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 결제정보 입력
							</h4>
						</div>

					</div>
					<div class="panel panel-default">
						<div role="tabpanel">

							<!-- Nav tabs -->
							<ul class="nav nav-tabs mainmenu" role="tablist">
								<li role="presentation" class="active"><a href="#home"
									aria-controls="home" role="tab" data-toggle="tab">신용카드</a></li>
								<li role="presentation"><a href="#profile"
									aria-controls="profile" role="tab" data-toggle="tab">휴대폰 결제</a></li>
								<li role="presentation"><a href="#messages"
									aria-controls="messages" role="tab" data-toggle="tab">계좌 이체</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="home">
									<form name="creditCardForm">
										<table class="table paymenttable">
											<tr>
												<th>카드종류</th>
												<td><select name="card">
														<option value="">카드를 선택하세요</option>
														<option value="BC카드">BC카드</option>
														<option value="국민카드">국민카드</option>
														<option value="삼성카드">삼성카드(올앳포함)</option>
														<option value="신한카드">신한카드</option>
														<option value="현대카드">현대카드</option>
														<option value="KEB하나카드">KEB하나카드(구.외환)</option>
														<option value="우리카드">우리카드</option>
														<option value="롯데카드">롯데카드</option>
														<option value="시티카드">시티카드</option>
														<option value="NH카드">NH카드</option>
														<option value="KDB산업은행">KDB산업은행</option>
														<option value="우체국카드">우체국카드</option>
														<option value="스탠다드차타드은행카드">스탠다드차타드은행카드</option>
												</select></td>
											</tr>
											<tr>
												<th>카드번호</th>
												<td><input type="text" style="width: 60px">&nbsp;-&nbsp;
													<input type="text" style="width: 60px">&nbsp;-&nbsp;
													<input type="text" style="width: 60px">&nbsp;-&nbsp;
													<input type="text" style="width: 60px"></td>
											</tr>
											<tr>
												<th>비밀번호</th>
												<td><input type="text" style="width: 35px">&nbsp;*&nbsp;*
												</td>
											</tr>
											<tr>
												<th>유효기간</th>
												<td><input type="text" style="width: 35px">월&nbsp;&nbsp;
													<input type="text" style="width: 35px">년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<font color="gray">예) 2015년 09월 -> 09월 15일</font></td>
											</tr>
											<tr>
												<th>법정생년월일(6자리)</th>
												<td><input type="text" style="width: 80px">&nbsp;-
													&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;

													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox">&nbsp;법인공용카드
													사용</td>
											</tr>
										</table>
									</form>

								</div>

								<!--  휴대폰 결제 시작 -->
								<div role="tabpanel" class="tab-pane" id="profile">

									<table class="table">
										<tr>
											<td>결제금액</td>
											<td>14,680원</td>
										</tr>
										<tr>
											<td>상품명</td>
											<td>영화티켓 예매</td>
										</tr>
										<tr>
											<td colspan="2">
												<div>

													<b>휴대폰 결제 순서</b><br> <br> 1. 우측 하단에 있는 "결제하기" 버튼
													클릭해주세요.<br> 2. 예매내역 확인 후 결제하기 버튼 클릭 시 결제 팝업창이 뜹니다.<br>
													3. 해당 팝업에서 통신사 선택 후 정보를 입력해주세요. <br> <br> <font
														color="red">※ 휴대폰 결제 진행시 원할한 사용을 위하여 다음 사항을 꼭
														확인하세요.</font><br> * 팝업 차단 설정을 꼭 해제하셔야 합니다. (도구→팝업 차단 끄기)<br>
													* 팝업 차단 해제 시, 웹 브라우저 새로고침으로 인하여 최대 10분 동안 동일 좌석 선택이 제한 될 수
													있습니다.<br>

												</div>
											</td>
										</tr>
									</table>

								</div>
								<!--  휴대폰 결제 끝 -->
								<!-- 계좌 이체 시작-->
								<div role="tabpanel" class="tab-pane" id="messages">

									<table class="table">
										<tr>
											<td>결제금액</td>
											<td>14,680원</td>
										</tr>
										<tr>
											<td>상품명</td>
											<td>영화티켓 예매</td>
										</tr>
										<tr>
											<td colspan="2">
												<div>
													<b>계좌이체 순서</b><br> <br> 1. 아래 결제하기 버튼 클릭 후 다음 단계로
													이동<br> 2. 결제내역 확인 후 결제하기 버튼 클릭 시 팝업창이 뜸<br> 3. 해당
													팝업에서 원하는 은행을 선택 후 계좌이체 정보를 입력하시면 됩니다. <br> <br> <font
														color="red">※ 계좌이체 진행시 원활한 사용을 위하여 다음 사항을 꼭 확인해주세요.</font><br>
													1. 익스플로어에서만 사용 가능합니다. (크롬, 파이어폭스, 사파리 등 사용 불가)<br> 2.
													팝업 차단 설정을 꼭 해제하셔야 합니다.(도구 → 팝업 차단 끄기)<br> * 팝업 차단 해제
													시, 웹 브라우저 새로고침으로 인하여 최대 10분 동안 동일 좌석 선택이 제한 될 수 있습니다.<br>

												</div>
											</td>
										</tr>
									</table>
								</div>
								<!-- 계좌 이체 끝-->

							</div>

						</div>
					</div>
				</div>
				<!-- 두번째 아코디언 끝-->

				<!-- 영화 예매 정보 -->
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-body" style="background-color: #191919;">
							<div class="movieDiv">
								<img style="float: left; padding: 5px; margin: 10px;"
									src="${resources}/c-box/img/movie_poster/얼라이드.jpg"
									width="120px" height="180px">
								<div
									style="float: left; width: 120px; height: 180px; padding: 5px; margin: 15px auto;">
									<ul>
										<li>&nbsp;</li>
										<li>얼라이드></li>
										<li>&nbsp;</li>
										<li>2D</li>
										<li>15세 관람가</li>
									</ul>
								</div>
							</div>
							<div class="centerPart">
								<div style="width: 250px; height: 140px; margin: auto auto;">
									<table>
										<tr>
											<td>극장</td>
											<th>CGV 강남></th>
										</tr>
										<tr>
											<td>일시</td>
											<th>2017.2.8(수) 26:40</th>
										</tr>
										<tr>
											<td>상영관</td>
											<th>1관 6층</th>
										</tr>
										<tr>
											<td>인원</td>
											<th>일반 2명</th>
										</tr>
									</table>
								</div>
							</div>
							<div class="movieDiv">
								<div style="width: 250px; height: 180px; margin: 40px 10px;">
									<table>
										<tr>
											<td>좌석명</td>
											<th>Standard석</th>
										</tr>
										<tr>
											<td>좌석번호</td>
											<th>G7, G8</th>
										</tr>

									</table>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>



			<!-- 결제 금액 정산 -->
			<div class="part" style="width: 240px">
				<table class="table calculate first">
					<tr>
						<th>결제하실 금액</th>
					</tr>
					<tr>
						<td align="right"><input type="text" name="total"
							value="${param.total}" style="text-align: right;">원</td>
					</tr>
				</table>
				<br>
				<table class="table calculate second">
					<tr>
						<th>할인 내역</th>
					</tr>
					<tr>
						<td>CJ ONEPOINT 3,320원</td>
					</tr>
					<tr>
						<th>총 할인 금액</th>
					</tr>
					<tr>
						<td>-3,320원</td>
					</tr>
				</table>
				<br>
				<table class="table calculate third">
					<tr>
						<th>결제 내역</th>
					</tr>
					<tr>
						<td>신용카드 14,680원</td>
					</tr>
					<tr>
						<th>남은 결제금액</th>
					</tr>
					<tr>
						<td>신용카드 14,680원</td>
					</tr>
				</table>
				<div style="width: 240px; hight: 200px; margin: 50px 15px;">
					<button type="submit" class="btn btn-danger btn-lg"
						style="border: 2px solid #DB0000; width: 240px; hight: 100px;">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"
							style="font-size: 30px; width: 30px; hight: 30px; margin: 20px auto 25px">
						</span>&nbsp;&nbsp;<font size=6px>결제하기</font>
					</button>

				</div>
			</div>
		</div>
	</form>
</div>

