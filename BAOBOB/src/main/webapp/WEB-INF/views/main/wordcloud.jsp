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
				<canvas width="500" height="350" style="width:100%" id="myCanvas"> <!-- 	<p>Moyeo word cloud</p> -->
				
				</canvas>
			</div>
			<div id="tags" style="float:left;">
				<ul>
					<c:forEach var="wordDto" items="${wordList}">
						<c:if test="${wordDto.type_of_speech == 'Hashtag'}">
							<li><a href="/moyeo/two/wordCloudSearchByTag?search_keyword=${wordDto.word}">${wordDto.word}</a></li>
						</c:if>
						<c:if test="${wordDto.type_of_speech != 'Hashtag'}">
							<li><a href="/moyeo/two/wordCloudSearch?search_keyword=${wordDto.word}">${wordDto.word}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<form action="refreshWordcloud" name="wordSearchForm" method="post" onsubmit="return validChk();">
			<div style="width:290px; float:left; margin-top:20px;" class="form-horizontal">
				<div class="form-group">
	                <label class="col-md-3 control-label"><font size="4px;">기간</font></label><br>
	                <div class="col-md-5" style="width:100%; margin-top:10px;">
	                    <div class="input-group">
	                        <input type="text" class="form-control datepicker" name="strDate" id="strDate" style="height:42px;" placeholder="시작날짜">
	                        <span class="input-group-addon add-on"> - </span>
	                        <input type="text" class="form-control datepicker" name="endDate" id="endDate" onchange="dateCheck();" style="height:42px;" placeholder="종료날짜">
	                    </div>
	                </div>
	                <label class="col-md-3 control-label" style="margin-top:20px;"><font size="4px;">조건</font></label>
	                <div class="col-md-4" style="width:100%;">
	                    <label class="check"><input type="checkbox" class="icheckbox" name="wordOps" value="Noun" /><font size="3px;">명사</font></label>&nbsp;&nbsp;
	                    <label class="check"><input type="checkbox" class="icheckbox" name="wordOps" value="Verb" /><font size="3px;">동사</font></label>&nbsp;&nbsp;
	                    <label class="check"><input type="checkbox" class="icheckbox" name="wordOps" value="Hashtag" /><font size="3px;">Hash Tag</font></label>
	                </div>
	                <label class="col-md-3 control-label" style="margin-top:20px; width:50px;"><font size="4px;">Count</font></label>
	                <div class="col-md-4" style="width:100%;">
	                    <label class="number"><input type="number" class="form-control spinner_default ui-spinner-input" name="countOfWords" value="30" min="10" max="100" placeholder="표시할 word의 수" required/></label>&nbsp;&nbsp;
<!-- 	                    <input type="button" class="btn btn-warning btn-rounded" style="margin-top:10px; margin-left: 70%;" id="test" value="검색" onclick="return refreshWords();"> -->
	                    <input type="submit" class="btn btn-warning btn-rounded" style="margin-top:10px;" value="검색">
	                </div>
	            </div>
			</div>
		</form>
	</div>
</div>
