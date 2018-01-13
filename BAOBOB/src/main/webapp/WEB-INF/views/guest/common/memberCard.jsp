<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<img class="mybaobob" src="${projectRes}images/lgt/profile/${vo.member_img}">
	    		</td>
		    	<th class="middlefont">POINT</th>
		    	<th class="middlefont">TOTAL POINT</th>
		    </tr>
			<tr>
		        <td class="samllfont">${vo.member_point}점</td>
		        <td class="samllfont">${vo.member_cumPoint}점</td>
		    </tr>
	    </thead>
	</table>
</div>