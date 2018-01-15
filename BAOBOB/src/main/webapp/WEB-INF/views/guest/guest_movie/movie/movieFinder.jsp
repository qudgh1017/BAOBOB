<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
<script src="//code.jquery.com/jquery-1.11.0.js"></script>
<script type="text/javascript">

//load되면 전체 체크
$(window).load(function(){
	$("input:checkbox").prop("checked",true);
});

$(document).ready(function() {
    //장르 전체 체크박스 클릭
    $("#checkall_janre").click(function(){
        //클릭되었으면
        if($("#checkall_janre").prop("checked")){
            //input태그의 name이 movie_janre인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=movie_janre]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 movie_janre인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=movie_janre]").prop("checked",false);
        }
    });
    
 	//제작국가 전체 체크박스 클릭
    $("#checkall_country").click(function(){
        //클릭되었으면
        if($("#checkall_country").prop("checked")){
            //input태그의 name이 movie_country인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=movie_country]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 movie_country인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=movie_country]").prop("checked",false);
        }
    });
    
 	//나이 전체 체크박스 클릭
    $("#checkall_age").click(function(){
        //클릭되었으면
        if($("#checkall_age").prop("checked")){
            //input태그의 name이 movie_age인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=movie_age]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 movie_age인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=movie_age]").prop("checked",false);
        }
    });
 	
 	//search버튼 눌렀을때
    $('#search_btn').click(function() {
    	
    	var keyword = document.getElementById("keyword").value;
    	var sel = document.getElementById("select").value;
		//movie_janre이름을 가진 것 중 체크된 것만 값 가져오기
	   var size = document.getElementsByName("movie_janre").length;
	   var movie_janre = new Array();
	   for(var i = 0; i < size; i++){
	      if(document.getElementsByName("movie_janre")[i].checked == true){
       		movie_janre[i] = document.getElementsByName("movie_janre")[i].value;
     	  }else{
     		 movie_janre[i] = -1;
     	  }
	   	}
	 	//movie_country이름을 가진 것 중 체크된 것만 값 가져오기
		var movie_country = new Array();
	 	size = document.getElementsByName("movie_country").length;
		for(var i = 0; i < size; i++){
			if(document.getElementsByName("movie_country")[i].checked == true){
				movie_country[i] = document.getElementsByName("movie_country")[i].value;
			}else{
				movie_country[i] = -1;
			}
		}
	 //movie_age이름을 가진 것 중 체크된 것만 값 가져오기
	   var movie_age = new Array();
	   size = document.getElementsByName("movie_age").length;
		for(var i = 0; i < size; i++){
			if(document.getElementsByName("movie_age")[i].checked == true){
				movie_age[i] = document.getElementsByName("movie_age")[i].value;
			}else{
				movie_age[i] = -1;
			}
		}
	   alert(keyword);
	   alert(sel);


       $.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
        
		$.ajax({
			url: 'searchResult',
			type: 'GET',
			data: {
				keyword, sel, movie_janre, movie_country, movie_age
			},
			
			success: function(msg) {
				$('#result').html(msg);					
			},				
			error: function() {
				alert('오류');
			}			
		});			
	});	
});
</script>
</head>
<body>
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10" align="left">
					<br>
					<h3 align=left;>무비 파인더</h3>
					<hr style="border:2px solid black;">
				</div>
				<div class="col-md-offset-1"></div>
			</div>
		</div>
		
		<!-- 선택 -->
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10" align="left" style="background: #FFFFFF url(${projectRes}images/ybh/div.gif) no-repeat center center; width:100%; height:500px;">
					<br><br><br>
					<div style="color:white; height:400px;">
						<h5 align="center">좋아하는 영화, 찾고싶은 영화를 BAOBOX에서 찾아드립니다!</h5>
						<hr style="border:1px solid white;">
						<!-- <form name="searchForm" id="searchForm"> -->
							<table style="height:330px; width:100%;">
								<!-- 영화검색 -->
								<tr style="border-bottom:1px solid white" align="center">
									<th style="color:white; font-size:12px; font-weight:bald; width:20%;">	
										영화검색
									</th>
									<td style="width:80%" align="left">
										<!-- 찾을 컬럼명 선택 -->
										<select id="select" name="select" style="background-color:white; height:25px; font-size:12px;">
										    <option value="all">전체</option>
										    <option value="movie_title">영화제목</option>
										    <option value="movie_star">주연배우</option>
										    <option value="movie_director">감독</option>
										</select>
										<input type="text" id="keyword" name="keyword" placeholder="키워드를 입력해 주세요" style="font-size:12px; width:400px; height:25px">
									</td>
								</tr>
								
								<!-- 장르 -->
								<tr style="border-bottom:1px solid white" align="center">
									<th style="color:white; font-size:12px; font-weight:bald;">	
										장르
									</th>
									<td align="left" style="color:white; font-size:12px; font-weight:bald;">
										<input type="checkbox" id="checkall_janre">전체 <br><br>
										<input type="checkbox" name="movie_janre" value="1">가족 &nbsp;
										<input type="checkbox" name="movie_janre" value="2">공포/호러 &nbsp;
										<input type="checkbox" name="movie_janre" value="3">드라마 &nbsp;
										<input type="checkbox" name="movie_janre" value="4">SF &nbsp;
										<input type="checkbox" name="movie_janre" value="5">멜로/로맨스 &nbsp;
										<input type="checkbox" name="movie_janre" value="6">코미디 &nbsp;
										<input type="checkbox" name="movie_janre" value="7">애니메이션 &nbsp;
									</td>
								</tr>
								
								<!-- 제작국가 -->
								<tr style="border-bottom:1px solid white" align="center">
									<th style="color:white; font-size:12px; font-weight:bald;">	
										제작국가
									</th>
									<td align="left" style="color:white; font-size:12px; font-weight:bald;">
										<input type="checkbox" id="checkall_country">전체  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="한국"> 한국&nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="미국">미국 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="일본">일본 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="중국">중국&nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="홍콩">홍콩 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="프랑스">프랑스 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="영국">영국 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="독일">독일 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="인도">인도 &nbsp;&nbsp;
										<input type="checkbox" name="movie_country" value="기타">기타 &nbsp;&nbsp;
									</td>
								</tr>
								
								<!-- 관람등급 -->
								<tr style="border-bottom:1px solid white" align="center">
									<th style="color:white; font-size:12px; font-weight:bald;">	
										관람등급	
									</th>
									<td align="left" style="color:white; font-size:12px; font-weight:bald;">
										<input type="checkbox" id="checkall_age">전체  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="movie_age" value="0"> 전체관람가&nbsp;&nbsp;
										<input type="checkbox" name="movie_age" value="7">7세 관람가 &nbsp;&nbsp;
										<input type="checkbox" name="movie_age" value="12">12세 관람가 &nbsp;&nbsp;
										<input type="checkbox" name="movie_age" value="15">15세 관람가&nbsp;&nbsp;
										<input type="checkbox" name="movie_age" value="19">청소년 관람불가 &nbsp;
										
									</td>
								</tr>
								
								<!-- 버튼 -->
								<tr>
									<td colspan="2" align="center">
										<button id="search_btn" class="btn btn-danger">검색</button>
										<input class="btn btn-info" type="reset" value="초기화">
										
										<!-- <input class="btn btn-danger" type="submit" value="검색"> -->
									</td>
								</tr>
							</table>
						<!-- </form> -->
					</div>
				</div>
				<div class="col-md-offset-1"></div>
			</div><br><br>
		</div>
	</section>
	
	<!-- 결과 출력할 곳 -->
	<section id="result" align="left">
	
	</section>	
	
	<br>
	<br>
	<br>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>