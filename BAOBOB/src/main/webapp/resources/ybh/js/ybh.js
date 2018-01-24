var review_insert = "리뷰가 등록되었습니다.";
var review_modify = "리뷰가 수정되었습니다.";
var review_delete = "리뷰가 삭제되었습니다.";


var review_insert_error = "리뷰등록에 실패하였습니다. 다시 작성해주세요.";
var review_modify_error = "리뷰수정에 실패하였습니다. 다시 작성해주세요.";
var review_delete_error = "리뷰삭제에 실패하였습니다. 다시 작성해주세요.";

//sub창 띄었을때
function subAlert(msg){
	alert(msg);
	window.close();
	opener.location.reload();
	return false;
}

//로그인이 필요한 서비스일경우
function loginCheck(){
	window.open("loginCheck","loginCheck","top=50 left=100 width=400 height=300");
}
// 리뷰작성 (pro=1일때)
function reviewWrite(movie_index){
	window.open("movieReviewWrite?movie_index="+movie_index, "host_logout", "top=200 left=300 width=600 height=400");
}
//수정 입력폼 갔다가 처리(pro=2일때)
function reviewModify(movie_index, review_index){
	window.open("movieReviewModify?movie_index="+movie_index+"&review_index="+review_index, "host_logout", "top=200 left=300 width=600 height=400");
}
//삭제 바로 처리(pro=3일때)
function reviewDelete(movie_index, review_index){
	window.open("movieReviewPro?pro=3&movie_index="+movie_index+"&review_index="+review_index, "host_logout", "top=200 left=300 width=600 height=400");
}

//review 수정시 같은 사람인지 체크
function reviewModifyCheck(memId, member_id, movie_index, review_index){
	//같은사람이면
	if(memId == member_id){
		var confirmValue = confirm("수정시 리뷰를 새로 작성해야합니다. \n그래도 수정하시겠습니까?");
		if(confirmValue){//확인일경우(true)
			reviewModify(movie_index,review_index);
		}else{//취소일 경우(false)
			alert("취소되었습니다.");
		}
	}else{//다른 사람이 수정시
		alert("자신이 작성한 글만 수정이 가능합니다.");
	}
}
//review 삭제시 같은 사람인지 체크
function reviewDeleteCheck(memId, member_id, movie_index, review_index){
	//같은사람이면
	if(memId == member_id){
		var confirmValue = confirm("정말로 삭제하시겠습니까?");
		if(confirmValue){//확인일경우(true)
			reviewDelete(movie_index,review_index);
		}else{//취소일 경우(false)
			alert("취소되었습니다.");
		}
	}else{//다른 사람이 수정시
		alert("자신이 작성한 글만 삭제가 가능합니다.");
	}
}


//영화 movieTicekt 에서 div클릭시 css변경(여러개 왜 안됨...ㅠ)
//토글 써볼것!!!!!!!! 부트스트랩!!
/*function movieCSS(movie_index){
	
	var movie_tab = $('#movie'+movie_index);
	
	movie_tab.click(function(){
		
		movie_tab.css('color','white');
		movie_tab.css('background-color','black');
		movie_tab.css('font-weight','bold');
	});
}*/

function nonPlaying(){
	alert("상영예정작입니다.\n 상영중인 영화를 선택해주세요.");
	window.location.reload();
	
	return false;
}

//영화 movieTicekt
var flag = false;
var movie; //movie_index
var plusDay;//sysdate에 더할날짜

//영화/ 날짜 둘다 체크하면  ajax통신
function common(){
	if(!movie){
	}else if(!plusDay){
	}else{
		$.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
	
		$.ajax({
			url: 'dateResult',
			type: 'GET',
			data: {
				movie, plusDay
			},
			
			success: function(msg) {
				$('#resultSchedule').html(msg);	
				
			},				
			error: function() {
				alert('오류');
			}	
			
		});
	}
}
//영화버튼 클릭했을때
function clickMovie(movie_index){
	movie = movie_index;
	common();
	
	//영화정보 보여주기위해
	$.ajax({
		url: 'reserveMovieInfo',
		type: 'GET',
		data: {
			movie_index
		},
		
		success: function(msg) {
			$('#movieInfo').html(msg);					
		},				
		error: function() {
			alert('오류');
		}	
		
	});
	
}
	
