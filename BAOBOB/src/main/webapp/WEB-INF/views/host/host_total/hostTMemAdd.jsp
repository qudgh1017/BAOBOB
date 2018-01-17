<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/lgt/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body .joinBtn{
		background:#007bff;
	}
	body .sexBtn{
		width: 49%;
		padding: .375rem .75rem;
		font-size: 1rem;
		line-height: 1.5;
		color: #495057;
		background-color: #fff;
		background-image: none;
		background-clip: padding-box;
		border: 1px solid #ced4da;
		border-radius: .25rem;
		transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	}
	body .adBtn{
		    font-size: 10px;
		    border: 1px solid #ced4da;
		    padding: 5px;
		    border-radius: 0.5em;
		    margin-left: 10px;
	}
</style>

</head>
<!-- Navigation -->
<%@ include file="common/navigation.jsp" %>

<body class="fixed-nav sticky-footer bg-dark">

	<div class="content-wrapper">
		<div class="card-header"><i class="fa fa-table">Add Member</i></div>
		
		<div class="card-body" >
			<form action="hostTMemAddPro" name="joinForm" onsubmit="return joinCheck();" method="post">
				
				<div class="form-group">
					<label for="name">이름</label> 
					<input class="form-control" id="name" name="name" type="text" placeholder="name">
				</div>

				<div class="form-group">
					<div class="form-row">
						<div class="col-md-6">
							<label for="id">아이디</label> 
							<input class="form-control" id="id" name="id" type="text" placeholder="id" onblur="hostTConfirmId();">
						</div>
						<div class="col-md-6">
							<label for="step">등급</label> 
							<select class="form-control" id="step" name="step">
								<option value="0">Select Member Step</option>
								<option value="1">종합관리자</option>
								<option value="2">영화관리자</option>
								<option value="3">영화직원</option>
								<option value="4">식당 총관리자</option>
								<option value="51">한식당 관리자</option>
								<option value="52">일식당 관리자</option>
								<option value="53">양식당 관리자</option>
								<option value="61">한식당 직원</option>
								<option value="62">일식당 직원</option>
								<option value="63">양식당 직원</option>
								<option value="7">주차장관리자</option>
								<option value="8">비회원</option>
								<option value="9">일반회원</option>
								<option value="10">VIP</option>
								<option value="11">VVIP</option>
								<option value="12">SVIP</option>
							</select>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="form-row">
						<div class="col-md-6">
							<label for="pwd">비밀번호</label> 
							<input class="form-control" id="pwd" name="pwd" type="password" placeholder="Password">
						</div>
						<div class="col-md-6">
							<label for="pwdRe">비밀번호 확인</label> 
							<input class="form-control" id="pwdRe" name="pwdRe" type="password" placeholder="Confirm password">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="email">이메일</label> 
					<input class="form-control" id="email" name="email" type="email" placeholder="email">
				</div>

				<div class="form-group">
					<div class="form-row">
						<div class="col-md-6">
							<label for="birth">생일</label> 
							<input class="form-control" id="birth" name="birth" type="text" placeholder="20180110">
						</div>
						<div class="col-md-6">
							<input type="hidden" name="sex">
							<label>성별</label><br>
							<input type="button" class="sexBtn" onclick="sexBtnChange('M');" value="남">
							<input type="button" class="sexBtn" onclick="sexBtnChange('Y');" value="여">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="tel">전화번호</label> 
					<input class="form-control" id="tel" name="tel" type="text" placeholder="tel" onblur="confirmTel();">
				</div>

				<div class="form-group">
					<label for="address">주소 <input class="adBtn" type="button" value="주소 찾기" onclick="addressSearch();"></label> 
					<input class="form-control" id="address" name="address" type="text" placeholder="address">
				</div>

				<input class="btn btn-primary btn-block joinBtn" type="submit" value="추가">
			</form>
			
		</div>
		<div class="card-footer small text-muted">
			Please Add Member
		</div>
	</div>
	
	<!-- Bootstrap core JavaScript-->
	<script src="${projectRes}mainBootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="${projectRes}mainBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Core plugin JavaScript-->
	<script src="${projectRes}mainBootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	<script src="${projectRes}lgt/js/script.js"></script>
	<script src="${projectRes}lgt/js/ajax.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>

<!-- Footer -->
<%@ include file="common/footer.jsp" %>
</html>