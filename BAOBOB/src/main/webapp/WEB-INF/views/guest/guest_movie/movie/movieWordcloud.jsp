<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="/baobob/resources/phc/js/script.js"></script>
<script src="/baobob/resources/phc/js/tagCanvas.js"></script>
<script src="/baobob/resources/phc/js/tagCloud.js"></script>
<script src="/baobob/resources/phc/js/wordCloudScript.js"></script>
<html style="height:100%; width:100%;">
<body style="height:95%; width:95%;">
<form name="wordcloud">
<!-- 	<div style="height:80%; width:80%;"> -->
	<div>
		<div align="center" style="border:1px solid black; width:450px; float:left;">
<%-- 			<canvas style="float:left; height:100%; width:100%;" id="myCanvas"> <!-- 	<p>Moyeo word cloud</p> --> --%>
			<canvas width="440" height="400" id="myCanvas">
			</canvas>
		</div>
		<div style="width:130px; float:left; padding-left:5px;" >
			<c:if test="${type == 'Noun,Verb,ProperNoun' || type == ''}">
				<input type="checkbox" name="type" value="Noun" checked>명사 <br>
				<input type="checkbox" name="type" value="Verb" checked>동사 <br>
				<input type="checkbox" name="type" value="ProperNoun" checked>고유명사 <br><br>
			</c:if>
			<c:if test="${type == 'Verb,ProperNoun'}">
				<input type="checkbox" name="type" value="Noun">명사 <br>
				<input type="checkbox" name="type" value="Verb" checked>동사 <br>
				<input type="checkbox" name="type" value="ProperNoun" checked>고유명사 <br><br>
			</c:if>
			<c:if test="${type == 'Noun,ProperNoun'}">
				<input type="checkbox" name="type" value="Noun" checked>명사 <br>
				<input type="checkbox" name="type" value="Verb" >동사 <br>
				<input type="checkbox" name="type" value="ProperNoun" checked>고유명사 <br><br>
			</c:if>
			<c:if test="${type == 'Noun,Verb'}">
				<input type="checkbox" name="type" value="Noun" checked>명사 <br>
				<input type="checkbox" name="type" value="Verb" checked>동사 <br>
				<input type="checkbox" name="type" value="ProperNoun" >고유명사 <br><br>
			</c:if>
			<c:if test="${type == 'Noun'}">
				<input type="checkbox" name="type" value="Noun" checked>명사 <br>
				<input type="checkbox" name="type" value="Verb" >동사 <br>
				<input type="checkbox" name="type" value="ProperNoun" >고유명사 <br><br>
			</c:if>
			<c:if test="${type == 'Verb'}">
				<input type="checkbox" name="type" value="Noun" >명사 <br>
				<input type="checkbox" name="type" value="Verb" checked>동사 <br>
				<input type="checkbox" name="type" value="ProperNoun" >고유명사 <br><br>
			</c:if>
			<c:if test="${type == 'ProperNoun'}">
				<input type="checkbox" name="type" value="Noun" >명사 <br>
				<input type="checkbox" name="type" value="Verb" >동사 <br>
				<input type="checkbox" name="type" value="ProperNoun" checked>고유명사 <br><br>
			</c:if>
			
			<input type="number" name="count" value="${countOfWords}" min="1" max="100" style="width:38px;">개 <br><br>
			<button type="button" style="width:100px; height:40px;" onclick="searchWordloud(${movie_index});">검색</button>
			
		</div>
		<div id="tags" style="float:left;">
			<ul>
				<c:forEach var="wordVO" items="${wordList}">
						<li><a style="font-size:${wordVO.count+5}px;" href="#">${wordVO.word}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</form>
<!-- 	</div> -->
</body>
</html>