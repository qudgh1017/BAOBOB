/**
 * 
 */
//======================== InputSchedule Modal
function scheduleInput() {
	
	var url = "/uuplex/c-box/manage/schedule/inputForm";
	var method = "GET";
	var params = "d=1&t=0&theater_num=1";
	sendRequest(scheduleModal, url, method, params);
	
}
// ======================== Modify Modal
function scheduleModify(sid) {
	var url = "/uuplex/c-box/manage/schedule/modify";
	var method = "GET";
	var params = "sid=" + sid;
	sendRequest(scheduleModal, url, method, params);
}

// ======================== Modify Pro
function scheduleModifyPro() {
	var sid = document.movieModifyForm.sid.value;
	var sname = document.movieModifyForm.sname.value;
	var sinfo = document.movieModifyForm.sinfo.value;
	var activated = document.movieModifyForm.activated.value;

	var url = "/uuplex/c-box/manage/schedule/modifyPro";
	var method = "POST";
	var params = "sid=" + sid + "&sname=" + sname + "&sinfo=" + sinfo
			+ "&activated=" + activated;
	sendRequest(movieModal, url, method, params);
}

// ======================== Write Modal Dialog
function scheduleModal() {

	var modal = document.getElementById("dialog");

	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			//응답 결과가 HTML이면 responseText로 받고, XML이면 resonseXML로 받는다
			modal.innerHTML = httpRequest.responseText;
		} else {
			modal.innerHTML = httpRequest.status + "에러 발생";
		}
	} else {
		modal.innerHTML = "상태 : " + httpRequest.readyState;
	}
}