/**
 * 
 */

var emptyName = "메뉴명을 입력하세요.";
var emptyContent = "메뉴 소개를 입력하세요.";
var emptyImg = "메뉴 이미지를 골라주세요.";
var emptyPrice = "메뉴 가격을 입력하세요.";
var delChk = "번 메뉴를 삭제하시겠습니까?"

function add_mod_Check() {
	if (!document.add_mod_form.name.value) {
		alert(emptyName);
		document.add_mod_form.name.focus();
		return false;
	} else if (!document.add_mod_form.content.value) {
		alert(emptyContent);
		document.add_mod_form.content.focus();
		return false;
	} else if (!document.add_mod_form.img.value) {
		alert(emptyImg);
		document.add_mod_form.img.focus();
		return false;
	} else if (!document.add_mod_form.price.value) {
		alert(emptyPrice);
		document.add_mod_form.price.focus();
		return false;
	}
}

function delCheck(index) {
	var del = confirm(index + delChk);

	if (del) {
		window.location = 'hostMenuDel?index=' + index;
	}
}
