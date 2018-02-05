/**
 * 
 */

var delChk = "번 메뉴를 삭제하시겠습니까?";
var delChk2 = "님의 직원 정보를 삭제하시겠습니까?";
var delChk3 = "의 정보를 삭제하시겠습니까?\n삭제한 정보는 다시 되돌릴 수 없습니다.";
var addChk = " 님을 직원으로 등록하시겠습니까?";
var numChk = "이 입력란은 숫자만 입력 가능합니다.";

function errorAlert(msg) {
	alert(msg);
	window.history.back();
}

// 메뉴 & 직원 삭제 확인
function delCheck(index, chk) {
	if (chk == 'menu') {
		var del = confirm(index + delChk);	// confirm - 대화상자(alert와는 다르게 참 거짓을 리턴함)
		if (del) {
			window.location = 'hostMenuDel?index=' + index;
		}
	} else if (chk == 'employee') {
		var del = confirm(index + delChk2);
		if (del) {
			window.location = 'hostEmployeeDel?id=' + index;
		}
	} else {
		var del = confirm(chk + delChk3);
		if (del) {
			window.location = 'hostRestaurantDel?index=' + index;
		}
	}
}

// 직원 등록 확인
function addCheck(index) {
	var add = confirm(index + addChk);

	if (add) {
		return;
	} else {
		return false;
	}
}

// 숫자만 입력 받기
function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
			|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) {
		return;
	} else {
		alert(numChk);
		return false;
	}
}

// 숫자가 아닐 시 입력 삭제
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) {
		return;
	} else {
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
}

// 매장에서 사용할 전역변수들
var typeNum = '0'; // 선택한 버튼 번호
var typeImg = ''; // 선택한 버튼 이미지
var count = 0;	// 입력한 테이블 숫자
var table_index = 0;	// 예약한 테이블 번호

// type에 따라 버튼 이미지 설정
function spaceType(type) {
	typeNum = type; // 선택한 버튼 번호 저장
	switch (typeNum) {
	case '3':
		typeImg = 'table_use.jpg';
		break;
	case '2':
		typeImg = 'icon_enter.png';
		break;
	case '1':
		typeImg = 'table.jpg';
		break;
	case '0':
		typeImg = 'icon_tmp.png';
		break;
	}
}

// 가로, 세로 변할 경우 배열판 설정
function spaceDivChange() {
	var widthX = document.getElementById('widthX').value;
	var heightY = document.getElementById('heightY').value;

	var spaceDiv = document.getElementById('spaceDiv'); // 출력 위치

	var space = '';
	for (var y = 0; y < heightY; y += 1) {
		space += '<div class="p_div">';
		for (var x = 0; x < widthX; x += 1) {
			var location = x + '-' + y;
			var imgId = 'img' + location;
			var btnId = 'btn' + location; // 버튼 구별하기 위한 id

			// 배열판의 각 버튼
			space += '<button class="p_spaceBtn p_btn" ' + 
					'value="0" ' + 'id="' + btnId + '" ' + 
					'onclick="spaceBtnChange(&#39;' + location +'&#39;)">' + 
					'<img class="p_img space_img" ' + 'id="' + imgId + '" ' + 
					'src="/baobob/resources/images/chg/icon_tmp.png">' + '</button>';
			
			spaceDiv.innerHTML = space;
		}
		space += '</div>';
	}
}

//배열판의 선택한 버튼 설정
function spaceBtnChange(location) {
	if (typeImg != '') { // 아이콘 선택했을 경우, 선택한 버튼의 설정 변경
		// 선택한 버튼의 이미지 src 변경
		var imgId = 'img' + location; // 선택한 버튼의 id
		var spaceImg = document.getElementById(imgId); // 선택한 버튼의 img
		spaceImg.src = '/baobob/resources/images/chg/' + typeImg;

		// 선택한 버튼의 value 변경(DB에 아이콘index 넣기 위한 값)
		var btnId = 'btn' + location;
		var spaceBtn = document.getElementById(btnId);
		spaceBtn.value = typeNum;
	} else {
		alert('아이콘을 선택해주세요.');
	}
}

// 배열판의 선택한 버튼 설정
function spaceBtnChange2(location, index) {
	// 선택한 버튼의 value 변경(DB에 아이콘index 넣기 위한 값)
	var btnId = 'btn' + location;
	var spaceBtn = document.getElementById(btnId);
	var table_count = document.getElementById('count').value / 4;
	
	if((document.getElementById('count').value % 4) > 0) {
		table_count++;
	}
	
	if(spaceBtn.value == 1){
		if (typeImg != '') { // 아이콘 선택했을 경우, 선택한 버튼의 설정 변경
			count++;
			if(table_count < 1) {
				table_count = 1;
			}
			if(count <= table_count){
				// 선택한 버튼의 이미지 src 변경
				var imgId = 'img' + location; // 선택한 버튼의 id
				var spaceImg = document.getElementById(imgId); // 선택한 버튼의 img
				spaceImg.src = '/baobob/resources/images/chg/' + typeImg;
				
				table_index = index;
				spaceBtn.value = typeNum;
			} else {
				alert('입력하신 테이블 수를 초과했습니다.');
			}
		} else {
			alert('아이콘을 선택해주세요.');
		}
	} else {
		alert('빈 테이블을 선택해주세요.');
	}
}

