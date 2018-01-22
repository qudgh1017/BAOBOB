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
				<canvas width="300" height=250" style="width:100%" id="myCanvas"> <!-- 	<p>Moyeo word cloud</p> -->
				</canvas>
			</div>
			<div id="tags" style="float:left;">
				<ul>
					<c:forEach var="wordDto" items="${wordList}">
						<c:if test="${wordDto.type_of_speech == 'Hashtag'}">
							<li><a href="#">${wordDto.word}</a></li>
						</c:if>
						<c:if test="${wordDto.type_of_speech != 'Hashtag'}">
							<li><a href="#">${wordDto.word}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
