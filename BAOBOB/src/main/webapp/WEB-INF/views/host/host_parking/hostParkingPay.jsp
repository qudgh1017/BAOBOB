<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		li{color:#212529;}

		.clearfix{clear:both;}
		.ul_head{font-weight:bold;border-bottom:2px solid #e9ecef;}
		.ul_body{border-bottom:1px solid #e9ecef;}
		.li_item{float:left;padding:5px 15px;border-right:1px solid #e9ecef;text-align:center;}
		.li_head{padding-bottom:10px;text-align:center;}
		
		.l1{width:7%;}
		.l2{width:15%;}
		.l3{width:15%;}
		.l4{width:24%;}
		.l5{width:24%;}
		.l6{width:15%;border-right:none;}
		
		.card-footer{text-align:center;}
		body .pagination{display:block;}
		.page-item{border:1px solid #ddd;padding:.5rem .75rem;}
		body .current{background:white;color:#007bff;}
		
		/* 가로 스크롤 */
		.mb-3{overflow-x:auto;}
		.min_size{min-width:1012px;}
	</style>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="hostParkingNavigation.jsp" %>
	
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="card mb-3">
				<div class="card-header min_size">납부 내역</div>
				<div class="card-body min_size">
					<c:if test="${postCnt > 0}">
					<ul class="ul_top">
						<li>
							<ul class="clearfix ul_head">
								<li class="li_item li_head l1">번호</li>
								<li class="li_item li_head l2">날짜</li>
								<li class="li_item li_head l3">회원</li>
								<li class="li_item li_head l4">입차</li>
								<li class="li_item li_head l5">출차</li>
								<li class="li_item li_head l6">금액</li>
							</ul>
						</li>
						<li>
							<c:forEach var="ph" items="${phs}">
							<ul class="clearfix ul_body">
								<li class="li_item l1">
									${number}
									<c:set var="number" value="${number-1}"/>
								</li>
								<li class="li_item l2">${fn:substring(ph.p_history_date, 0, 10)}</li>
								<li class="li_item l3">${ph.history.getMember_id()}</li>
								<li class="li_item l4">${ph.p_history_in}</li>
								<li class="li_item l5">${ph.p_history_out}</li>
								<li class="li_item l6">${ph.p_history_price}</li>
							</ul>
							</c:forEach>
						</li>
					</ul>
					</c:if>
					<c:if test="${postCnt == 0}">
						납부 내역이 존재하지 않습니다.
					</c:if>
				</div>
				<div class="card-footer small text-muted min_size">
					<c:if test="${postCnt > 0}">
					<nav class="pagination">
						<c:if test="${startNav > navSize}">
							<a class="page-item" href="hostParkingPay">시작</a>
							<a class="page-item" href="hostParkingPay?pageNum=${startNav - navSize}">전</a>
						</c:if>
						<c:forEach var="page" begin="${startNav}" end="${endNav}">
							<c:if test="${pageNum == page}">
								<a class="page-item current" href="hostParkingPay?pageNum=${page}">${page}</a>
							</c:if>
							<c:if test="${pageNum != page}">
								<a class="page-item" href="hostParkingPay?pageNum=${page}">${page}</a>
							</c:if>
						</c:forEach>
						<c:if test="${endNav < navCnt}">
							<a class="page-item" href="hostParkingPay?pageNum=${(endNav + navSize) > navCnt ? navCnt : (endNav + navSize)}">후</a>
							<a class="page-item" href="hostParkingPay?pageNum=${navCnt}">끝</a>
						</c:if>
					</nav>
					</c:if>
				</div>
			</div>
			<!-- <div class="card mb-3">
				<div class="card-header">차트</div>
				<div class="card-body"></div>
				<div class="card-footer small text-muted">가장 많은 날은 '월요일'</div>
			</div> -->
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
	
	<script src="${projectRes}ymk/js/parkingCart.js"></script>
</body>
</html>