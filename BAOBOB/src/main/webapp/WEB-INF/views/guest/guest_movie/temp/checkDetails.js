/**
 * 
 */
function dateCnt(count) {
	
	// 현재
	var curdt = new Date();
	
	var curday = curdt.getDate() < 10 ? '0' + (curdt.getDate()) : (curdt.getDate()); // 일
	var curmonth = curdt.getMonth() + 1 < 10 ? '0'+ (curdt.getMonth() + 1) : (curdt.getMonth() + 1); // 월
	var curyear = curdt.getFullYear(); // 년

	var curdate = curyear + "-" + curmonth + "-" + curday; // 현재 날짜
	
	// 카운트
	var dt = new Date();
	
	var cntday;
	var day;
	
	if(count == 30) {
		day =  dt.getDate() < 10 ? '0'+(dt.getDate()) : (dt.getDate());
	} else {
		cntday = dt.getDate();
		dt.setDate(cntday - count);
		day = dt.getDate() < 10 ? '0'+(dt.getDate()) : (dt.getDate()); // 계산일
	}
		
	if(count == 30){
		var month = dt.getMonth() + 1 < 10 ? '0'+(dt.getMonth()) : (dt.getMonth())
	} else {
		var month = dt.getMonth() + 1 < 10 ? '0'+(dt.getMonth() + 1) : (dt.getMonth() + 1) ; // 계산월
	}
	
	var year = dt.getFullYear(); // 계산년
	
	var date = year + "-" + month + "-" + day; // 계산 날짜
	
	var params = "date=" + date + "&curdate=" + curdate;
	
	sendRequest(dateCntCall, "/uuplex/c-box/manage/dateCnt", "GET", params);
	
	
	
	
function dateCntCall(){
	
		var result = document.getElementById("insertDate");
		
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) { // 200:정상종료
				
				var data = eval("httpRequest.responseText");
				
			
				result.innerHTML = data;
				
			} else {
				result.innerHTML = "에러발생";
			}
		} else {
			result.innerHTML = "상태 : " + httpRequest.readyState;
		}
		
	}
}

function reservlist(log) {
	
	var params = "log=" + log;
	
	sendRequest(reservlistCall, "manage/dateCnt", "GET", params);
}

function reservlistCall(){
	var list = document.getElementById("list");
	var listdate = document.getElementById("listdate");
	var listid = document.getElementById("listid");
	
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) { // 200:정상종료
		
			/*list.innerHTML = httpRequest.responseText;*/
			list.innerHTML = "";
			listdate.innerHTML = "";
			listid.innerHTML = "";
			
		} else {
			list.innerHTML = "에러발생";
		}
	} else {
		list.innerHTML = "상태 : " + httpRequest.readyState;
	}
	
}
function dateSrc() {
	
	var date = document.reserve.date.value;
	var curdate = document.reserve.curdate.value;
	var log = document.reserve.catal.value;
	var search = document.reserve.search.value;
	
	if((date == "") || (curdate == "")){
		alert("기간을 선택해 주세요");
		return false;	
	}
	if(date > curdate) {
		alert("기간 설정이 잘못되었습니다.");
		return false;
	}
	
	if(log == '전체'){
	var params = "date=" + date + "&curdate=" + curdate + "&log=" + log;
	}else{
		
		if (search == "") {
			alert("검색어를 입력하세요");
			return false;
		}else{
			
			var params = "date=" + date + "&curdate=" + curdate + "&log=" + log +"&search="+search;	
			
		}
		
	}
	
	sendRequest(dateSrcCall, "manage/searchOption", "GET", params);
}

function dateSrcCall(){
	var listdate = document.getElementById("listdate");
	var list = document.getElementById("list");
	var listid = document.getElementById("listid");
	
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) { // 200:정상종료
		
			listdate.innerHTML = httpRequest.responseText;
			list.innerHTML = "";
			listid.innerHTML = "";
			
		} else {
			listdate.innerHTML = "에러발생";
		}
	} else {
		listdate.innerHTML = "상태 : " + httpRequest.readyState;
	}
	
}

//검색 초기화
function callreset() {
	
	var list = document.getElementById("list");
	var listdate = document.getElementById("listdate");
	var listid = document.getElementById("listid");
	
	list.innerHTML = "";
	listdate.innerHTML = "";
	listid.innerHTML = "";
}