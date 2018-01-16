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