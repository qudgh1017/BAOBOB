<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.mvc.baobob.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>       
    
<%@ include file="/resources/lgt/setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1 : 1 문의</title>
</head>
<body>
<!-- 비밀번호 일치시 -->
<c:if test="${selectCnt==1}">
<%@ include file="../common/head.jsp" %>

<!-- Navigation -->
<%@ include file="../common/navigation.jsp" %>

<!-- 개인정보 카드 -->
<div class="mybaobob">
	<table class="board">
	    <thead>
	    	<tr>
	    		<td colspan=3>
	    		<span class="text-uppercase bigfont" style="text-align:left">${memId}님</span>&emsp;
				<a href="memPForm"  title="회원정보 수정"><i class="material-icons">edit</i></a>
				<hr style="border: dotted 3px white;">
				<h4 class="text-capitalize" style="text-align:left">고객님은 SVIP입니다.</h4>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td rowspan=2>
					<img class="mybaobob" src="${projectRes}images/lgt/default_img.png">
	    		</td>
		    	<th class="middlefont">POINT</th>
		    	<th class="middlefont">TOTAL POINT</th>
		    </tr>
			<tr>
		        <td class="samllfont">14000점</td>
		        <td class="samllfont">26000점</td>
		    </tr>
	    </thead>
	</table>
</div>

<section class="mypageSection">
<table class="board">
	<tr>
		<td>
			<!-- SIDE MENU -->
			<div class="vertical-menu">
				<a href="memMyPageMain" class="active" style="cursor:pointer">My BAOBOB</a>
				<a href="#!" class="active">SERVICE</a>
				<a href="#!">회원 등급</a>
				<a href="#!">포인트/쿠폰</a>
				<a href="#!">방문 내역</a>
				<a href="#!" class="active">MOVIE</a>
				<a href="#!">무비 로그</a>
				<a href="#!">예매 내역</a>
				<a href="#!" class="active">RESTAURANT</a>
				<a href="#!">레스토랑 로그</a>
				<a href="#!">레스토랑 예약</a>
				<a href="#!" class="active">문의 내역</a>
				<a href="memQuestion">1 : 1 문의</a>
				<a href="#!">분실물 문의</a>
			</div>
		</td>
		<!-- 알맹이td -->
		<td style="padding:0rem 10rem;margin:0px;width:100%;height:100%;">
			<form action="memPPro" method="post" name="modifyform" onsubmit="return modifyCheck();">
				<table id="mainBody" style="width:800px; margin:auto;">
					<caption>개인정보 수정</caption>
				    <thead>
					    <tr>
					    	<th>ID</th>
					        <td>${vo.getMember_id()}</td>
					    </tr>
					    <tr>
							<th>Password</th>
							<td>
								<input type="password" name="pwd" maxlength="20" value="${vo.getMember_pwd()}" >
							</td>
						</tr>
						<tr>
							<th>Re_Password</th>
							<td>
								<input type="password" name="repwd" maxlength="20" value="${vo.getMember_pwd()}" >
							</td>
						</tr>
						<tr>
							<th>Name</th>
							<td>
								<input type="text" name="name" maxlength="20" value="${vo.getMember_name()}" >
							</td>
						</tr>
						<tr>
							<th>Birth</th>
							<td>${vo.getMember_birth()}</td>
						</tr>
						<tr>
							<th>Sex</th>
							<td>${vo.getMember_sex()}</td>
						</tr>
						<tr>
							<th>Address</th>
							<td>
								<input type="text" name="address" maxlength="100" style="width:300px" value="${vo.getMember_address()}" >
							</td>
						</tr>
						<tr>
							<th>Phone</th>
							<td>
								<c:if test="${vo.getMember_tel() == null}">
									<input type="text" class="input" name="hp1" maxlength="3" style="width:30px">
									-
									<input type="text" class="input" name="hp2" maxlength="4" style="width:40px">
									-
									<input type="text" class="input" name="hp3" maxlength="4" style="width:40px">
								</c:if>
								<c:if test="${vo.getMember_tel() != null}">
									<c:set var="hpArr" value="${fn:split( vo.getMember_tel(), '-' )}" />
									<input type="text" class="input" name="hp1" maxlength="3" style="width:30px"
										value="${hpArr[0]}">
									-
									<input type="text" class="input" name="hp2" maxlength="4" style="width:40px"
										value="${hpArr[1]}">
									-
									<input type="text" class="input" name="hp3" maxlength="4" style="width:40px"
										value="${hpArr[2]}">
								</c:if>
							</td>
						</tr>
					    <tr>
							<th>Email</th>
							<td>
								<c:set var="emailArr" value="${fn:split(vo.getMember_email(), '@' )}" />
								<input type="text" class="input" name="email1" maxlength="10" style="width:65px"
									value="${emailArr[0]}">
								@
								<input type="text" class="input" name="email2" maxlength="10" style="width:65px"
									value="${emailArr[1]}">	
							</td>
						</tr>
					    <tr>
					    	<th>REG_DATE</th>
					        <td>
					        <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${vo.getMember_reg_date()}" />
					        </td>
					    </tr>
					    <tr style="align:center">
							<td colspan="2" style="border-bottom: none;">
								<input type="submit" class="button" value="  Done  ">
								<input type="reset" class="button" value="Reset">
								<input type="button" class="button" value="Cancle "
									onclick="window.location='memMyPageMain'">
							</td>
						</tr>
				    </thead>
				</table>
			</form>
			
		</td>
		<!-- 알맹이td 끝 -->
	</tr>
</table>
</section>
</c:if>

<!-- 비밀번호 비일치시 -->
<c:if test="${selectCnt!=1}">
	<script type="text/javascript">
		errorAlert(pwdErorr);
	</script>
</c:if>

<!-- Footer -->
<%@ include file="../common/footer.jsp" %>
	
<!-- FooterCopyright -->
<%@ include file="../common/footerCopyright.jsp" %>
</body>
</html>