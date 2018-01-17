/**
 * 
 */

//======================== Input Modal
function theater(theater_num) {
	
	var url = "/uuplex/c-box/manage/theater/inputForm";
	var method = "GET";
	var params = "theater_num=" + theater_num;
	sendRequest(theaterModal, url, method, params);	
}

//======================== Modify Modal
function theaterModify(sid){
	var url = "/uuplex/c-box/manage/theater/modify";
	var method = "GET";
	var params = "sid=" + sid;
	sendRequest(theaterModal, url, method, params);
}

//======================== Modify Pro
function theaterModifyPro(){
	var sid = document.movieModifyForm.sid.value;
	var sname = document.movieModifyForm.sname.value;
	var sinfo = document.movieModifyForm.sinfo.value;
	var activated = document.movieModifyForm.activated.value;
	
	var url = "/uuplex/c-box/manage/theater/modifyPro";
	var method = "POST";
	var params = "sid=" + sid + "&sname=" + sname + "&sinfo=" + sinfo + "&activated=" + activated;
	sendRequest(movieModal, url, method, params);
}

//======================== Write Modal Dialog
function theaterModal() {
	
	var modal = document.getElementById("dialog");
	
	if(httpRequest.readyState == 4 ) {
		if(httpRequest.status == 200) {
			//응답 결과가 HTML이면 responseText로 받고, XML이면 resonseXML로 받는다
			modal.innerHTML = httpRequest.responseText;
		} else {
			modal.innerHTML = httpRequest.status + "에러 발생";
		}
	} else {
		modal.innerHTML = "상태 : " + httpRequest.readyState;
	}
	
}