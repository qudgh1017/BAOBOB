/**
 * 
 */
var seatRow = ["A","B","C","D","E","F","G","H","I","J","k","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

//예매- 좌석창 load와 동시 실행
function guestTheaterSeat(theater_index, movie_index, theater_schedule_index) {
	$.ajax({
		url : "reserveSeatInfo?theater_index=" + theater_index + "&movie_index=" + movie_index + "&theater_schedule_index=" + theater_schedule_index,
		type : 'GET',
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(seatInfo) {
			getScheduleSeatInfo(seatInfo.totalCol, seatInfo.totalRow, seatInfo.state);
		},
		error : function() {
			alert('error');
		}
	})
}

// 예매시 좌석도 뿌리기
function getScheduleSeatInfo(col, row, state){
	//seat라는 변수에 html에 뿌려줄 내용 누적
	var seat = "<input type='button' style='color:white; background-color:lightgray; background:rgba(0, 0, 0, 0.6); width:"+col*45+"px; height:25px;'  value='SCREEN'> <br><br>";
	
	for(var i = 0; i<row; i++){
		seat += seatRow[i]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		
		for(var j = 1; j<=col; j++){
			
			seat += "<button type='button'  style='margin:1px 1px; height:30; width:30;' id='"+seatRow[i]+j+"' name='seat"+seatRow[i]+j+"' value='"+state[(i)*col-1+j]+"'>" +
			"<img id='img"+seatRow[i]+j+"' style='width:30; height:30;' src='/baobob/resources/images/phc/icon/theater_blank.png'>" +
			"</button>";
			
			
		}
		
		seat += "<br>";
	}
	var theaterSeat = document.getElementById("theaterSeat");
	theaterSeat.innerHTML = seat;
	
	for(var i = 0; i<row; i++){
		for(var j = 1; j<=col; j++){
			var stateImg = '';
			
			switch(document.getElementById(seatRow[i]+j).value) {
			case '6': stateImg = 'theater_comp.png'; break;
			case '5': stateImg = 'theater_pink.png'; break;
			case '4': stateImg = 'theater_red.png'; break;
			case '3': stateImg = 'theater_green.png'; break;
			case '2': stateImg = 'theater_out.png'; break;
			case '1': stateImg = 'theater_in.png'; break;
			case '0': stateImg = 'theater_none.png'; break;
			}
			
			var spaceImg = document.getElementById("img"+seatRow[i]+j);
			spaceImg.src = "/baobob/resources/images/phc/icon/" + stateImg;
			
		}
	}
}

var adultCnt;
var teenagerCnt;

//일반 체크시 사람수
function adultChk(cnt){
	adultCnt = cnt;
	personChk();
	adultCnt = 0;
}

//청소년 체크시 사람수
function teenagerChk(cnt){
	teenagerCnt = cnt;
	personChk();
	teenagerCnt = 0;
}

//총 사람 수
function persconChk(){
	allCnt = teenagerCnt + adultCnt;
	alert(allCnt);
}

/*seat += "<button type='button'  style='margin:1px 1px; height:30; width:30;' id='"+seatRow[i]+j+"' name='seat"+seatRow[i]+j+"' value='"+state[(i)*col-1+j]+"'>" +
"<span style='postion:absolute;'>"+j+"</span>"+"<img id='img"+seatRow[i]+j+"' style='width:30; height:30;' src='/baobob/resources/images/phc/icon/theater_blank.png'>" +
"</button>";*/

/*"<input type='button'  style='margin:1px 1px; height:30; width:30; background-image: url('/baobob/resources/images/phc/icon/theater_blank.png')' id='"+seatRow[i]+j+"' " +
"name='seat"+seatRow[i]+j+"' value='"+j+"'>"*/