<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	
	<style type="text/css">
		.clear{clear:both;}
		
		/* 전체  */
		.mar{margin:13rem auto;padding:0;}
		
		/* 완료 문구 */
		.cnt{font-size:50px;display:block;text-align:center;margin:20px;}
		
		/* 카드 모양 */
		body .card{max-width:700px;margin:0 auto;}
		
		/* 내역 */
		.item{float:left;}
		.u{width:209px;text-align:center;}
		.u > li{padding:10px;}
		body .l_h{border-bottom:1px solid #e9ecef;font-weight:bold;padding-bottom:20px;}
		
		/* 영수증 */
		.close-button{text-align:right;}
		.pay{width:400px;position:absolute;top:10%;left:15%;}
		.pay_dialog{padding:1rem 1rem;margin:1rem calc(1rem - 8px);position:relative;z-index:2;
		    -moz-box-shadow:0 0 3rem 1rem rgba(0,0,0,.5);-webkit-box-shadow:0 0 3rem 1rem rgba(0,0,0,.5);box-shadow:0 0 3rem 1rem rgba(0,0,0,.5);}
		.pay_con{border:1px solid #e5e5e5;padding:1rem;font-size:14px;margin-top:10px;}
		.text-center{display:block;font-weight:bold;}
		
		.itemL{float:left;}
		.itemR{float:right;}
		@media (min-width: 768px){
			.pay_dialog {margin:3rem calc(3rem - 8px);}
	    }
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
			
			<div class="portfolio-modal pay" id="pay-modal">
			  <div class="pay_dialog bg-white">
			    <a class="close-button d-none d-md-block portfolio-modal-dismiss" onclick="payModal();">
			      <i class="fa fa-3x fa-times"></i>
			    </a>
			    <div class="container pay_con">
					<span class="text-center">주차 영수증</span>
			        <hr>
			        <ul>
			        	<li>
							<ul class="clearfix">
								<li class="itemL">입차 시간</li>
								<li class="itemR">${ph.p_history_in}</li>
							</ul>
			        	</li>
			        	<li>
							<ul class="clearfix">
								<li class="itemL">출차 시간</li>
								<li class="itemR">${ph.p_history_out}</li>
							</ul>
			        	</li>
			        	<li>
							<ul class="clearfix">
								<li class="itemL">주차 시간</li>
								<li class="itemR">${time}</li>
							</ul>
			        	</li>
			        </ul>
			        <hr>
			        <ul>
			        	<li>
							<ul class="clearfix">
								<li class="itemL">영화 할인</li>
								<li class="itemR">${mTime} 시간</li>
							</ul>
			        	</li>
			        	<li>
							<ul class="clearfix">
								<li class="itemL">식당 할인</li>
								<li class="itemR">${rTime} 시간</li>
							</ul>
			        	</li>
			        </ul>
			        
					<hr>
					<ul class="clearfix">
						<li class="itemL">주차 요금</li>
						<li class="itemR"><fmt:formatNumber value="${ph.p_history_price}" type="number"/> 원</li>
					</ul>
			    </div>
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
		
		function payModal() {
			document.getElementById('pay-modal').style.display = 'none';
		}
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