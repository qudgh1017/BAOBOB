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
		.sorting::before{right:1em;content:"\2191";opacity:0.3;position:absolute;}
		.sorting::after{right:0.5em;content:"\2193";opacity:0.3;position:absolute;}
		.sorting_desc::before{right:1em;content:"\2191";opacity:0.3;position:absolute;}
		.sorting_desc::after{right:0.5em;content:"\2193";opacity:1;position:absolute;}
		.sorting_asc::before{right:1em;content:"\2191";opacity:1;position:absolute;}
		.sorting_asc::after{right:0.5em;content:"\2193";opacity:0.3;position:absolute;}
		
		li{color:#212529;}

		.clearfix{clear:both;}
		.clearfix > li{float:left;padding:5px 15px;border-right:1px solid #e9ecef;text-align:center;}
		.ul_head{font-weight:bold;border-bottom:2px solid #e9ecef;}
		.ul_body{border-bottom:1px solid #e9ecef;}
		.li_head{position:relative;padding-bottom:10px;text-align:center;}
		
		.l1{width:7%;}
		.l2{width:10%;}
		.l3{width:24%;}
		.l4{width:24%;}
		.l5{width:24%;}
		.l6{width:11%;border-right:none;}
		
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
<c:if test="${sessionScope.memStep != null && sessionScope.memStep == 7}">

	<!-- Navigation -->
	<%@ include file="hostParkingNavigation.jsp" %>
	
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="card mb-3"  id="result">
				<div class="card-header min_size">납부 내역</div>
				<div class="card-body min_size">
					<c:if test="${postCnt > 0}">
					<ul class="ul_top">
						<li>
							<ul class="clearfix ul_head">
								<li class="li_head l1">번호</li>
								<li class="li_head l2 sorting" onclick="payList('2');">날짜</li>
								<li class="li_head l3 sorting" onclick="payList('3');">회원</li>
								<li class="li_head l4 sorting" onclick="payList('4');">입차</li>
								<li class="li_head l5 sorting" onclick="payList('5');">출차</li>
								<li class="li_head l6 sorting" onclick="payList('6');">금액</li>
							</ul>
						</li>
						<li>
							<c:forEach var="ph" items="${phs}">
							<ul class="clearfix ul_body">
								<li class="li_item l1">
									${number}
									<c:set var="number" value="${number-1}"/>
								</li>
								<li class="l2">${fn:substring(ph.p_history_date, 0, 10)}</li>
								<li class="l3">${ph.history.getMember_id()}</li>
								<li class="l4">${ph.p_history_in}</li>
								<li class="l5">${ph.p_history_out}</li>
								<li class="l6"><fmt:formatNumber value="${ph.p_history_price}" type="number"/></li>
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
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
	
	<script src="${projectRes}ymk/js/ajax.js"></script>
	<script type="text/javascript">
		var order;
		
		function payList(standard) {
			console.log(standard);
			order = standard;
			sendRequest(payList_callback, 'hostParkingPayList', 'GET', 'standard=' + standard);
		}
		
		function payList_callback() {
			if(httpRequest.readyState == 4) {
				if(httpRequest.status == 200) {
					var data = httpRequest.responseText;
					
					document.getElementById('result').innerHTML = data;
					standard(order);
					console.log('완료');
				} else {
					console.log('오류');
				}
			} else {
				console.log('에러 ' + httpRequest.readyState);
			}
		}

		function standard(id) {
			var item = document.getElementsByClassName('li_head');
			switch(id) {
			case '2': item[1].className = 'li_head l2 sorting_asc'; 
			 		  item[1].setAttribute('onclick', 'payList("8")'); break;
			case '3': item[2].className = 'li_head l3 sorting_asc'; 
			 	  	  item[2].setAttribute('onclick', 'payList("9")'); break;
			case '4': item[3].className = 'li_head l4 sorting_asc'; 
			 		  item[3].setAttribute('onclick', 'payList("10")'); break;
			case '5': item[4].className = 'li_head l5 sorting_asc'; 
			  		  item[4].setAttribute('onclick', 'payList("11")'); break;
			case '6': item[5].className = 'li_head l6 sorting_asc'; 
			 		  item[5].setAttribute('onclick', 'payList("12")'); break;
			 		  
			case '8': item[1].className = 'li_head l2 sorting_desc'; 
			 		  item[1].setAttribute('onclick', 'payList("2")'); break;
			case '9': item[2].className = 'li_head l3 sorting_desc'; 
			 		  item[2].setAttribute('onclick', 'payList("3")'); break;
			case '10': item[3].className = 'li_head l4 sorting_desc'; 
			 		  item[3].setAttribute('onclick', 'payList("4")'); break;
			case '11': item[4].className = 'li_head l5 sorting_desc'; 
			 		  item[4].setAttribute('onclick', 'payList("5")'); break;
			case '12': item[5].className = 'li_head l6 sorting_desc'; 
			 		  item[5].setAttribute('onclick', 'payList("6")'); break;
			}
		}
	</script>
</c:if>
<c:if test="${sessionScope.memStep == null || sessionScope.memStep != 7}">
	<script src="${projectRes}ymk/js/script.js"></script>
	<script type="text/javascript">
		stepAlert();
	</script>
</c:if>
</body>
</html>