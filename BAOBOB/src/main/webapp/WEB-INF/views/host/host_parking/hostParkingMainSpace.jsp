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

<ul>
	<li>
		<ul class="clearfix ul_head">
			<li class="l1">번호</li>
			<li class="l2">구역</li>
			<li class="l3">시간</li>
			<li class="l4">상태</li>
		</ul>
	</li>
	<c:forEach var="p" items="${ps}">
	<li>
		<ul class="clearfix">
			<li class="l1">${p.park_index}</li>
			<li class="l2">${p.getParkTheme()}</li>
			<li class="l3">${p.park_last_date}</li>
			<li class="l4">${p.park_state}</li>
		</ul>
	</li>
	</c:forEach>
</ul>