/**
 * 
 */
var seatRow = ["A","B","C","D","E","F","G","H","I","J","k","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

var adultCnt = 0;
var teenagerCnt = 0;
var allCnt;
var maxChecked;   //선택가능한 체크박스 갯수
var totalChecked = 0; // 체크된 갯수 
var seatInfo="";
//var seat_index_arr = new Array();
var seat_checked_arr = new Array();
var j=0;
var i=0;

var theater_index=0;
var movie_index=0;
var theater_schedule_index=0;

//처음 movieTicket2페이지 켜졌을때 body onload
function personInitial(){
	document.getElementById("adult"+0).style.backgroundColor="black";
	document.getElementById("adult"+0).style.color="white";
	document.getElementById("teenager"+0).style.backgroundColor="black";
	document.getElementById("teenager"+0).style.color="white";
}
// 인원수 틀렸을 때 
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
	seat_checked_arr = new Array();
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
	//personChk();
	
	//청소년 사람수 체크시 초기화
	totalChecked = 0;
	seatInfo = "";
	i = 0;
	seat_checked_arr = new Array();
}

//총 사람 수 체크
function personChk(theater_index, movie_index, theater_schedule_index){

	allCnt = teenagerCnt + adultCnt;
	maxChecked = allCnt;
//	alert(allCnt);
	if(allCnt > 6){
		alert("7명 이상은 불가능합니다.\n다시 인원을 선택해주세요");
		personInitial2(); //원래 체크됬던 색 원상태로
		
		allCnt = 0;
		maxChecked = 0;
		teenagerCnt = 0;
		adultCnt = 0;
		personInitial(); //다시 일반,청소년 0 색칠
		
	}else if(allCnt > 0){
		//좌석도 뿌리기
		ajaxSeats();
	}
}

//좌석체크시 좌석 갯수 확인
function CountChecked(field) {
	maxChecked = allCnt;
//	alert("maxChecked---->"+maxChecked);
	var fv = field.value;
	
	if(maxChecked == 0){ // 총인원 0명일때 
		alert("인원수를 먼저 체크해주세요");
		return false;
	
    }else{// 작거나 같은 경우
    	
//    	alert("startAjax2 start");
    	if (document.getElementById(fv).style.backgroundColor!="black"){ //좌석 체크 했을때
    		
//    		alert("체크했엉");
//    		alert("id:fv color = " + document.getElementById(fv).style.backgroundColor);
        	totalChecked++;
//        	alert("totalChecked----->"+totalChecked);
        	if (totalChecked > maxChecked) { //체크된게 선택가능한 maxChecked보다 큰경우
        		alert(allCnt +"좌석만 선택 가능합니다.");
        		field.checked = false;
        		totalChecked -= 1;
        		return false;
        	}
        	
        	seat_checked_arr[j]= field.value;
        	j++;
        	seat_index = field.value;
//        	alert("seat_index:"+seat_index);
        	
        	//좌석정보 화면 ajax띄우기
        	ajaxSeatInfo(seat_checked_arr);
        	
        }else{//체크 취소할때
        	totalChecked--;
//        	alert("totalChecked"+totalChecked);
//        	alert("여기타니?");
        	for(var x = 0; x<j; x++){
        		if(seat_checked_arr[x]==field.value){
//        			delete seat_checked_arr[x]; // 값 삭제하겠다.
        			seat_checked_arr[x]=-1; //체크 취소하는 경우에 -1을 넣어줌 
//        			alert("삭제해쪙");
        		}
        	}
        	//좌석정보 화면 ajax띄우기
        	ajaxSeatInfo(seat_checked_arr);
        }
		//화면에 값 저장해서 movieTicket3() 호출시 다시 저장해주기
		document.all.seat_index_arr.value = seat_checked_arr;
    }
	
//	alert("startAjax2 start");
	// 좌석 뿌리기
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
		
		success: function(msg) {//한회씩 돌아가면서 정보 입력
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

//좌석도 뿌리기
function ajaxSeats(){
	$.ajax({
		url: 'reserveSeatInfo',
		type: 'GET',
		data: {
			allCnt, theater_index, movie_index, theater_schedule_index
		},
		success: function(msg) {
			$('#theaterSeat').html(msg);
			
	    	for(var x = 0; x<j; x++){
	    		if(seat_checked_arr[x]!=-1){
//		    		alert("x="+seat_checked_arr[x]);
		    		if(document.getElementById(seat_checked_arr[x]).style.backgroundColor=="black"){
//		    			alert("asdf");
		    			document.getElementById(seat_checked_arr[x]).style.backgroundColor="#EEEEEE";
		    			document.getElementById("btn"+seat_checked_arr[x]).style.color="black";
		    		}else{
		    			document.getElementById(seat_checked_arr[x]).style.backgroundColor="black";
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
//		alert(seat_index_arr);
		window.location.href="movieTicket3?adultCnt="+adultCnt+"&teenagerCnt="+teenagerCnt+"&theater_schedule_index="+theater_schedule_index+"&seat_index_arr="+seat_index_arr;
		
	}else{
		alert("인원수만큼 좌석 선택하셔야 다음페이지로 이동 가능합니다.");
	}
}


