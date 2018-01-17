<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	.clearfix{clear:both;}
	.clearfix > li {float:left;text-align:center;border-right:1px solid #e9ecef;padding:5px 0;}
	
	.l1{width:10%;}
	.l2{width:20%;}
	.l3{width:50%;}
	body .l4{width:20%;border-right:none;}
	
	.ul_head{border-bottom:2px solid #e9ecef;font-weight:bold;}
	.ul_head > li{padding-bottom:20px;}
</style>

<div class="row">
	<div class="col-xl-6 col-sm-6 mb-3">
		<div class="card">
			<div class="card-header">오늘 입차 기록</div>
			<div class="card-body">
				<ul>
					<li>
						<ul class="clearfix ul_head">
							<li class="l1">번호</li>
							<li class="l2">구역</li>
							<li class="l3">입차 시간</li>
							<li class="l4">현재 상태</li>
						</ul>
					</li>
					<c:forEach var="pi" items="${psIn}">
					<li>
						<ul class="clearfix">
							<li class="l1">${pi.park_index}</li>
							<li class="l2">${pi.getParkTheme()}</li>
							<li class="l3">${pi.park_last_date}</li>
							<li class="l4">${pi.getParkState()}</li>
						</ul>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div class="card-footer small text-muted" id="inUpdateTime"></div>
		</div>
	</div>
	<div class="col-xl-6 col-sm-6 mb-3">
		<div class="card">
			<div class="card-header">오늘 출차 기록</div>
			<div class="card-body">
				<ul>
					<li>
						<ul class="clearfix ul_head">
							<li class="l1">번호</li>
							<li class="l2">구역</li>
							<li class="l3">출차 시간</li>
							<li class="l4">현재 상태</li>
						</ul>
					</li>
					<c:forEach var="po" items="${psOut}">
					<li>
						<ul class="clearfix">
							<li class="l1">${po.park_index}</li>
							<li class="l2">${po.getParkTheme()}</li>
							<li class="l3">${po.park_last_date}</li>
							<li class="l4">${po.getParkState()}</li>
						</ul>
					</li>
					</c:forEach>
				</ul>			
			</div>
			<div class="card-footer small text-muted" id="outUpdateTime"></div>
		</div>
	</div>
</div>
