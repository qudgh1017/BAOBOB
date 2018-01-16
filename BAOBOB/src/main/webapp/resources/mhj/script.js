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