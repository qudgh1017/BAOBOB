<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting.jsp"%>

<image src="${projectRes}images/ybh/search_results.gif">
<hr style="border:2px solid black;">
${sel}: ${movie_title} <br>
<c:forEach var="janre" items="${movie_janre}">
영화장르 : ${janre} <br>
</c:forEach>
제작국가 : ${movie_country} <br>
연령 : ${movie_age} <br>
<br><br>   



<!-- 중간에 순서빼고 체크하면 에러남 -->



<%
	request.setCharacterEncoding("UTF-8");
	//String movie_title = request.getParameter("movie_title");
	//String[] movie_janre = request.getParameterValues("movie_janre");
	//String[] movie_country = request.getParameterValues("movie_country");
	//String[] movie_age = request.getParameterValues("movie_age");
	
%>


