<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.clearfix{clear:both;}

	.md-3{margin-bottom:1rem!important;}
	.ul_top{margin-bottom:0;}
	.ul_head{border-bottom:2px solid #e9ecef;font-weight:bold;}
	.li_item{float:left;border-right:1px solid #e9ecef;padding:5px;text-align:center;color:#212529;}
	
	.l1{width:11%;}
	.l2{width:24%;}
	.l3{width:15%;}
	.l4{width:50%;border-right:none;}
	
	.div_mw{max-width:100%;}
	
	.reset{position:absolute;right:0;top:0;width:50px;height:50px;background:white;border:1px solid #e9ecef;font-size:30px;color:lightgray;}
</style>    
    
<div class="col-lg-6 div_mw">
	<div class="card md-3">
		<div class="card-header">구역 정보</div>
		<div class="card-body" id="spaceDiv">
			<ul class="ul_top">
				<li>
					<ul class="clearfix ul_head">
						<li class="li_item l1">번호</li>
						<li class="li_item  l2">상태</li>
						<li class="li_item l3">구역</li>
						<li class="li_item l4">마지막 입차 시간</li>
					</ul>
				</li>
				<li>
					<c:if test="${space != null}">
						<ul class="clearfix">
							<li class="li_item l1">${space.park_index}</li>
							<li class="li_item l2">${space.getParkState()}</li>
							<li class="li_item l3">${space.getParkTheme()}</li>
							<li class="li_item l4">${space.park_last_date}</li>
						</ul>
					</c:if>
					<c:if test="${space == null}">
						<ul class="clearfix">
							<li class="li_item l1">none</li>
							<li class="li_item l2">none</li>
							<li class="li_item l3">none</li>
							<li class="li_item l4">none</li>
						</ul>
					</c:if>
				</li>
			</ul>
		</div>
		<div class="card-footer small text-muted">${space.park_index}번 구역 정보</div>
	</div>
</div>
<div class="col-lg-6 div_mw">
	<div class="card md-3">
		<div class="card-header">일치 정보</div>
		<div class="card-body">
			<ul class="ul_top">
				<c:if test="${id != ''}">
					<li>${id}</li>
				</c:if>
				<c:if test="${id == ''}">
					<li>일치하는 정보가 없습니다.</li>
				</c:if>
			</ul>
		</div>
		<div class="card-footer small text-muted">마지막 입차 시간과 1분 차이로 입차한 회원 목록</div>
	</div>
</div>
<button class="reset" onclick="reset();">X</button>