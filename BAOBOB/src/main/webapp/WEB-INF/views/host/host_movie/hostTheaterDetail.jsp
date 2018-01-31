<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${projectRes}phc/js/script.js"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark"
	onload="getSeatInfo(${vo.theater_col}, ${vo.theater_row}, ${state})">

	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp"%>

	<div class="content-wrapper">
		<c:if test="${vo==null || seat_vos==null}">
		alert("부적절한 접근입니다.");
		window.history.back();
	</c:if>
		<form name="hostTheaterDetailForm" action="hostTheaterModPro"
			method="post">
			<div class="container-fluid row">
				<div class="col-lg-10">
					<div class="card mb-3">
						<div class="card-header">${vo.theater_index}관좌석도</div>
						<div class="card-body p_body" id="theaterSeat" align="center">
							<!-- 상영관 좌석도 -->
						</div>
						<div class="card-footer small text-muted">아이콘을 선택하여 좌석을
							설정해주세요.</div>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="card mb-3">
						<button type="button" class="btn btn-primary"
							onclick="hostTheaterMod(${vo.theater_index}, ${vo.theater_col}, ${vo.theater_row});">수정</button>
					</div>
					<div class="card mb-3">
						<div class="card-header">상영관 설정</div>
						<div class="card-body" align="center">
							<table>
								<tr>
									<td>
										<button class="m_btn" type="button" onclick="spaceType('0')">
											<img class="p_img"
												src="${projectRes}images/phc/icon/theater_blank.png">
										</button>
									</td>
									<td>빈 공간</td>
								</tr>
								<tr>
									<td>
										<button class="m_btn" type="button" onclick="spaceType('1')">
											<img class="p_img"
												src="${projectRes}images/phc/icon/theater_in.png">
										</button>
									</td>
									<td>입구</td>
								</tr>
								<tr>
									<td>
										<button class="m_btn" type="button" onclick="spaceType('2')">
											<img class="p_img"
												src="${projectRes}images/phc/icon/theater_out.png">
										</button>
									</td>
									<td>출구</td>
								</tr>
								<tr>
									<td>
										<button class="m_btn" type="button" onclick="spaceType('3')">
											<img class="p_img"
												src="${projectRes}images/phc/icon/theater_bg.png">
										</button>
									</td>
									<td>일반석</td>
								</tr>
								<tr>
									<td>
										<button class="m_btn" type="button" onclick="spaceType('4')">
											<img class="p_img"
												src="${projectRes}images/phc/icon/theater_red.png">
										</button>
									</td>
									<td>프리미엄석</td>
								</tr>
								<tr>
									<td>
										<button class="m_btn" type="button" onclick="spaceType('5')">
											<img class="p_img"
												src="${projectRes}images/phc/icon/theater_pink.png">
										</button>
									</td>
									<td>커플석</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- Footer -->
	<script src="${projectRes}adminBootstrap/vendor/jquery/jquery.min.js"></script>
	<%@ include file="movie_footer.jsp"%>
</body>
</html>