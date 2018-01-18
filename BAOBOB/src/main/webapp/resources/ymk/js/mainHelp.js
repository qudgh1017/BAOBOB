var prev; //이전에 선택한 목록
function help_more(id) {
	console.log(id);
	if(prev == null) { //처음 선택 시 내용 보이기
		document.getElementById(id).style.display = 'block';
		prev = id;
	} else if(prev != id) { //다른 선택시 이전 내용 숨기고 선택 내용 보이기
		document.getElementById(id).style.display = 'block';
		document.getElementById(prev).style.display = 'none';
		prev = id;
	} else { //같은 내용 선택시 초기화
		document.getElementById(prev).style.display = '';
		prev = null;
	}
}

//검색 버튼 클릭
function search() {
	var keyword = document.getElementById('keyword').value;
	var param = 'keyword=' + keyword;
	
	window.location = 'mainHelpKeywordSearch?' + param;
}

//검색 중
var chkFirst = true; //처음
var loopFlg = false; //반복 작업 스위치
var lastKeyword = null;
function startSuggest() {
	if(chkFirst == true) {
		loopFlg = true;
		setTimeout('sendKeyword()', 500); //5초마다 반복
	}
	chkFirst = false; //작업 종료
}

function sendKeyword() {
	if(loopFlg == false) { return false; } //작업 종료
	
	var keyword = document.getElementById('keyword').value;
	if(keyword == null) {
		hide('divSuggest');
		lastKeyword = '';
	} else if (keyword != lastKeyword) { //이전 검색어와 다를 때 동작
		lastKeyword = keyword;
		var param = 'keyword=' + keyword;
		sendRequest(sendKeyword_callback, 'mainHelpKeywordSuggest', 'GET', param);
	}
	setTimeout('sendKeyword()', 500);
}

function sendKeyword_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var data = httpRequest.responseText;
			
			var result = '';
			var arr = data.split(',');
			arr.forEach(function(item) {
				result += '<a href="javascript:select(&#39;' + item + '&#39;)">' + item + '</a><br>';
			});
			
			document.getElementById('divSuggest').innerHTML = result;
			show('divSuggest');
			console.log('완료');
		} else {
			console.log('오류');
		}
	} else {
		console.log('에러 '+ httpRequest.readyState);
	}
}

//검색 제안어 선택하면
function select(item) {
	document.getElementById('keyword').value = item;
	loopFlg = false;
	chkFirst = true;
	hide('divSuggest');
}

//보이기
function show(id) {
	var element = document.getElementById(id);
	if(element) {
		element.style.display = 'block';
	}
}

//감추기
function hide(id) {
	var element = document.getElementById(id);
	if(element) {
		element.style.display = 'none';
	}
}