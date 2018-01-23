/**
 * Host Parking State
 */

//커서 올라간 구역의 번호 띄우기
var moveNumView;
document.getElementById('spaceDiv').addEventListener('mousemove', function(e) {
	e.preventDefault();

	var idx = e.target.getAttribute('data-index');
	if(idx != null) {
		var moveNum = document.getElementById('moveNum');
		moveNumView = moveNum;
		
		moveNum.style.top = e.clientY + 20;
		moveNum.style.left = e.clientX + 20;
		moveNum.style.display = 'block';
		
		rowName(idx);
		moveNum.innerHTML = spaceName + (idx % column);
		spaceName = '';
	} else if(moveNumView != null) {
		moveNumView.style.display = 'none';
	}
});

//처음 화면 그리기
var column = '';
var stateTypeImg = '';
function parkingStatus(col, row, states) {
	var state = states.split(',');
	
	var space = '';
	for(var y = 0; y < row; y += 1) {
		space += '<div class="p_div">';
		for(x = 0; x < col; x += 1) {
			var location = x + '-' + y;
			var imgId = 'img' + location;
			
			var idx = x + y * col;
			spaceStateType(state[idx]);
			
			if(state[idx] != 2) {
				space += '<button class="p_spaceBtn p_btn" '
						+ 'onclick="spaceState(&#39;' + location + '&#39;)">'
							+ '<img class="p_img space_img" '
							+ 'id="' + imgId + '" '
							+ 'data-type="' + state[idx] + '" '
							+ 'data-index="' + idx + '"'
							+ 'src="/baobob/resources/images/ymk/host_parking/' + stateTypeImg + '">' 
						+ '</button>';
			} else {
				space += '<button class="p_spaceBtn p_btn">'
							+ '<img class="p_img space_img" '
							+ 'src="/baobob/resources/images/ymk/host_parking/' + stateTypeImg + '">' 
						+ '</button>';
			}
		}
		space += '</div>';
	}
	
	var spaceDiv = document.getElementById('spaceDiv');
	spaceDiv.innerHTML = space;
	
	column = col;
}

//구역 이미지 표시
function spaceStateType(type) {
	switch(type) {
	case '0': stateTypeImg = 'icon_false.png'; break;
	case '1': stateTypeImg = 'icon_true.png'; break;
	case '2': stateTypeImg = 'icon_tmp.png'; break;
	}
}

//배열판 클릭 시 클릭된 곳의 좌표
var clientX = '';
var clientY = '';
document.getElementById('spaceDiv').addEventListener('mousedown',function(e) {
    clientX = e.clientY;
    clientY = e.clientX;
});

//선택한 구역 정보 Ajax
var stateViewId = '';
function spaceState(location) {
	var arr = location.split('-');
	var idx = (arr[0] - 0) + arr[1] * column;

	if(stateViewId != '') {
		reset();
	}
	stateViewId = document.getElementById('img' + location);
	stateViewId.style.background = '#0069d9';
	
	rowName(idx);
	var spaceNumber = spaceName + (idx % column);
	spaceName = '';
	
	sendRequest(spaceState_callback, 'hostParkingSpaceState', 'GET', 'idx=' + idx + '&spaceNumber=' + spaceNumber);
}

function spaceState_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var data = httpRequest.responseText;
			var result = document.getElementById('result');
			
			//구역 정보 띄울 위치 지정, 보이기.
			result.style.top = clientX < 580 ? clientX + 20 : clientX -430;
			result.style.left = clientY < 780 ? clientY + 20 : clientY -500;
			result.style.display = 'block';
			result.innerHTML = data;

			console.log('완료');
		} else {
			console.log('오류 발생');
		}
	} else { 
		console.log('에러 상태 : ' + httpRequest.readyState);
	}
}

function reset() {
	document.getElementById('result').style.display = 'none';
	stateViewId.style.background = 'lightgray';
}

//구역 위치 이름
var spaceName = '';
function rowName(idx) {
	var xy = Math.floor(idx / column);

	var num1 = '', num2 = '';
	switch(Math.floor(xy / 26)) {
	case 1: num1 = 'A'; break;
	case 2: num1 = 'B'; break;
	case 3: num1 = 'C'; break;
	case 4: num1 = 'D'; break;
	case 5: num1 = 'E'; break;
	case 6: num1 = 'F'; break;
	case 7: num1 = 'G'; break;
	case 8: num1 = 'H'; break;
	case 9: num1 = 'I'; break;
	case 10: num1 = 'J'; break;
	case 11: num1 = 'K'; break;
	case 12: num1 = 'L'; break;
	case 13: num1 = 'M'; break;
	case 14: num1 = 'N'; break;
	case 15: num1 = 'O'; break;
	case 16: num1 = 'P'; break;
	case 17: num1 = 'Q'; break;
	case 18: num1 = 'R'; break;
	case 19: num1 = 'S'; break;
	case 20: num1 = 'T'; break;
	case 21: num1 = 'U'; break;
	case 22: num1 = 'V'; break;
	case 23: num1 = 'W'; break;
	case 24: num1 = 'X'; break;
	case 25: num1 = 'Y'; break;
	case 26: num1 = 'Z'; break;
	}
	
	switch(xy % 26) {
	case 0: num2= 'A'; break;
	case 1: num2= 'B'; break;
	case 2: num2= 'C'; break;
	case 3: num2= 'D'; break;
	case 4: num2= 'E'; break;
	case 5: num2= 'F'; break;
	case 6: num2= 'G'; break;
	case 7: num2= 'H'; break;
	case 8: num2= 'I'; break;
	case 9: num2= 'J'; break;
	case 10: num2= 'K'; break;
	case 11: num2= 'L'; break;
	case 12: num2= 'M'; break;
	case 13: num2= 'N'; break;
	case 14: num2= 'O'; break;
	case 15: num2= 'P'; break;
	case 16: num2= 'Q'; break;
	case 17: num2= 'R'; break;
	case 18: num2= 'S'; break;
	case 19: num2= 'T'; break;
	case 20: num2= 'U'; break;
	case 21: num2= 'V'; break;
	case 21: num2= 'W'; break;
	case 23: num2= 'X'; break;
	case 24: num2= 'Y'; break;
	case 25: num2= 'Z'; break;
	}
	
	spaceName = num1 + '' + num2;
}