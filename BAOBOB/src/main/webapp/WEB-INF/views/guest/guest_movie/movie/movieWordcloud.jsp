<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="/baobob/resources/phc/js/tagCanvas.js"></script>
<script src="/baobob/resources/phc/js/tagCloud.js"></script>
<script src="/baobob/resources/phc/js/wordCloudScript.js"></script>
<html style="height:95%; width:100%;">
<body style="height:90%; width:90%;">
<!-- 	<div style="height:80%; width:80%;"> -->
		<div style="height:100%; width:100%;" align="center">
			<canvas style="float:left; height:100%; width:100%;" id="myCanvas"> <!-- 	<p>Moyeo word cloud</p> -->
			</canvas>
		</div>
		<div id="tags" style="float:left;">
			<ul>
				<c:forEach var="wordVO" items="${wordList}">
						<li><a style="font-size:${wordVO.count+5}px;" href="#">${wordVO.word}</a></li>
				</c:forEach>
			</ul>
		</div>
<!-- 	</div> -->
</body>
</html>