//날짜 클릭 했을때
function clickDate(num){
	plusDay = num;
	common();
}

//스케줄 클릭 했을때
function clickSchedule(theater_schedule_index, movie_index){
	
	//예매창에 스케줄정보 보여주기위해
	$.ajax({
		url: 'reserveScheduleInfo',
		type: 'GET',
		data: {
			theater_schedule_index
		},
		
		success: function(msg) {
			$('#scheduleInfo').html(msg);					
		},				
		error: function() {
			alert('오류');
		}	
	});
	
	//다음페이지로 넘어가기 위해 정보 넘겨주는 역할
	$.ajax({
		url: 'nextSeatButton',
		type: 'GET',
		data: {
			theater_schedule_index, movie_index
		},
		
		success: function(msg) {
			$('#nextSeatButton').html(msg);					
		},				
		error: function() {
			alert('오류');
		}	
	});
}

//영화,스케줄선택페이지에서 다음페이지 선택했을 때 좌석페이지로 넘어가게
function ToSeat(movie_index, theater_schedule_index){
	window.location.href="movieTicket2?movie_index="+movie_index+"&theater_schedule_index="+theater_schedule_index;
}

//사용할 포인트 입력시(onchange)이며 ajax로 할인내역, 총할인가격, 실 계산가격 값 변경  
function point(member_point, field, totalSalePrice, movie_history_price){
	
	//member_point가 사용가능한 member_point
	//point는 사용할 point
	var point = field.value-0;
	
	if(member_point>=point){
		alert("사용가능합니다.");
		
		//point 값만 넘기기
		$.ajax({
			url : "pointUse?point=" + point,
			type : 'GET',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(pointSalePrice) { //pointSalePrice는 결국 사용할 값
				// 뿌려줄 장소
				var id_point = document.getElementById("point");
				var id_totalSalePrice = document.getElementById("totalSalePrice");
				var id_movie_history_price = document.getElementById("movie_history_price");
				
				var pointText = "";
				var pointText = "-" + pointSalePrice+"원";
				var totalSalePriceText = totalSalePrice-0 + pointSalePrice;//총 할인가격
				var movie_history_priceText = movie_history_price-0 - pointSalePrice;//실 계산 가격
				
				//값 뿌리기
				id_point.innerHTML = pointText;
				id_totalSalePrice.innerHTML = "-" + totalSalePriceText + "원";
				id_movie_history_price.innerHTML = movie_history_priceText + "원";
				
			},
			error : function() {
				alert('error');
			}
		})
	}else{//사용하고자 하는 point가 더 적을때
		alert("포인트가 부족합니다.");
	}
}

var card_num_msg="카드 번호를 입력해주세요";
var card_pwd_msg="카드 비밀번호를 입력해주세요";
var card_month_msg="카드 moth를 입력해주세요";
var card_year_msg="카드 year를 입력해주세요";

//카드 입력창 값 유무 확인
function cardInfoChk() {
	if(!document.reservationMovieForm.card_num1.value){
		alert(card_num_msg);
		document.all.card_num1.focus();
		return false;
	} else if(!document.reservationMovieForm.card_num2.value) {
		alert(card_num_msg);
		document.reservationMovieForm.card_num2.focus();
		return false;
	} else if(!document.reservationMovieForm.card_num3.value){
		alert(card_num_msg);
		document.reservationMovieForm.card_num3.focus();
		return false;
	} else if(!document.reservationMovieForm.card_num4.value) {
		alert(card_num_msg);
		document.reservationMovieForm.card_num4.focus();
		return false;
	} else if(!document.reservationMovieForm.card_pwd.value) {
		alert(card_pwd_msg);
		document.reservationMovieForm.card_pwd.focus();
		return false;
	} else if(!document.reservationMovieForm.card_month.value){
		alert(card_month_msg);
		document.reservationMovieForm.card_month.focus();
		return false;
	} else if(!document.reservationMovieForm.card_year.value) {
		alert(card_year_msg);
		document.reservationMovieForm.card_year.focus();
		return false;
	}
}
  


