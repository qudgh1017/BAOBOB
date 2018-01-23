<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="/baobob/resources/phc/js/tagCanvas.js"></script>
<script src="/baobob/resources/phc/js/tagCloud.js"></script>
<script src="/baobob/resources/phc/js/wordCloudScript.js"></script>

<div>
	<div>
		<div style="float:left; width:500">
			<div>
				<canvas width="500" height=350" style="width:100%" id="myCanvas"> <!-- 	<p>Moyeo word cloud</p> -->
				</canvas>
			</div>
			<div id="tags" style="float:left;">
				<ul>
					<c:forEach var="wordVO" items="${wordList}">
							<li><a style="font-size:${wordVO.count+5}px;" href="#">${wordVO.word}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
