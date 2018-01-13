<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark">

	<!-- Navigation -->
	<%@ include file="movie_navigation.jsp" %>
	
	<div class="content-wrapper">
	<c:if test="${vo==null}">
		alert("부적절한 접근입니다.");
		window.history.back();
	</c:if>
	<form action="hostMovieModPro" method="post" enctype="multipart/form-data">
	<input type="hidden" name="movie_posterDefault" value="${vo.movie_poster}"/>
	<input type="hidden" name="movie_index" value="${vo.movie_index}"/>
	<center><h3><b>영화 상세</b></h3></center>
	<hr style="border:3px solid black;">
	<br>
	<br>
	<br>

		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" align="center" style="border:1px solid black;">
			<tr>
				<td>title</td>
				<td><input type="text" name="movie_title" placeholder="영화 제목" value="${vo.movie_title}"/></td>
			</tr>
			<tr>
				<td>janre</td>
				<td>
					<c:if test="${vo.movie_janre==1}">
					<select name="movie_janre">
						<option value="">장르 선택</option>
						<option value="1" selected>가족</option>
						<option value="2">공포/호러</option>
						<option value="3">드라마</option>
						<option value="4">SF</option>
						<option value="5">멜로/로맨스</option>
						<option value="6">코미디</option>
						<option value="7">애니메이션</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_janre==2}">
					<select name="movie_janre">
						<option value="">장르 선택</option>
						<option value="1">가족</option>
						<option value="2" selected>공포/호러</option>
						<option value="3">드라마</option>
						<option value="4">SF</option>
						<option value="5">멜로/로맨스</option>
						<option value="6">코미디</option>
						<option value="7">애니메이션</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_janre==3}">
					<select name="movie_janre">
						<option value="">장르 선택</option>
						<option value="1">가족</option>
						<option value="2">공포/호러</option>
						<option value="3" selected>드라마</option>
						<option value="4">SF</option>
						<option value="5">멜로/로맨스</option>
						<option value="6">코미디</option>
						<option value="7">애니메이션</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_janre==4}">
					<select name="movie_janre">
						<option value="">장르 선택</option>
						<option value="1">가족</option>
						<option value="2">공포/호러</option>
						<option value="3">드라마</option>
						<option value="4" selected>SF</option>
						<option value="5">멜로/로맨스</option>
						<option value="6">코미디</option>
						<option value="7">애니메이션</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_janre==5}">
					<select name="movie_janre">
						<option value="">장르 선택</option>
						<option value="1">가족</option>
						<option value="2">공포/호러</option>
						<option value="3">드라마</option>
						<option value="4">SF</option>
						<option value="5" selected>멜로/로맨스</option>
						<option value="6">코미디</option>
						<option value="7">애니메이션</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_janre==6}">
					<select name="movie_janre">
						<option value="">장르 선택</option>
						<option value="1">가족</option>
						<option value="2">공포/호러</option>
						<option value="3">드라마</option>
						<option value="4">SF</option>
						<option value="5">멜로/로맨스</option>
						<option value="6" selected>코미디</option>
						<option value="7">애니메이션</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_janre==7}">
					<select name="movie_janre">
						<option value="">장르 선택</option>
						<option value="1">가족</option>
						<option value="2">공포/호러</option>
						<option value="3">드라마</option>
						<option value="4">SF</option>
						<option value="5">멜로/로맨스</option>
						<option value="6">코미디</option>
						<option value="7" selected>애니메이션</option>
					</select>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>age</td>
				<td>
					<c:if test="${vo.movie_age==0}">
					<select name="movie_age">
						<option value="">제한 연령 선택</option>
						<option value="0" selected>전체관람가</option>
						<option value="7">만 7세 이상</option>
						<option value="12">만 12세 이상</option>
						<option value="15">만 15세 이상</option>
						<option value="19">만 19세 이상</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_age==7}">
					<select name="movie_age">
						<option value="">제한 연령 선택</option>
						<option value="0">전체관람가</option>
						<option value="7" selected>만 7세 이상</option>
						<option value="12">만 12세 이상</option>
						<option value="15">만 15세 이상</option>
						<option value="19">만 19세 이상</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_age==12}">
					<select name="movie_age">
						<option value="">제한 연령 선택</option>
						<option value="0">전체관람가</option>
						<option value="7">만 7세 이상</option>
						<option value="12" selected>만 12세 이상</option>
						<option value="15">만 15세 이상</option>
						<option value="19">만 19세 이상</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_age==15}">
					<select name="movie_age">
						<option value="">제한 연령 선택</option>
						<option value="0">전체관람가</option>
						<option value="7">만 7세 이상</option>
						<option value="12">만 12세 이상</option>
						<option value="15" selected>만 15세 이상</option>
						<option value="19">만 19세 이상</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_age==19}">
					<select name="movie_age">
						<option value="">제한 연령 선택</option>
						<option value="0">전체관람가</option>
						<option value="7">만 7세 이상</option>
						<option value="12">만 12세 이상</option>
						<option value="15">만 15세 이상</option>
						<option value="19" selected>만 19세 이상</option>
					</select>
					</c:if>
					
				</td>
			</tr>
			<tr>
				<td>rel_date</td>
				<td>
					<input type="text" name="movie_rel_date" placeholder="개봉일(yy-mm-dd)" value="${vo.movie_rel_date}"/>
				</td>
			</tr>
			<tr>
				<td>director</td>
				<td><input type="text" name="movie_director" placeholder="영화 감독" value="${vo.movie_director}"/></td>
			</tr>
			<tr>
				<td>star</td>
				<td><input type="text" name="movie_star" placeholder="출연 배우" value="${vo.movie_star}"/></td>
			</tr>
			<tr>
				<td>country</td>
				<td><input type="text" name="movie_country" placeholder="제작국가" value="${vo.movie_country}"/></td>
			</tr>
			<tr>
				<td>run time</td>
				<td><input type="number" name="movie_runTime" placeholder="상영시간(숫자)" value="${vo.movie_runTime}"/>분</td>
			</tr>
			<tr>
				<td>poster</td>
				<td>${vo.movie_poster} --> <input type="file" name="movie_poster"/></td>
			</tr>
			<tr>
				<td>trailer</td>
				<td><input type="text" style="width:250px;" name="movie_trailer" placeholder="유튜브 주소 v값 (ex: jsq6WfE0UPI)" value="${vo.movie_trailer}"/></td>
			</tr>
			<tr>
				<td>state</td>
				<td>
					<c:if test="${vo.movie_state==0}">
					<select name="movie_state">
						<option value="">상영 상태</option>
						<option value="0" selected>상영 예정</option>
						<option value="1">상영 중</option>
						<option value="2">상영 종료</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_state==1}">
					<select name="movie_state">
						<option value="">상영 상태</option>
						<option value="0">상영 예정</option>
						<option value="1" selected>상영 중</option>
						<option value="2">상영 종료</option>
					</select>
					</c:if>
					<c:if test="${vo.movie_state==2}">
					<select name="movie_state">
						<option value="">상영 상태</option>
						<option value="0">상영 예정</option>
						<option value="1">상영 중</option>
						<option value="2" selected>상영 종료</option>
					</select>
					</c:if>
			</tr>
			<tr>
				<td>content</td>
				<td><textarea name="movie_content" placeholder="줄거리" rows="7" cols="100" style="resize:none;">${vo.movie_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<br><br>
					<center><input style="border:1px solid black;" type="submit" value="영화 수정하기"/></center>
					<br><br>
				</td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>