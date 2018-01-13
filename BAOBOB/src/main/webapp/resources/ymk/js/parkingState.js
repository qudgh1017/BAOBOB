/**
 * Host Parking State
 */
var moveNumView;
document.getElementById('spaceDiv').addEventListener('mousemove', function(e) {
	e.preventDefault();

	var idx = e.target.getAttribute('data-index');
	if(idx != null) {
		var moveNum = document.getElementById('moveNum');
		moveNumView = moveNum;
		
		moveNum.style.display = 'block';
		moveNum.innerHTML = idx;
	} else if(moveNumView != null) {
		moveNumView.style.display = 'none';
	}
});

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
			
			space += '<button class="p_spaceBtn p_btn" '
					+ 'onclick="spaceState(&#39;' + location + '&#39;)">'
						+ '<img class="p_img space_img" '
						+ 'id="' + imgId + '" '
						+ 'data-type="' + state[idx] + '" '
						+ 'data-index="' + idx + '"'
						+ 'src="/baobob/resources/images/ymk/host_parking/' + stateTypeImg + '">' 
					+ '</button>';
		}
		space += '</div>';
	}
	
	var spaceDiv = document.getElementById('spaceDiv');
	spaceDiv.innerHTML = space;
	
	column = col;
}

function spaceStateType(type) {
	switch(type) {
	case '0': stateTypeImg = 'icon_true.png'; break;
	case '1': stateTypeImg = 'icon_false.png'; break;
	}
}

var clientX = '';
var clientY = '';
document.getElementById('spaceDiv').addEventListener('mousedown',function(e) {
/*	console.log('offsetX: ' + (e.offsetX == undefined ? e.layerX : e.offsetX));
	console.log('offsetY: ' + (e.offsetY == undefined ? e.layerY : e.offsetY));
	console.log('screenX: ' + e.screenX);
	console.log('screenY : ' + e.screenY);
	console.log('clientX : ' + e.clientX);
	console.log('clientY : ' + e.clientY);
	console.log('pageX : ' + e.pageX);
	console.log('pageY : ' + e.pageY);
*/   
    clientX = e.clientY;
    clientY = e.clientX;
});

var stateViewId = '';
function spaceState(location) {
	var arr = location.split('-');
	var idx = (arr[0] - 0) + arr[1] * column;
	console.log(idx);

	if(stateViewId != '') {
		reset();
	}
	stateViewId = document.getElementById('img' + location);
	stateViewId.style.background = '#0069d9';
	
	sendRequest(spaceState_callback, 'hostParkingSpaceState', 'GET', 'idx=' + idx);
}

function spaceState_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var data = httpRequest.responseText;
			var result = document.getElementById('result');
			
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
