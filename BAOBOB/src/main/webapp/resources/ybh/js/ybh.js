var review_msg = "리뷰가 등록되었습니다.";


var review_error = "리뷰작성에 실패하였습니다. 다시 작성해주세요.";

//sub창 띄었을때
function subAlert(msg){
	alert(msg);
	window.close();
	opener.location.reload();
	return false;
}