//영화-예매 movieTicke2에서 쓰는 좌석 관련 javascript

var seatRow = ["A","B","C","D","E","F","G","H","I","J","k","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

var adultCnt = 0;
var teenagerCnt = 0;
var allCnt;
var maxChecked;   //선택가능한 체크박스 갯수
var totalChecked = 0; // 체크된 갯수 
var seatInfo="";
var seat_checked_arr = new Array();
var j=0;
var i=0;

var theater_index=0;
var movie_index=0;
var theater_schedule_index=0;

//처음 movieTicket2 페이지 켜졌을때 body onload
function personInitial(){
	document.getElementById("adult"+0).style.backgroundColor="black";
	document.getElementById("adult"+0).style.color="white";
	document.getElementById("teenager"+0).style.backgroundColor="black";
	document.getElementById("teenager"+0).style.color="white";
}
// 인원수 틀렸을 때 (초기화)
function personInitial2(){
	document.getElementById("adult"+adultCnt).style.backgroundColor="#DDDDDD";
	document.getElementById("adult"+adultCnt).style.color="black";
	document.getElementById("teenager"+teenagerCnt).style.backgroundColor="#DDDDDD";
	document.getElementById("teenager"+teenagerCnt).style.color="black";
	
}

//일반 체크시 사람수
function adultChk(theater_index, movie_index, theater_schedule_index, cnt){
	this.theater_index=theater_index;
	this.movie_index=movie_index;
	this.theater_schedule_index=theater_schedule_index;
	
	for(var x=0; x<=8; x++){ //처음 색깔 다주기
		document.getElementById("adult"+x).style.backgroundColor="#DDDDDD";
		document.getElementById("adult"+x).style.color="black";
	}
	//해당 cnt 선택시
	document.getElementById("adult"+cnt).style.backgroundColor="black";
	document.getElementById("adult"+cnt).style.color="white";
	
	adultCnt = cnt-0;
	personChk(theater_index, movie_index, theater_schedule_index);
	
	//일반 사람수 체크시 초기화
	totalChecked = 0;
	seatInfo = "";
	i = 0;
	for(var x = 0; x<seat_checked_arr.length; x++){
		seat_checked_arr[x]=-1; //체크 취소하는 경우에 -1을 넣어줌 
	}
}

//청소년 체크시 사람수
function teenagerChk(theater_index, movie_index, theater_schedule_index, cnt){
	this.theater_index=theater_index;
	this.movie_index=movie_index;
	this.theater_schedule_index=theater_schedule_index;
	
	for(var x=0; x<=8; x++){
		document.getElementById("teenager"+x).style.backgroundColor="#DDDDDD";
		document.getElementById("teenager"+x).style.color="black";
	}
	
	document.getElementById("teenager"+cnt).style.backgroundColor="black";
	document.getElementById("teenager"+cnt).style.color="white";
	
	teenagerCnt = cnt-0;
	personChk(theater_index, movie_index, theater_schedule_index);
	
	//청소년 사람수 체크시 초기화
	totalChecked = 0;
	seatInfo = "";
	i = 0;
	for(var x = 0; x<seat_checked_arr.length; x++){
		seat_checked_arr[x]=-1; //체크 취소하는 경우에 -1을 넣어줌 
	}
}

//총 사람 수 체크
function personChk(theater_index, movie_index, theater_schedule_index){

	allCnt = teenagerCnt + adultCnt;
	maxChecked = allCnt;
	if(allCnt > 6){
		alert("7명 이상은 불가능합니다.\n다시 인원을 선택해주세요");
		personInitial2(); //원래 체크됬던 색 원상태로
		
		allCnt = 0;
		maxChecked = 0;
		teenagerCnt = 0;
		adultCnt = 0;
		personInitial(); //다시 일반,청소년 0명 색칠
		
	}else if(allCnt > 0){
		//좌석도 뿌리기
		ajaxSeats();
	}
}

//좌석체크시 좌석 갯수 확인
function CountChecked(field) {
	maxChecked = allCnt;
	var fv = field.value;//선택한 버튼의 값 저장
	
	if(maxChecked == 0){ // 총인원 0명일때 
		alert("인원수를 먼저 체크해주세요");
		return false;
	
    }else{// 작거나 같은 경우
    	if (document.getElementById("btn"+fv).style.backgroundColor!="black"){ //좌석 체크하면
        	totalChecked++;
        	if (totalChecked > maxChecked) { //체크된게 선택가능한 maxChecked보다 큰경우
        		alert(allCnt +"좌석만 선택 가능합니다.");
        		//field.checked = false; //선택한거 취소
        		totalChecked -= 1;
        		return false;
        	}
        	//선택한 좌석 값 누적
        	seat_checked_arr[j]= field.value;
        	j++;
        	seat_index = field.value;
        	
        	//좌석정보 화면 ajax띄우기
        	ajaxSeatInfo(seat_checked_arr);
        	
        }else{//체크 취소할때
        	totalChecked--;
        	for(var x = 0; x<j; x++){
        		if(seat_checked_arr[x]==field.value){
//        			delete seat_checked_arr[x]; // 값 삭제하겠다.(삭제한 경우 해당 위치의 값에 null값이 들어가서 찾기 더 어려움.)
        			seat_checked_arr[x]=-1; //체크 취소하는 경우에 -1을 넣어줌 (따라서 밑에 경우 이용)
        		}
        	}
        	//좌석정보창 ajax띄우기(검은 창)
        	ajaxSeatInfo(seat_checked_arr);
        }
		//화면에 값 저장해서 movieTicket3() 호출시 다시 저장해주기
		document.all.seat_index_arr.value = seat_checked_arr;
    }
	//좌석도 뿌리기
	ajaxSeats();
}

// 밑에 좌석 정보 창에 띄울 내용
function ajaxSeatInfo(seat_checked_arr){
	
	$.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
	
	$.ajax({
		url: 'selectSeatInfo',
		type: 'GET',
		data: {
			seat_checked_arr
		},
		success: function(msg) {//배열에 담긴 값 selectSeatInfo 에서 바꿔서 누적
			seatInfo = "<br><div style='font-size:13px; font-weight:bold;'>인원&nbsp;일반:"+adultCnt+"명, 청소년:"+teenagerCnt+"명<br><br>좌석번호&nbsp;";
			seatInfo += msg;
			seatInfo+="</div>"
			$('#seatInfo').html(seatInfo);	
		},				
		error: function() {
			alert('오류1');
		}	
	});
}

//좌석도 뿌리기(좌석 선택 및 전체 좌석도)
function ajaxSeats(){
	$.ajax({
		url: 'reserveSeatInfo',
		type: 'GET',
		data: {
			allCnt, theater_index, movie_index, theater_schedule_index
		},
		success: function(msg) {
			$('#theaterSeat').html(msg);//전체 좌석도 화면에 뿌려주기
			
	    	for(var x = 0; x<j; x++){//좌석도의 css를 변경
	    		if(seat_checked_arr[x]!=-1){//체크할 때
		    		if(document.getElementById("btn"+seat_checked_arr[x]).style.backgroundColor=="black"){//검은색이면 체크취소상태의 css로
		    			document.getElementById("btn"+seat_checked_arr[x]).style.backgroundColor="#EEEEEE";
		    			document.getElementById("btn"+seat_checked_arr[x]).style.color="black";
		    		}else{//아닌 경우 체크한 상태의 css로 변경
		    			document.getElementById("btn"+seat_checked_arr[x]).style.backgroundColor="black";
		    			document.getElementById("btn"+seat_checked_arr[x]).style.color="white";
		    		}
	    		}
	    	}
		},				
		error: function() {
			alert('오류2');
		}	
	});
}

//좌석페이지에서 다음페이지 선택했을 때 결제페이지로 넘어가게
function movieTicket3(theater_schedule_index){
	
	//사람수만큼 좌석 선택했을때만 넘어가게
	if(totalChecked == maxChecked){
		//화면에 저장된 seat_index_arr값들 합쳐진것 저장(배열이 아닌 String값으로 나열되서 저장됨.)
		var seat_index_arr = document.all.seat_index_arr.value;
		window.location.href="movieTicket3?adultCnt="+adultCnt+"&teenagerCnt="+teenagerCnt+"&theater_schedule_index="+theater_schedule_index+"&seat_index_arr="+seat_index_arr;
		
	}else{
		alert("인원수만큼 좌석 선택하셔야 다음페이지로 이동 가능합니다.");
	}
}


