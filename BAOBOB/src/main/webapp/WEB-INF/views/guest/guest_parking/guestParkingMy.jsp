<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="card md-3" id="result">
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
	</div>
</div>