// 매장 추가(정보 설정 AJAX)
function spaceTypeChange() {
	var item = document.querySelectorAll('.p_spaceBtn'); // 배열판의 버튼들

	// 매장 정보
	var x = document.getElementById('widthX').value; // col
	var y = document.getElementById('heightY').value; // row
	var name = document.getElementById('name').value; // name
	var tel = document.getElementById('tel').value; // tel

	// 배열판 버튼들의 아이콘 index 배열
	var array = new Array();
	item.forEach(function(space) {
		array.push(space.value);
	});
	var info = array.join(',');

	window.location = 'hostRestaurantAddPro?info=' + info + '&col=' + x + '&row=' + y + '&name=' + name + '&tel=' + tel;
}

// 예약 추가(정보 설정 AJAX)
function spaceTypeChange2(index) {
	var item = document.querySelectorAll('.p_spaceBtn'); // 배열판의 버튼들

	if (document.getElementById('member_id') && document.getElementById('count')) {
		// 입력한 테이블 수
		var table_count = document.getElementById('count').value / 4;
		
		if(count < table_count) {
			alert('입력하신 숫자만큼 테이블을 선택해주세요');
			return false;
		}
		
		// 예약할 아이디
		var member_id = document.getElementById('member_id').value
		
		if(member_id == "") {
			alert('예약할 아이디를 입력하세요');
			return false;
		}
	}
	
	// 매장 정보
	var x = document.getElementById('widthX').value; // col
	var y = document.getElementById('heightY').value; // row
	
	// 배열판 버튼들의 아이콘 index 배열
	var array = new Array();
	item.forEach(function(space) {
		array.push(space.value);
	});
	
	var info = array.join(',');
	
	if (document.getElementById('name') && document.getElementById('tel')) {
		var name = document.getElementById('name').value; // name
		var tel = document.getElementById('tel').value; // tel
		window.location = 'hostRestaurantModPro?info=' + info + '&col=' + x + '&row=' + y + '&name=' + name + '&tel=' + tel + '&index=' + index;
	} else {
		var date = document.getElementById('datepicker').value;
		var time = document.getElementById('timepicker').value;
		count = 0;
		window.location = 'hostReservAddPro?info=' + info + '&col=' + x + '&row=' + y + '&index=' + index.toString().substring(1, 2) + '&date=' + date + '&time=' + time + '&member_id=' + member_id + '&table_index=' + table_index;
	}
}

// 설정한 배열판이 있을 경우(매장)
function spaceBody(info, col, row) {
	var arr = info.split(',');
	var space = '';
	for (var y = 0; y < row; y += 1) {
		space += '<div class="p_div">';
		for (var x = 0; x < col; x += 1) {
			var index = x + (y * col);
			var location = x + '-' + y;
			var imgId = 'img' + location;
			var btnId = 'btn' + location;

			spaceType(arr[index]);

			space += '<button class="p_spaceBtn p_btn" ' + 'value="' + 
					arr[index] + '" ' + 'id="' + btnId + '" ' + 
					'onclick="spaceBtnChange(&#39;' + location + '&#39;)">' + 
					'<img class="p_img space_img" ' + 'id="' + imgId + '" ' + 
					'src="/baobob/resources/images/chg/' + typeImg + '">' + '</button>';
		}
		space += '</div>';
	}
	var spaceDiv = document.getElementById('spaceDiv');
	spaceDiv.innerHTML = space;
	typeImg = '';
}

// 설정한 배열판이 있을 경우
function spaceBody2(info, col, row) {
	var arr = info.split(',');
	var space = '';
	for (var y = 0; y < row; y += 1) {
		space += '<div class="p_div">';
		for (var x = 0; x < col; x += 1) {
			var index = x + (y * col);
			var location = x + '-' + y;
			var imgId = 'img' + location;
			var btnId = 'btn' + location;

			spaceType(arr[index]);

			space += '<button class="p_spaceBtn p_btn" ' + 'value="' + 
					arr[index] + '" ' + 'id="' + btnId + '" ' + 
					'onclick="spaceBtnChange2(&#39;' + location + '&#39;' + ',' + index + ')">' + 
					'<img class="p_img space_img" ' + 'id="' + imgId + '" ' + 
					'src="/baobob/resources/images/chg/' + typeImg + '">' + '</button>';
		}
		space += '</div>';
	}
	var spaceDiv = document.getElementById('spaceDiv');
	spaceDiv.innerHTML = space;
	typeImg = '';
}

