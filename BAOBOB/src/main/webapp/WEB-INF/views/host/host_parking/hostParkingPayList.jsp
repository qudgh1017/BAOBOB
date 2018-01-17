<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
