<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>    
<%@ include file="/resources/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAOBOX</title>
</head>

<body>
	
	<!-- CSS,JavaScript 참조 -->
	<%@ include file="/WEB-INF/views/guest/common/head.jsp" %>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/guest/common/navigation.jsp" %>
	<!-- main_menu -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_menu.jsp" %>
	<script type="text/javascript" src="${projectRes}ybh/js/ybh.js"></script>
	
	<section style="padding-top:0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-10" align="left">
					<br>
					<h3 align=left;>빠른 예매</h3>
					<hr style="border:2px solid black;">
				</div>
				<div class="col-md-offset-1"></div>
			</div><br><br>
			
			<!-- 영화/날짜/시간 -->
			<div class="row" style=>
				<div class="col-md-offset-1"></div>
				<div class="col-md-3" align="center" style="height:40px; color:white; font-weight:bold; border:1px solid white; background-color:black">
					영화
				</div>
				<div class="col-md-2" align="center" style="height:40px; color:white; font-weight:bold; border:1px solid white; background-color:black">
					날짜
				</div>
				<div class="col-md-5" align="center" style="height:40px; color:white; font-weight:bold; border:1px solid white; background-color:black">
					시간
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			
			<!-- 영화 선택후 날짜로 ajax 날짜 선택후 시간 ajax -->
			<div class="row">
				<div class="col-md-offset-1"></div>
				<div class="col-md-3" align="center" style="height:600px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
					<div style="overflow:auto; width:100%; height:100%; background-color:#EEEEEE">
						<!-- 등록된 영화 없을 때 -->
						<c:if test="${cnt == 0}">
							아직 등록된 영화가 없습니다.
						</c:if>
						
						<!-- 등록된 영화 있을 때(상영예정작, 상영중 리스트) -->
						<c:if test="${cnt>0}">
							<br>
							<c:forEach var="movie" items="${movies}"> 
								<!-- 상영 중 -->
								<c:if test="${movie.movie_state==1}">
									<%-- <input type="hidden" name="movie_index" value="${movie.movie_index}"> --%>
									<button onclick="movieClick(${movie.movie_index});" type="button" class="btn btn-black" data-toggle="button" aria-pressed="false" autocomplete="off" style="width:95%; height:50px; ">
										<div align="left" >
											<c:if test="${movie.movie_age==0}">전체</c:if>
											<c:if test="${movie.movie_age!=0}">${movie.movie_age}</c:if>&nbsp; 
											${movie.movie_title}
										</div>
									</button>
								</c:if>
								
								<!-- 상영예정작 -->
								<c:if test="${movie.movie_state==0}">
									<button onclick="nonPlaying();" type="button" class="btn" data-toggle="button" aria-pressed="false" autocomplete="off" style="height:50px; color: rgba(0,0,0,0.5);background-color: rgba(255, 255, 255, 0.5); width:95%;">
										<div align="left" >
											<c:if test="${movie.movie_age==0}">전체</c:if>
											<c:if test="${movie.movie_age!=0}">${movie.movie_age}</c:if>&nbsp;
											${movie.movie_title}
										</div>
									</button>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
					
				</div>
				<div class="col-md-2" align="center" style="height:600px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
					
					<div style="overflow:auto; width:100%; height:100%; background-color:#EEEEEE">
						<div id="resultDate" class="reserveTab" align="center" style="height:30px;">
							<span><fmt:formatDate value="<%=new Date()%>" pattern="YYYY" /></span><br>
							<span style="font-size: 30px; margin-bottom: 10px;"><fmt:formatDate value="<%=new Date()%>" pattern="MM" /></span><br>
							
							<button onclick="" type="button" class="btn btn-black" data-toggle="button" aria-pressed="false" autocomplete="off" style="width:95%; height:50px; ">
								<span><fmt:formatDate value="<%=new Date(new Date().getTime())%>" pattern="E dd" /></span>
							</button>
							<button onclick="" type="button" class="btn btn-black" data-toggle="button" aria-pressed="false" autocomplete="off" style="width:95%; height:50px; ">
								<span ><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000)%>" pattern="E dd" /></span>
							</button>
							<button onclick="" type="button" class="btn btn-black" data-toggle="button" aria-pressed="false" autocomplete="off" style="width:95%; height:50px; ">
								<span><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 2)%>" pattern="E dd" /></span>
							</button>
							<button onclick="" type="button" class="btn btn-black" data-toggle="button" aria-pressed="false" autocomplete="off" style="width:95%; height:50px; ">
								<span><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 3)%>" pattern="E dd" /></span>
							</button>
							<button onclick="" type="button" class="btn btn-black" data-toggle="button" aria-pressed="false" autocomplete="off" style="width:95%; height:50px; ">
								<span><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 4)%>" pattern="E dd" /></span>
							</button>
							<button onclick="" type="button" class="btn btn-black" data-toggle="button" aria-pressed="false" autocomplete="off" style="width:95%; height:50px; ">
								<span><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 5)%>" pattern="E dd" /></span>
							</button>
						</div>
					</div>
				</div>
				<div class="col-md-5" align="center" style="height:600px; color:black; font-weight:bold; border:1px solid white; background-color:#EEEEEE">
					
					<div style="overflow:auto; width:100%; height:100%; background-color:#EEEEEE">
						<!-- 스케줄 결과값 출력 될곳 -->
						<div id="resultSchedule" class="reserveTab" align="center" style="height:30px;">
							<center>영화와 날짜를 선택해주세요.</center>
						</div>
					</div>
				</div>
				<div class="col-md-offset-1"></div>
			</div>
			
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
		
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/guest/guest_movie/movie_footer.jsp" %> 
</body>
</html>