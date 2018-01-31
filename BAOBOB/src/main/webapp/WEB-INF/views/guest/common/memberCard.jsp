<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mybaobob">
	<table class="board">
	    <thead>
	    	<tr>
	    		<td colspan=3>
	    		<span class="text-uppercase bigfont" style="text-align:left">${vo.member_id}님</span>&emsp;
				<a href="memPForm"  title="회원정보 수정"><i class="material-icons">edit</i></a>
				<hr style="border: dotted 3px white;">
				
				<h4 class="text-capitalize" style="text-align:left">
					고객님은<c:choose>
							<c:when test="${vo.member_step eq 1}">
								종합 관리자
							</c:when>
							<c:when test="${vo.member_step eq 2}">
								BAOBOX 관리자
							</c:when>
							<c:when test="${vo.member_step eq 3}">
								BAOBOX 직원
							</c:when>
							<c:when test="${vo.member_step eq 4}">
								YUMMY 총관리자
							</c:when>
							<c:when test="${vo.member_step eq 51}">
								바압 관리자
							</c:when>
							<c:when test="${vo.member_step eq 52}">
								Dokidoki 관리자
							</c:when>
							<c:when test="${vo.member_step eq 53}">
								BOUTBACK 관리자
							</c:when>
							<c:when test="${vo.member_step eq 61}">
								바압 직원
							</c:when>
							<c:when test="${vo.member_step eq 62}">
								Dokidoki 직원
							</c:when>
							<c:when test="${vo.member_step eq 63}">
								BOUTBACK 직원
							</c:when>
							<c:when test="${vo.member_step eq 7}">
								주차장 관리자
							</c:when>
							<c:when test="${vo.member_step eq 8}">
								비회원
							</c:when>
							<c:when test="${vo.member_step eq 9}">
								일반회원
							</c:when>
							<c:when test="${vo.member_step eq 10}">
								VIP
							</c:when>
							<c:when test="${vo.member_step eq 11}">
								VVIP
							</c:when>
							<c:when test="${vo.member_step eq 12}">
								SVIP
							</c:when>
						</c:choose>입니다.</h4>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td rowspan=2>
	    			<c:if test="${vo.member_img == null}">
	    				<img class="mybaobob" src="${projectRes}images/lgt/profile/default_img.png">
	    			</c:if>
	    			
	    			<c:if test="${vo.member_img != null}">
						<img class="mybaobob" src="${projectRes}images/lgt/profile/${vo.member_img}">
	    			</c:if>
	    		</td>
		    	<th class="middlefont">POINT</th>
		    	<th class="middlefont">TOTAL POINT</th>
		    </tr>
			<tr>
		        <td class="samllfont"><fmt:formatNumber value="${vo.member_point}" pattern="###,###,###"/>점</td>
		        <td class="samllfont"><fmt:formatNumber value="${vo.member_cumPoint}" pattern="###,###,###"/>점</td>
		    </tr>
	    </thead>
	</table>
</div>