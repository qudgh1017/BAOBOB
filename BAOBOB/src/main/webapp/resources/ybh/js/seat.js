/**
 * 
 */
var seatRow = ["A","B","C","D","E","F","G","H","I","J","k","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

//예매- 좌석창 load와 동시 실행
function guestTheaterSeat(theater_index, movie_index, theater_schedule_index) {
	$.ajax({
		url : "seatInfo?theater_index=" + theater_index + "&movie_index=" + movie_index + "&theater_schedule_index=" + theater_schedule_index,
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
			
			seat += "<button type='button'  style='margin:1px 1px; height:35; width:35;' id='"+seatRow[i]+j+"' name='seat"+seatRow[i]+j+"' value='"+state[(i)*col-1+j]+"'>" +
			"<img id='img"+seatRow[i]+j+"' style='width:35; height:35;' src='/baobob/resources/images/phc/icon/theater_blank.png'>" +
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

var adultCnt = 0;
var teenagerCnt = 0;
var allCnt;
var maxChecked;   //선택가능한 체크박스 갯수
var totalChecked = 0; // 체크된 갯수 

//일반 체크시 사람수
function adultChk(theater_index, movie_index, theater_schedule_index, cnt){
	adultCnt = cnt-0;
	personChk(theater_index, movie_index, theater_schedule_index);
	totalChecked = 0;
	seatInfo = "";
	i = 0;
	seat_index_arr = new Array();
}

//청소년 체크시 사람수
function teenagerChk(theater_index, movie_index, theater_schedule_index, cnt){
	teenagerCnt = cnt-0;
	personChk(theater_index, movie_index, theater_schedule_index);
	totalChecked = 0;
	seatInfo = "";
	i = 0;
	seat_index_arr = new Array();
}

//총 사람 수
function personChk(theater_index, movie_index, theater_schedule_index){
	allCnt = teenagerCnt + adultCnt;
	maxChecked = allCnt;
	alert(allCnt);
	if(allCnt > 6){
		alert("7명 이상은 불가능합니다.");
	}else{
		$.ajax({
			url: 'reserveSeatInfo',
			type: 'GET',
			data: {
				allCnt, theater_index, movie_index, theater_schedule_index
			},
			
			success: function(msg) {
				$('#theaterSeat').html(msg);					
			},				
			error: function() {
				alert('오류');
			}	
		});
	}
}


var seatInfo="";
var seat_index_arr = new Array();
var i=0;
/*var total_seat_index[] = new array();*/
function CountChecked(field) {
	//maxChecked = allCnt;
	var size = maxChecked;
	alert("maxChecked:"+maxChecked);
	if (field.checked){
    	totalChecked += 1;
    	alert("totalChecked"+totalChecked);
    }
    else{
    	totalChecked -= 1;
    }

    if (totalChecked > maxChecked) {
        alert (allCnt +"좌석만 선택 가능합니다.");
        field.checked = false;
        totalChecked -= 1;
    }else{
    	seat_index = field.value;
    	alert("seat_index:"+seat_index);
    	$.ajax({
			url: 'selectSeatInfo',
			type: 'GET',
			data: {
				seat_index
			},
			
			success: function(msg) {
				if(totalChecked == 1){
					seatInfo += "좌석정보:"
				}
				seatInfo += msg;
				if(totalChecked != maxChecked){
					seatInfo += ", "
				}
				$('#seatInfo').html(seatInfo);	
				
			},				
			error: function() {
				alert('오류');
			}	
		});
    	
		seat_index_arr[i]= field.value;
		i++;
		alert(seat_index_arr);
		
	   	if(totalChecked == maxChecked){
	   		alert("adultCnt:"+adultCnt+"\n teenagerCnt:"+teenagerCnt);
	   		
	   		$.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
	        
			$.ajax({
				url: 'nextDealButton',
				type: 'GET',
				data: {
					adultCnt, teenagerCnt, seat_index_arr
				},
				
				success: function(msg) {
					$('#nextDealButton').html(msg);					
				},				
				error: function() {
					alert('오류');
				}			
			});	
	   	}
    }
    
    
}

function movieTicket3(){
	
	
}


