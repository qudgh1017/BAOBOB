<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		.mar{margin:13rem auto;padding:0;}
		body .card{max-width:700px;margin:0 auto;}
		.cnt{font-size:50px;display:block;text-align:center;margin:20px;}
		.clear{clear:both;}
		.item{float:left;}
		.u{width:209px;text-align:center;}
		.u > li{padding:10px;}
		body .l_h{border-bottom:1px solid #e9ecef;font-weight:bold;padding-bottom:20px;}
	</style>
</head>
<body>
<c:if test="${cnt != 0}">
	<%@ include file="../common/head.jsp" %>

	<%@ include file="guestParkingHeader.jsp" %>
	
	<section>
	  <div class="container mar">
	  
	  		<span class="cnt">결제가 완료되었습니다.</span>
	  		<div class="card md-3">
		  		<div class="card-header">결제 정보</div>
				<div class="card-body">
					<ul class="clear">
						<li class="item">
							<ul class="u">
								<li class="l_h">입차 시간</li>
								<li>${ph.p_history_in}</li>
							</ul>
						</li>
						<li class="item">
							<ul class="u">
								<li class="l_h">출차 시간</li>
								<li>${ph.p_history_out}</li>
							</ul>
						</li>
						<li class="item">
							<ul class="u">
								<li class="l_h">결제 금액</li>
								<li><fmt:formatNumber value="${ph.p_history_price}" type="number"/> 원</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="card-footer small text-muted">
					영화 ${movie}건, 식당 ${rest}건에 대한 할인이 적용된 금액입니다.
				</div>
			</div>
	  </div>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../common/footerCopyright.jsp" %>
	
	<script type="text/javascript">
		var back_btn = document.getElementById('back_btn'); 
		back_btn.innerHTML = '확인';
		back_btn.setAttribute('onclick', 'window.location="guestParkingMain"');
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert('결제 실패');
		window.location = 'guestParkingOut';
	</script>
</c:if>
</body>
</html>