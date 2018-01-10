/**
 * 
 */

var emptyName = "메뉴명을 입력하세요.";
var emptyContent = "메뉴 소개를 입력하세요.";
var emptyImg = "메뉴 이미지를 골라주세요.";
var emptyPrice = "메뉴 가격을 입력하세요.";

function addCheck() {
	if (!document.addform.name.value) {
		alert(emptyName);
		document.addform.name.focus();
		return false;
	} else if (!document.addform.content.value) {
		alert(emptyContent);
		document.addform.content.focus();
		return false;
	} else if (!document.addform.img.value) {
		alert(emptyImg);
		document.addform.img.focus();
		return false;
	} else if (!document.addform.price.value) {
		alert(emptyPrice);
		document.addform.price.focus();
		return false;
	}
}