// 선택된 날짜에 있는 예약 조회
function hostReservList() {
	var date = document.getElementById('datepicker').value;

	window.location = 'hostReservList?date=' + date + '&index=1';
}

// 선택한 식당, 날짜, 시간에 예약이 가능한 테이블 조회
function checkPosRestaurant(step) {
	var date = document.getElementById('datepicker').value;
	var time = document.getElementById('timepicker').value;
	var table_count = document.getElementById('count').value;
	
	if (date == "") {
		alert('날짜를 선택하세요');
		document.getElementById("datepicker").focus();
		return false;
	} else if (time == "") {
		alert('시간을 선택하세요');
		document.getElementById("timepicker").focus();
		return false;
	} else if (table_count == "") {
		alert('인원 수를 입력해주세요');
		document.getElementById("count").focus();
		return false;
	} else {
		window.location = 'checkPosRestaurant?date=' + date + '&count=' + table_count + '&time=' + time + '&index=' + step.toString().substring(1, 2);
	}
}

// 선택한 날짜에 있는 모든 예약 조회
function reservView(step) {
	var date = document.getElementById("datepicker").value;
	
	if (date == "") {
		alert('날짜를 선택하세요');
		document.getElementById("datepicker").focus();
		return false;
	}
	
	window.location = 'reservView?date=' + date + '&index=' + step.toString().substring(1, 2);
}

// 주문 삭제 처리
function orderDel() {
	var restaurant_schedule_index = document
			.getElementById("restaurant_schedule_index").value; // 예약 번호
	var table_Num = document.getElementById("table_index").value; // 주문할 테이블 번호
	var menu_Num = document.getElementById("menu_index").value; // 메뉴 번호
	var menu_Count = document.getElementById("menu_count").value; // 메뉴 수량

	if (table_Num == "") {
		alert('주문할 테이블 번호를 입력하세요');
		document.getElementById("table_index").focus();
		return false;
	} else if (menu_Num == "") {
		alert('메뉴 번호를 입력하세요');
		document.getElementById("menu_index").focus();
		return false;
	} else if (menu_Count == "") {
		alert('메뉴 수량을 입력하세요');
		document.getElementById("menu_count").focus();
		return false;
	}

	window.location = 'hostOrderDel?restaurant_schedule_index=' + restaurant_schedule_index + '&table_Num=' + table_Num + 
					'&menu_Num=' + menu_Num + '&menu_Count=' + menu_Count;
}

// 결제 처리
function payment() {
	var restaurant_schedule_index = document
			.getElementById("restaurant_schedule_index").value; // 예약 번호
	var table_Num = document.getElementById("table_number").value; // 결제할 테이블 번호
	
	if (table_Num == "") {
		alert('결제할 테이블 번호를 입력하세요.');
		document.getElementById("table_number").focus();
		return false;
	}

	var member_id = document.getElementById("member_id" + table_Num).value;	// 결제할 아이디
	var payValue = document.getElementById("payValue" + table_Num).value; // 결제할 금액
	var history_state = document.getElementById("history_state" + table_Num).value; // 결제를 했는가?
	var point = document.getElementById("point").value;
	
	if (member_id == "") {
		alert('결제할 아이디를 입력하세요.');
		document.getElementById("member_id").focus();
		return false;
	} else if (payValue == "0") {
		alert('결제할 주문 내역이 없습니다.');
		return false;
	} else if (history_state == "(결제 완료)") {
		alert('이미 결제한 테이블입니다.');
		return false;
	} else if (point == "") {
		point = 0;
	}
	
	window.location = 'hostPayment?restaurant_schedule_index=' + restaurant_schedule_index + '&table_Num=' + table_Num + '&member_id=' + member_id + '&payValue=' + payValue + '&point=' + point;
}

// 예약 삭제 처리
function reservDel() {
	var restaurant_schedule_index = document.getElementById("restaurant_schedule_index").value; // 예약 번호
	var table_Num = document.getElementById("table_num").value; // 결제할 테이블 번호

	if (table_Num == "") {
		alert('취소할 테이블 번호를 입력하세요.');
		document.getElementById("table_num").focus();
		return false;
	}

	var member_id = document.getElementById("member_id" + table_Num).value; // 예약 취소 할 아이디
	var payValue = document.getElementById("payValue" + table_Num).value; // 결제 할 금액이 있는지 확인하기 위한 변수
	var history_state = document.getElementById("history_state" + table_Num).value; // 결제를 했는지 확인하기 위한 변수

	if (payValue != "0") {
		alert('주문내역이 있어 취소하실 수 없습니다.');
		return false;
	} else if (history_state == "(결제 완료)") {
		alert('이미 결제한 테이블입니다.');
		return false;
	}
	
	window.location = 'hostReservDel?restaurant_schedule_index=' + restaurant_schedule_index + '&table_Num=' + table_Num + '&member_id=' + member_id;
}
