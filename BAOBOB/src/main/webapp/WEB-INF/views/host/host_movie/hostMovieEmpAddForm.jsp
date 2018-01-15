<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${projectRes}phc/js/script.js"></script>
<script type="text/javascript">
 $(function() {
   $( "#datepicker" ).datepicker({
     dateFormat: 'y-mm-dd'
   });
 });
</script>

</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp" %>
	
	<div class="content-wrapper">

	<form name="hostMovieEmpAddForm" action="hostMovieEmpAddPro" method="post">
		<center><h3><b>직원 고용</b></h3></center>
		<hr style="border:3px solid black;">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" align="center" style="border:1px solid black;">
			<tr>
				<td> 아이디 </td>
				<td>
					<input type="text" style="width:200px; height:40px;" name="member_id" placeholder="직원 아이디" value="${member_id}" required/>
					<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px; margin-left:20px;" type="button" onclick="return chkId();" value="확인"/>
				</td>
			</tr>
			<c:if test="${idCnt>0}">
			<tr>
				<td> 이름 </td>
				<td>${vo.member_name}</td>
			</tr>
			<tr>
				<td>주민등록 번호</td>
				<td>
					${vo.member_birth} - <input type="password" style="width:100px; height:25px;" name="employee_jumin2" placeholder="주민 뒷자리" required/>
				</td>
			</tr>
			<tr>
				<td> 전화번호 </td>
				<td>${vo.member_tel}</td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td>${vo.member_email}</td>
			</tr>
			<tr>
				<td> 주소 </td>
				<td>${vo.member_address}</td>
			</tr>
			<tr>
				<td colspan="2">
					<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px; margin-left:20px;" type="submit" value="고용하기"/>
				</td>
			</tr>
			</c:if>
			
		</table>
	</form>

	</div>
	
	<!-- Footer -->
	<%@ include file="movie_footer.jsp" %>
</body>
</html>