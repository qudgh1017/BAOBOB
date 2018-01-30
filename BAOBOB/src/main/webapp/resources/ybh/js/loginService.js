//로그인이 필요한 서비스(loginCheck.jsp에서만 사용)

//확인 클릭시
function mainSignIn(){
	window.close();
	opener.location.href="mainSignIn"
}

//취소 클릭시
function cancel(movie_index){
	window.close();
}