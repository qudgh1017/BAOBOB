//리뷰 별점 설정
function showme(id) {
    document.getElementById('result').innerHTML = 'My vote : '+id.value;
    var r = ["0","0","0","0","0"];
    var s='';
    
    alert('showme r : ' + r);
    alert('showme id.value' + id.value);
    for(var i=0;i<5;i++) {
		if(id.value==(i+1).toString()) {
			var x = parseInt(r[i])+1;
		    r[i]=x.toString();
		}
		if(i==4) {s+=r[i];} else {s+=r[i]+',';}
			alert('showme s : ' + s);
		}
    	document.getElementById('res').value=s;
  }
  
//리뷰 별점 확인
function calc() {
    var x=document.getElementById('res').value.split(',');
    var r=0;
    var t=0;
    alert("calc x : " + x);

    for(var i=0;i<5;i++) {
      t+=parseInt(x[i]);
      r+=(parseInt(x[i])*(i+1));
    }
    var s=parseInt((r/t)*20);
    document.getElementById('bar').style.width=s.toString()+'%';
    document.getElementById('sta').innerHTML=s.toString()+'%';
  }

//리뷰 수정
function guest_review_modify(pageNum, review_index, restaurant_index){
	alert("review_index : " + review_index);
	//var count = document.guest_cart.count[countCnt].value;
	window.location="Restaurant_reviewModifyForm?pageNum="+pageNum+"&review_index="+review_index+"&restaurant_index="+restaurant_index;
}

//리뷰 삭제
function guest_review_delete(pageNum, review_index, restaurant_index){
	alert("review_index" + review_index, restaurant_index);

	//var count = document.guest_cart.count[countCnt].value;
	window.location="Restaurant_reviewDeleteForm?pageNum="+pageNum+"&review_index="+review_index+"&restaurant_index="+restaurant_index;
}




///////////////////////////////////////////////////////////////
//예약
///////////////////////////////////////////////////////////////
/**
 * 
 */

var delChk = "번 메뉴를 삭제하시겠습니까?";
var delChk2 = "님의 직원 정보를 삭제하시겠습니까?";
var delChk3 = "의 정보를 삭제하시겠습니까?\n삭제한 정보는 다시 되돌릴 수 없습니다.";
var addChk = " 님을 직원으로 등록하시겠습니까?";
var numChk = "이 입력란은 숫자만 입력 가능합니다.";




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

var typeNum = '0'; // 선택한 버튼 번호
var typeImg = ''; // 선택한 버튼 이미지
var cnt=0;	//인원수 

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

// 배열판의 선택한 버튼 설정
function spaceBtnChange(location) {
	//선택한 버튼의 value변경 (DB에 아이콘 index 넣기 위한값)
	var btnId = 'btn' + location;
	var spaceBtn = document.getElementById(btnId);
	var tableCnt = document.getElementById('tableCnt').value;
	
	
	if(spaceBtn.value==1){
		if (typeImg != '') { // 아이콘 선택했을 경우, 선택한 버튼의 설정 변경
			// 선택한 버튼의 이미지 src 변경
			var imgId = 'img' + location; // 선택한 버튼의 id
			var spaceImg = document.getElementById(imgId); // 선택한 버튼의 img
			spaceImg.src = '/baobob/resources/images/chg/' + typeImg;

			// 선택한 버튼의 value 변경(DB에 아이콘index 넣기 위한 값)
			//var btnId = 'btn' + location;
			//var spaceBtn = document.getElementById(btnId);
			
			spaceBtn.value = typeNum;
		} else {
			alert('아이콘을 선택해주세요.');
		}
	}else{
		alert('빈 테이블을 선택해 주세요.');
	}
	
}

//예약확인(정보 설정 AJAX)
function spaceTypeChange2() {
	var item = document.querySelectorAll('.p_spaceBtn'); // 배열판의 버튼들
	
	// 매장 정보
	var x = document.getElementById('widthX').value; // col
	var y = document.getElementById('heightY').value; // row
	var tableCnt = document.getElementById('tableCnt').value;//선택한 테이블 수량을 가져온다.
	//
	var restaurant_index = document.getElementById('restaurant_index').value;
	alert('식당 : ' + restaurant_index);

	// 배열판 버튼들의 아이콘 index 배열
	var array = new Array();
	item.forEach(function(space) {
		array.push(space.value);
	});
	var info = array.join(',');
	var date = document.getElementById('datepicker').value;
	var time = document.getElementById('timepicker').value;
	
	window.location = 'guestReservAddPro?info=' + info + '&col=' + x + '&row=' + y + '&restaurant_index='+ restaurant_index + '&date=' + date + '&time=' + time;
}

// 설정한 배열판이 있을 경우
function spaceBody(info, col, row) {
	var arr = info.split(',');

	var space = '';
	for (var y = 0; y < row; y += 1) {
		space += '<div class="p_div">';
		for (var x = 0; x < col; x += 1) {
			var index = x + (y * col);
			console.log(index + '번째 : ' + arr[index] + '/{' + x + ',' + y + '}');

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


// 선택한 식당, 날짜, 시간에 예약이 가능한 테이블 조회
function guestReserv_chkTable() {
	var date = document.getElementById('datepicker').value;
	var time = document.getElementById('timepicker').value;
	var restaurant_index = document.getElementById('restaurant_index').value;
	alert('식당 : ' + restaurant_index);
	if (document.getElementById('datepicker').value == "") {
		alert('날짜를 골라주세요!');
		return false;
	} else if (document.getElementById('timepicker').value == "") {
		alert('시간을 골라주세요!');
		return false;
	} else {
		window.location = 'guestReserv_chkTable?date=' + date + '&time=' + time + '&restaurant_index='+restaurant_index;
	}
}