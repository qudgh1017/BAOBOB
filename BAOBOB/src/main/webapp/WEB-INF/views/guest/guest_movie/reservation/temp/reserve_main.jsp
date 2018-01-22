<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>   
<style>
.thead td{
	height:50px;
	background-color:#333;
	color:white;
	font-size: 20px;
	text-align: center;
	border:2px solid white;
}
.inside tbody {
	background-color:#F6F6F6;
}
tr{
	width:1140px;
}
.list{
	margin: 100px auto;
}
.option {
	margin : 10px;
}

.optionDta{
	height:40px;
	font-size: 18px;
	padding:5px;
}

.optionLine{
	padding-top: 3px;
	padding-left: 3px;
}
.optionLine:hover{
	border:1px solid #5D5D5D;
}
.optionDta:hover{
	background-color:#4C4C4C;
	color:white;
	
}
.active{
	background-color:#4C4C4C;
	color:white;
}

.date *{
	display:block;
	text-align:center;
}
.date {
	padding: 20px;
}
.date .selectdate{
	padding: 5px 0 2px 0;
	margin : 5px 10px;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="${resources}/js/Ajax.js"></script>
<script>
	$(function(){
		
		var movie_num = 0;
		
		movie_num = $(".active").children().find("input").val();
		
		$(".optionDta").click(function(){
			$(this).addClass('active');
			$(".option").children().not(this).attr('class','optionDta');
			
			movie_num = $(this).children().find("input").val();
		});
		
		$(".selectdate").click(function(){
			$(this).addClass('active');
			$(".date").children(".selectdate").not(this).attr('class','selectdate');
			
			var date = $(".selectdate").index(this);
			var url = "/uuplex/c-box/dateschedule";
			var method = "GET";
			var params = "date="+date+"&movie_num="+movie_num;
			sendRequest(request, url, method, params);
			
			$(".optionDta").click(function(){
				var movie_num = $(this).children().find("input").val();
				var params = "date="+date+"&movie_num="+movie_num;
				sendRequest(request, url, method, params);
			});
		});
	});
	
	function request() {

		var modal = document.getElementById("result");

		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				//응답 결과가 HTML이면 responseText로 받고, XML이면 resonseXML로 받는다
				modal.innerHTML = httpRequest.responseText;
			} else {
				modal.innerHTML = httpRequest.status + "에러 발생";
			}
		}
	}
	
	function chkid(id, schedule_num) {
		if(id==' '){
			alert("로그인 후 이용가능합니다");
			
		} else {
			location.href="/uuplex/c-box/ticket?schedule_num="+schedule_num;
		}
		
	}
	
	
</script>
<div class="container">
	<div class="list">
		<div class="inside">
			<table>
				<tr class="thead">
					<td style="width:400px">영화</td>
					<td style="width:150px">날짜</td>
					<td style="width:600px">시간</td>
				</tr>
				<tbody>
				<tr>
					<td>
						<div class="option">

								<c:forEach var="dto" items="${dtos}">
								<c:if test="${dto.movie_num==param.movie}">
									<div class="optionDta active">
										<div class="optionLine">
											<img id="rate" src="${img}mpaa_rating/${dto.MPAARating}.png">
											&nbsp;${dto.title1}
											<input type="hidden" value="${dto.movie_num}">
										</div>
									</div>
								</c:if>
								<c:if test="${dto.movie_num!=param.movie}">
									<div class="optionDta">
										<div class="optionLine">
											<img id="rate" src="${img}mpaa_rating/${dto.MPAARating}.png">
											&nbsp;${dto.title1}
											<input type="hidden" value="${dto.movie_num}">
										</div>
									</div>
								</c:if>
								</c:forEach>
							</div>
					</td>
					<td>
					<div class="date">
						<span><fmt:formatDate value="<%=new Date()%>" pattern="YYYY" /></span>
						<span style="font-size: 30px; margin-bottom: 10px;"><fmt:formatDate value="<%=new Date()%>" pattern="MM" /></span>
						
						<span class="selectdate"><fmt:formatDate value="<%=new Date(new Date().getTime())%>" pattern="E dd" /></span>
						<span class="selectdate"><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000)%>" pattern="E dd" /></span>
						<span class="selectdate"><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 2)%>" pattern="E dd" /></span>
						<span class="selectdate"><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 3)%>" pattern="E dd" /></span>
						<span class="selectdate"><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 4)%>" pattern="E dd" /></span>
						<span class="selectdate"><fmt:formatDate value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 5)%>" pattern="E dd" /></span>	
					</div>		
					</td>
					<td id="result" style="padding: 30px;">
						<center>영화와 날짜를 선택해주세요.</center>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	
</div>