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

	<form action="hostMovieAddPro" method="post" enctype="multipart/form-data">
		<center><h3><b>영화 등록</b></h3></center>
		<hr style="border:3px solid black;">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" align="center" style="border:1px solid black;">
			<tr>
				<td>title</td>
				<td><input type="text" name="movie_title" placeholder="영화 제목" required/></td>
			</tr>
			<tr>
				<td>janre</td>
				<td>
					<select name="movie_janre">
						<option value="">장르 선택</option>
						<option value="1">가족</option>
						<option value="2">공포/호러</option>
						<option value="3">드라마</option>
						<option value="4">SF</option>
						<option value="5">멜로/로맨스</option>
						<option value="6">코미디</option>
						<option value="7">애니메이션</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>age</td>
				<td>
					<select name="movie_age">
						<option value="">제한 연령 선택</option>
						<option value="0">전체관람가</option>
						<option value="7">만 7세 이상</option>
						<option value="12">만 12세 이상</option>
						<option value="15">만 15세 이상</option>
						<option value="19">만 19세 이상</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>rel_date</td>
				<td>
<!-- 					<input type="text" name="movie_rel_date" placeholder="개봉일(yy-mm-dd)" /> -->
					<input type="text" name="movie_rel_date" id="datepicker" class="datepicker" placeholder="개봉일(yy-mm-dd)" required/>
				</td>
			</tr>
			<tr>
				<td>director</td>
				<td><input type="text" name="movie_director" placeholder="영화 감독" required/></td>
			</tr>
			<tr>
				<td>star</td>
				<td><input type="text" name="movie_star" placeholder="출연 배우" required/></td>
			</tr>
			<tr>
				<td>country</td>
				<td><input type="text" name="movie_country" placeholder="제작국가" required/></td>
			</tr>
			<tr>
				<td>run time</td>
				<td><input type="number" name="movie_runTime" placeholder="상영시간(숫자)" required/>분</td>
			</tr>
			<tr>
				<td>poster</td>
				<td><input type="file" name="movie_poster" required/></td>
			</tr>
			<tr>
				<td>trailer</td>
				<td><input type="text" style="width:250px;" name="movie_trailer" placeholder="유튜브 주소 v값 (ex: jsq6WfE0UPI)" required/></td>
			</tr>
			<tr>
				<td>state</td>
				<td>
					<select name="movie_state">
						<option value="">상영 상태</option>
						<option value="0">상영 예정</option>
						<option value="1">상영 중</option>
						<option value="2">상영 종료</option>
					</select>
			</tr>
			<tr>
				<td>content</td>
				<td><textarea name="movie_content" placeholder="줄거리" rows="7" cols="100" style="resize:none;" required></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input style="background-color:#343a40; color:white; border:1px solid black; width:200px; height:40px; margin-left:177px; margin-bottom:15px;" type="submit" value="영화 등록하기"/>
				</td>
			</tr>
		</table>
	</form>

	</div>
	
	<!-- Footer -->
	<%@ include file="movie_footer.jsp" %>
</body>
</html>