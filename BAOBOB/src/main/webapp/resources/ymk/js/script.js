/**
 * 
 */
var typeNum = '0';
var typeImg = '';

function spaceType(type) {
	typeNum = type;
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


function spaceDivChange() {
	var widthX = document.getElementById('widthX').value;
	var heightY = document.getElementById('heightY').value;
	
	var spaceDiv = document.getElementById('spaceDiv');
	
	var space = '';
	for(var y = 0; y < heightY; y += 1) {
		for(var x = 0; x < widthX; x += 1) {
			var location = x + '-' + y;
			var spaceId = 'id' + location;
			var spaceBtnId = 'btn' + location;
			
			space += '<button class="p_spaceBtn p_btn" ' 
					+ 'value="' + typeNum + '" ' 
					+ 'id="' + spaceBtnId + '" '
					+ 'onclick="spaceBtnChange(&#39;' + location +'&#39;)">'
						+ '<img class="p_img space_img" '
						+ 'id="' + spaceId + '" '
						+ 'src="/baobob/resources/images/ymk/host_parking/icon_tmp.png">'
					+ '</button>';
		}
		space += '<br>';
	}
	spaceDiv.innerHTML = space;
}

function spaceBtnChange(location) {
	if(typeImg != '') {
		var spaceId = 'id' + location;
		var spaceImg = document.getElementById(spaceId);
		spaceImg.src = '/baobob/resources/images/ymk/host_parking/' + typeImg;
		
		var spaceBtnId = 'btn' + location;
		var spaceBtn = document.getElementById(spaceBtnId);
		spaceBtn.value = typeNum;
	} else {
		alert('아이콘을 선택해주세요.');
	}
}

//주차장 구역 정보 설정 AJAX
function spaceTypeChange() {
	var item = document.querySelectorAll('.p_spaceBtn');
	
	var x = document.getElementById('widthX').value;
	var y = document.getElementById('heightY').value;
	
	var array = new Array();
	item.forEach(function(space) {
		array.push(space.value);
	});
	
	var param =   'col=' + x + '&'
				+ 'row=' + y + '&'
				+ 'info=' + array;
	
	sendRequest(space_callback, 'hostParkingSettingChange', 'POST', param);
}

function space_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) { 
			var date = httpRequest.responseText;
			
		} else {
			console.log('에러 발생');
		}
	} else {
		console.log('에러 상태 : ' + httpRequest.readySate);
	}
}

function parkingSetting() {
	/*var xy = location.split('-');
	var x = xy[0] * 3;
	var y = xy[1];
	var index = (x - 0) + (y - 0) + 1;*/
}