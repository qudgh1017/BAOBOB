function dateCheck() {
	var strDate = document.wordSearchForm.strDate.value;
	var endDate = document.wordSearchForm.endDate.value;
	if(endDate < strDate){
		alert('종료 날짜는 시작날짜보다 클수 없습니다.');
		document.wordSearchForm.endDate.value = strDate;
	}
	
}

// 날짜타입 유효성 체크
function validChk() {
	var strDate = document.wordSearchForm.strDate.value;
	var endDate = document.wordSearchForm.endDate.value;
	var count = 0;
	var countOfWords = document.wordSearchForm.countOfWords.value;

	for (i=0; i<document.wordSearchForm.wordOps.length; i++ ) {
		if (document.wordSearchForm.wordOps[i].checked==true) {
			count++;
		}
	} 
	
	if(strDate != '' && endDate == '') {
		alert('마지막 날짜를 선택해 주세요.');
		return false;
	}
	
	if(strDate == '' && endDate != '') {
		alert('시작 날짜를 선택해 주세요.');
		return false;
	}
	
	if(strDate == '' && endDate == '' && count == 0) {
		alert('검색조건을 선택해주세요.');
		return false;
	}
	
	if(countOfWords == '') {
		alert('검색할 단어의 수를 입력하세요.');
		return false;
	}
	
	return true;
}

// 데이터 전송
function refreshWords() {
	
	if(validChk()) {
		var strDate = document.wordSearchForm.strDate.value;
		var endDate = document.wordSearchForm.endDate.value;
		var countOfWords = document.wordSearchForm.countOfWords.value;
		var wordOps = getWordOps();
		
		var params = "strDate="+strDate+"&endDate="+endDate+"&countOfWords="+countOfWords+"&wordOps="+wordOps;
		
		// function sendRequest(callback, url, method, params) {} 호출
		sendRequest(refresh, "refreshWordcloud", "GET", params);
	}
	
}

function getWordOps() {
	var ops = '';
	var wordOps = document.wordSearchForm.wordOps;
	for (i=0; i<wordOps.length; i++ ) {
		if (wordOps[i].checked==true) {
			ops += ops == '' ? wordOps[i].value : ', ' + wordOps[i].value;
		}
	}
	return ops;
}

// 콜백함수(워드클라우드)
function refresh() {
	
	var result = document.getElementById("tags");
	
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			
			var msg = "";
			// eval("문자열") 함수 : 일반문자열을 수식으로 리턴해주는 역할
			var data = eval('httpRequest.responseText');
			
			result.innerHTML = data;
			refrechWord();
			
		} else {
			result.innerHTML = "에러발생";
		} 
	} else {
		result.innerHTML = "상태 : " + httpRequest.readyState;
	}
}

function sendRequest(callback, url, method, params) {
	
	// 비동기 통신을 관리하는 XMLHttpRequest 생성
	httpRequest = getXMLHttpRequest();
	
	// onreadystatechange : 오브젝트 상태가 변한 시점에 불러오는 이벤트핸들러.. 즉 대기상태가 바뀌면 실행할 이벤트
	// callback 함수 : 서버로부터 응답이 오면 동작할 콜백함수(시스템이 자동호출)
	httpRequest.onreadystatechange = callback;
	
	var httpMethod = method ? method : "GET";
	if(httpMethod != "GET" && httpMethod != "POST") {
		httpMethod = "GET";
		
	}

	// params
	var httpParams = (params == null || params == "") ? null : params;
	
	// url
	var httpUrl = (httpMethod == "GET") ? (url + "?" + httpParams) : url;
	
	// 요청 전송 - HTTP 통신을 시작한다.
	// open(방식, 응답페이지, 비동기)
	httpRequest.open(httpMethod , httpUrl, true);
	httpRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded;charset=utf-8");
	
	httpRequest.send(httpMethod == "POST" ? httpParams : null);
}

/**
 * 비동기 통신을 관리하는 XMLHttpRequest 오브젝트 :
 * 브라우저가 했던 서버와의 통신부분이 자바스크립트 조작을 통해 가능하다.
 * 브라우저 표준 오브젝트의 하나지만 버전별로 차이가 생긴다.
 * Microsoft.XMLHTTP는 익스플로러 오브젝트이고,
 * 나머지 브라우저에서는 XMLHttpRequest 오브젝트를 얻어온다.
 */
var httpRequest = null;
function getXMLHttpRequest() {
	if(window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				return null;
			}
		}	
	} else if(window.XMLHttpRequest) {
		try {
			return new XMLHttpRequest();
		} catch (e) {
			return null;
		}		
	} else {
		return null;
	}
}

