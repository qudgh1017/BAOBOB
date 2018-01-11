/**
 * Host Parking Setting - 주차장 관리
 */
var pageNum = 0;
function ajax(url) {
	sendRequest(view_callback, url, 'GET', '');
}
function view_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var view = httpRequest.responseText;
			console.log(view);
			console.log('완료');
			pageNum = 1;
			
				var result = document.getElementById('content-wrapper');
				result.innerHTML = view;
				console.log('*********');
			
		} else {
			console.log('오류 발생');
		}
	} else {
		console.log('에러 상태 : ' + httpRequest.reayState);
	}
}

var typeNum = '0';	//선택한 버튼 번호
var typeImg = '';	//선택한 버튼 이미지

//type에 따라 버튼 이미지 설정
function spaceType(type) {
	typeNum = type;	//선택한 버튼 번호 저장
	switch(typeNum) {
	case '9': typeImg = 'icon_enter.png'; break;
	case '8': typeImg = 'icon_exit.png'; break;
	case '4': typeImg = 'icon_default.png'; break;
	case '3': typeImg = 'icon_desabled.png'; break;
	case '2': typeImg = 'icon_pregnant_woman.png'; break;
	case '1': typeImg = 'icon_electic_car.png'; break;
	case '0': typeImg = 'icon_tmp.png'; break;
	}
}


//가로, 세로 변할 경우 배열판 설정
function spaceDivChange() {
	var widthX = document.getElementById('widthX').value;
	var heightY = document.getElementById('heightY').value;
	
	var spaceDiv = document.getElementById('spaceDiv'); //출력 위치
	
	var space = '';
	for(var y = 0; y < heightY; y += 1) {
		for(var x = 0; x < widthX; x += 1) {
			var location = x + '-' + y;
			var imgId = 'img' + location;
			var btnId = 'btn' + location;	//버튼 구별하기 위한 id
			
			//배열판의 각 버튼
			space += '<button class="p_spaceBtn p_btn" ' 
					+ 'value="0" ' 
					+ 'id="' + btnId + '" '
					+ 'onclick="spaceBtnChange(&#39;' + location +'&#39;)">'
						+ '<img class="p_img space_img" '
						+ 'id="' + imgId + '" '
						+ 'src="/baobob/resources/images/ymk/host_parking/icon_tmp.png">'
					+ '</button>';
		}
		space += '<br>';
	}
	spaceDiv.innerHTML = space;
}

//배열판의 선택한 버튼 설정
function spaceBtnChange(location) {
	if(typeImg != '') { //아이콘 선택했을 경우, 선택한 버튼의 설정 변경
		//선택한 버튼의 이미지 src 변경
		var imgId = 'img' + location; //선택한 버튼의 id
		var spaceImg = document.getElementById(imgId); //선택한 버튼의 img
		spaceImg.src = '/baobob/resources/images/ymk/host_parking/' + typeImg;

		//선택한 버튼의 value 변경(DB에 아이콘index 넣기 위한 값)
		var btnId = 'btn' + location;
		var spaceBtn = document.getElementById(btnId);
		spaceBtn.value = typeNum;
	} else {
		alert('아이콘을 선택해주세요.');
	}
}

//주차장 구역 정보 설정 AJAX
function spaceTypeChange() {
	var item = document.querySelectorAll('.p_spaceBtn'); //배열판의 버튼들
	
	var x = document.getElementById('widthX').value; //col
	var y = document.getElementById('heightY').value; //row
	
	//배열판 버튼들의 아이콘index 배열
	var array = new Array();
	item.forEach(function(space) {
		array.push(space.value);
	});
	var info = array.join(',');
	console.log(info);
	
	var param =   'col=' + x + '&'
				+ 'row=' + y + '&'
				+ 'info=' + info;
	
	sendRequest(space_callback, 'hostParkingSettingChange', 'POST', param);
}

function space_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) { 
			var date = httpRequest.responseText;
		
			if(date != 0) {
				alert("정보가 등록되었습니다.");
			}
			console.log('완료');
		} else {
			console.log('에러 발생');
		}
	} else {
		console.log('에러 상태 : ' + httpRequest.readySate);
	}
}

//설정한 배열판이 있을 경우
function spaceBody(info, col, row) {
	var arr = info.split(',');
	
	var space = '';
	for(var y = 0; y < row; y += 1) {
		for(var x = 0; x < col; x += 1) {
			var index = x + (y * col);
			console.log(index + '번째 : ' + arr[index] + '/{' + x + ',' + y + '}');

			var location = x + '-' + y;
			var imgId = 'img' + location;
			var btnId = 'btn' + location;
			
			spaceType(arr[index]);
			
			space += '<button class="p_spaceBtn p_btn" ' 
				+ 'value="' + arr[index] + '" ' 
				+ 'id="' + btnId + '" '
				+ 'onclick="spaceBtnChange(&#39;' + location +'&#39;)">'
					+ '<img class="p_img space_img" '
					+ 'id="' + imgId + '" '
					+ 'src="/baobob/resources/images/ymk/host_parking/' + typeImg+ '">'
				+ '</button>';
		}
		space += '<br>';
	}
	var spaceDiv = document.getElementById('spaceDiv');
	spaceDiv.innerHTML = space;
	
	document.getElementById('widthX').value = col;
	document.getElementById('heightY').value = row;
}




/**
 * 
 * 
 */
stateTypeImg = '';
function parkingState(col, row) {
	var space = '';
	
	for(var y = 0; y < row; y += 1) {
		for(x = 0; x < col; x += 1) {
			var location = col + '-' + row;
			var imgId = 'img' + location;
			var btnId = 'btn' + location;
			
			spaceStateType();
			
			space += '<button class="p_spaceBtn p_btn" '
					+ 'id="' + btnId +'" '
					+ 'onclick="spaceBtnChange(&#39;' + location +'&#39;)">'
						+ '<img class="p_img space_img" '
						+ 'id="' + imgId + '" '
						+ 'src="/baobob/resources/images/ymk/host_parking/' + stateTypeImg + '">' 
					+ '</button>';
		}
		space += '<br>';
	}
}















//Request 받기
function Request() {
	var requestParam = '';
	
	this.getParameter = function(param) {
		var url = unescape(location.href);
		
		var paramArr = (url.substring(url.indexOf('?') + 1, url.length)).split('&');
		
		for(var i = 0; i < paramArr.length; i += 1) {
			var tmp = paramArr[1].split('=');
			if(tmp[0].toUpperCase() == param.toUpperCase()) {
				requestParam = paramArr[i].split('=')[1];
				break;
			}
		}
		requestParam = paramArr[1];
		return requestParam;
	}
}
function requestEx() {
	var request = new Request();
	request.getParameter('pSpace');
}