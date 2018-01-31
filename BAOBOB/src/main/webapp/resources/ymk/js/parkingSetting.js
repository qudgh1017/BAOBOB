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
	if(widthX && heightY) {
		loaderShow();
		
		for(var y = 0; y < heightY; y += 1) {
			space += '<div class="p_div">';
			for(var x = 0; x < widthX; x += 1) {
				var location = x + '-' + y;
				var imgId = 'img' + location;
				
				//배열판의 각 버튼
				space += '<button class="p_spaceBtn p_btn" ' 
						+ 'onclick="spaceBtnChange(&#39;' + location +'&#39;)">'
							+ '<img class="p_img space_img" '
							+ 'id="' + imgId + '" '
							+ 'data-type="0" ' 
							+ 'src="/baobob/resources/images/ymk/host_parking/icon_tmp.png">'
						+ '</button>';
				
				spaceDiv.innerHTML = space;
			}
			space += '</div>';
		}
		
		loaderHide();
	}
}

//배열판의 선택한 버튼 설정
function spaceBtnChange(location) {
	if(typeImg != '') { //아이콘 선택했을 경우, 선택한 버튼의 설정 변경
		//선택한 버튼의 이미지 src 변경
		var imgId = 'img' + location; //선택한 버튼의 id
		var space = document.getElementById(imgId); //선택한 버튼의 img
		space.src = '/baobob/resources/images/ymk/host_parking/' + typeImg;
		space.setAttribute('data-type', typeNum);
	} else {
		alert('아이콘을 선택해주세요.');
	}
}

//설정한 배열판이 있을 경우
function spaceBody(info, col, row) {
	var arr = info.split(',');

	var space = '';
	for(var y = 0; y < row; y += 1) {
		space += '<div class="p_div">';
		for(var x = 0; x < col; x += 1) {
			var index = x + (y * col);
			console.log(index + '번째 : ' + arr[index] + '/{' + x + ',' + y + '}');

			var location = x + '-' + y;
			var imgId = 'img' + location;
			var btnId = 'btn' + location;
			
			spaceType(arr[index]);
			
			space += '<button class="p_spaceBtn p_btn" ' 
				+ 'onclick="spaceBtnChange(&#39;' + location +'&#39;)">'
					+ '<img class="p_img space_img" '
					+ 'id="' + imgId + '" '
					+ 'data-type="' + arr[index] + '" ' 
					+ 'src="/baobob/resources/images/ymk/host_parking/' + typeImg+ '">'
				+ '</button>';
		}
		space += '</div>';
	}
	var spaceDiv = document.getElementById('spaceDiv');
	spaceDiv.innerHTML = space;
}

//드래그 설정
var moveFlg = false;
document.getElementById('spaceDiv').addEventListener('mousedown', function(e) { //배열판을 클릭하고 있으면
	e.preventDefault();
	moveFlg = true;
});
document.getElementById('spaceDiv').addEventListener('mousemove', function(e) { //마우스를 움직일 경우 다음 이벤트 실행
	e.preventDefault();
	
	if(e.target.id != '' && moveFlg) {
		var space = document.getElementById(e.target.id);
		space.src = '/baobob/resources/images/ymk/host_parking/' + typeImg;
		space.setAttribute('data-type', typeNum);
	}
});
document.getElementById('spaceDiv').addEventListener('mouseup', function(e) { //클릭 해제하면 이벤트 정지
	e.preventDefault();
	moveFlg = false;
});

//send전 입력창 입력 확인
function sendCheck() {
	//col, row 정보
	if(!document.getElementById('widthX').value) {
		alert('가로를 입력하세요');
		document.getElementById('widthX').focus();
		return false;
		
	} else if(!document.getElementById('heightY').value) {
		alert('세로를 입력하세요');
		document.getElementById('heightY').focus();
		return false;
	//요금 정보
	} else if(!document.getElementById('baseTime').value) {
		alert('기본 시간을 입력하세요');
		document.getElementById('baseTime').focus();
		return false;
		
	} else if(!document.getElementById('baseFee').value) {
		alert('기본 요금을 입력하세요');
		document.getElementById('baseFee').focus();
		return false;
		
	} else if(!document.getElementById('excTime').value) {
		alert('초과 시간을 입력하세요');
		document.getElementById('excTime').focus();
		return false;
		
	} else if(!document.getElementById('excFee').value) {
		alert('초과 요금을 입력하세요');
		document.getElementById('excFee').focus();
		return false;
		
	} else if(!document.getElementById('movieTime').value) {
		alert('영화 1건당 무료 주차 시간을 입력하세요');
		document.getElementById('movieTime').focus();
		return false;
		
	} else if(!document.getElementById('restTime').value) {
		alert('식사 1건당 무료 주차 시간을 입력하세요');
		document.getElementById('restTime').focus();
		return false;
	}
	return true;
}

//주차장 구역 정보 설정 AJAX
function spaceTypeChange() {
	if(sendCheck()) {
		var item = document.querySelectorAll('.p_img'); //배열판의 버튼들
		
		//col, row 정보
		var x = document.getElementById('widthX').value; //col
		var y = document.getElementById('heightY').value; //row
		
		//배열판 버튼들의 아이콘index 배열
		var array = new Array();
		item.forEach(function(space) {
			array.push(space.getAttribute('data-type'));
		});
		var info = array.join(',');
		
		//요금 정보
		var baseTime = document.getElementById('baseTime').value;
		var baseFee = document.getElementById('baseFee').value;
		var excTime = document.getElementById('excTime').value;
		var excFee = document.getElementById('excFee').value;
		var movieTime = document.getElementById('movieTime').value;
		var restTime = document.getElementById('restTime').value;
		
		var param =   'col=' + x + '&'
					+ 'row=' + y + '&'
					+ 'info=' + info + '&' 
					+ 'baseTime=' + baseTime + '&'
					+ 'baseFee=' + baseFee + '&'
					+ 'excTime=' + excTime + '&' 
					+ 'excFee=' + excFee + '&'
					+ 'movieTime=' + movieTime + '&'
					+ 'restTime=' + restTime;
		
		loaderShow();
		
		sendRequest(space_callback, 'hostParkingSettingChange', 'POST', param);
	}
}

function space_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) { 
			var date = httpRequest.responseText;
		
			console.log(date);
			if(date != 0) {
				loaderHide();
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

//로딩
function loaderShow() {
	document.getElementById('myLoader').style.display = 'block';
}

function loaderHide() {
	document.getElementById('myLoader').style.display = '';
}