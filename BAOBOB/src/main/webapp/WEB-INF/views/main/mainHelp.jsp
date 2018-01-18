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
    
    <style type="text/css">
    	.title{padding-top:10rem;text-align:center;margin:0 auto;}
    	
    	.search{width:980px;background:#f5f5f5;padding:20px 30px;margin:0 auto;}
    	.tit{display:inline-block;font-size:14px;font-weight:bold;color:#231f20;width:111px;}
    	.input{width:622px;height:32px;background:white;border:1px solid #e5e5e5;font-size:14px;color:#666;margin-right:-3px;}
    	.tit_btn{width:50px;height:30px;border:0;background:#34373c;color:#fefeff;}
    	
    	.sea_bottom{margin:20px 0 0 114px;border-top:1px solid #dedede;padding-top:20px;}
    	.txt{float:left;padding:0 50px 0 0;color:#666;font-size:13px;}
    	.sea_a{color:#231f20;min-width:auto;padding-left:23px;margin-left:30px;font-size:13px;font-weight:bold;}
    	
    	.content{width:fit-content;margin:0 auto;margin-top:30px;}
    	.item{height:50px;clear:both;border-top:1px solid #dedede;}
    	.d1{float:left;width:190px;text-align:center;}
    	.d2{float:left;width:790px;text-align:center;}
    </style>
</head>

<body id="page-top">	
	<%@ include file="../guest/common/head.jsp" %>

	<!-- Navigation -->
	<%@ include file="../guest/common/navigation.jsp" %>
	
	<h1 class="title">FAQ</h1>
	
	<section>
		<div class="search">
			<span class="tit">검색</span>
			<input class="input" id="help();" type="text">
			<button class="tit_btn" onclick="search();">검색</button><br>
			<div class="sea_bottom">
				<p class="txt">더 궁금한 점이 있거나, 이미 문의한 내용과 답변을 확인하려면?<p>
				<a class="sea_a" href="">1:1 문의 바로가기</a>
				<a class="sea_a" href="">나의 문의 내역 바로가기</a>
			</div>
		</div>
		<div>
			<ul class="content">
				<li class="item">
					<div class="d1">분류</div>
					<div class="d2">질문</div>
				</li>
				<c:forEach var="h" items="${help}">
					<li class="item" onclick="help_more('${h.faq_index}');">
						<div class="d1">${h.faq_title}</div>
						<div class="d2">${h.faq_sub_title}</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>
	
	<!-- footerCopyright -->
	<%@ include file="../guest/common/footerCopyright.jsp" %>

</body>

</html>