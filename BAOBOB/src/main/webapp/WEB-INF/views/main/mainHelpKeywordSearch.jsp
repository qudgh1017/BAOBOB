<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/resources/setting.jsp"%>
<html>
  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Baobob</title>
    <link href="${projectRes}ymk/css/mainHelp.css" rel="stylesheet">
</head>

<body id="page-top">	
	<%@ include file="../guest/common/head.jsp" %>

	<!-- Navigation -->
	<%@ include file="../guest/common/navigation.jsp" %>
	
	<h1 class="title">FAQ</h1>
	
	<section class="faq_container">
		<div class="search">
			<span class="tit">검색</span>
			<input class="input" id="keyword" type="text" onkeydown="startSuggest();">
			<button class="tit_btn" onclick="search();">검색</button><br>
			<div class="suggest" id="divSuggest"></div>
			<div class="sea_bottom">
				<p class="txt">더 궁금한 점이 있거나, 이미 문의한 내용과 답변을 확인하려면?<p>
				<a class="sea_a" href="memQuestion">1:1 문의 바로가기</a>
				<a class="sea_a" href="memLost">분실물 문의 바로가기</a>
			</div>
		</div>
		<div id="searchResult">
			<ul class="faq_content" id="faq_content">
				<li class="item item_t clearfix">
					<div class="item_d d1">분류</div>
					<div class="item_d d2">질문</div>
				</li>
				<c:forEach var="h" items="${help}">
					<li class="item clearfix" onclick="help_more('${h.faq_index}');">
						<div class="item_d d1">${h.faq_title}</div>
						<div class="item_d d2">${h.faq_sub_title}</div>
						<div class="item_n" id="${h.faq_index}"><span class="box_a">A</span><p>${h.faq_content}</p></div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<c:if test="${end < totalCnt}">
			<button class="more_btn" id="more_btn" onclick="help_list_more();">더 보기</button>
		</c:if>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../guest/common/footerCopyright.jsp" %>

</body>


<script src="${projectRes}ymk/js/ajax.js"></script>
<script src="${projectRes}ymk/js/mainHelp.js"></script>
<script type="text/javascript">

//더보기
var current = ${current}; //현재 페이지번호
function help_list_more() {
	var param = 'next=' + ((current-0) + 1);
	sendRequest(help_list_more_callback, 'mmainHelpKeywordSearchMore', 'GET', param);
}

function help_list_more_callback(){
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var data = httpRequest.responseText; //index^li|index^li|....|current^numver|end^Number
			var arr = data.split('|');
			
			arr.forEach(function(item) {
				var hel = item.split('^');
				
				if(hel[0] != 'current' && hel[0] != 'end') {
					var li = document.createElement('li'); //li 태그 생성
					li.setAttribute('class', 'item');
					li.setAttribute('onclick', 'help_more(' + hel[0] + ');');
					li.innerHTML = hel[1];
					document.getElementById('faq_content').appendChild(li); //ul에 li 추가
				} else if(hel[0] != 'end') {
					current = hel[1];
				} else {
					if(hel[1] >= ${totalCnt}) {
						document.getElementById('more_btn').style.display = 'none';							
					}
				}
			});
			console.log('완료');
		} else {
			console.log('오류');
		}
	} else {
		console.log('에러 ' + httpRequest.readyState);
	}
}

</script>
</html>