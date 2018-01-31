var name_msg = '이름을 입력하세요';
var id_msg = '아이디를 입력하세요';
var pwd_msg = '비밀번호를 입력하세요';
var pwdRe_msg = '비밀번호 확인을 입력하세요';
var pwd_check_msg = '비밀번호가 일치하지 않습니다';
var birth_msg = '생일을 입력하세요';
var sex_msg = '성별을 선택하세요';
var address_msg = '주소를 입력하세요';
var email_msg = '이메일을 입력하세요';
var tel_msg = '연락처를 입력하세요';

function errorAlert(msg) {
	alert(msg);
	window.history.back();
}

//아이디 중복 확인
function confirmId() {
	var id = document.joinForm.id.value;
	if(id) {
		var param = 'id=' + id;
		sendRequest(confirmId_callback, 'mainConfirmId', 'GET', param);
	}
}

function confirmId_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var date = httpRequest.responseText;
			
			console.log('성공');
			if(date == 0) {
				alert('사용할 수 있는 아이디입니다.');
			} else {
				alert('사용할 수 없는 아이디입니다.');
			}
			console.log(date);
		} else {
			console.log('에러 발생');
		}
	} else {
		console.log('에러 상태 : ' + httpRequest.readyState);
	}
}

//전화번호 형식 검사
function confirmTel() {
	var tel = document.joinForm.tel.value;
	var ref = /^(010|011)-[1-9]{1}[0-9]{3}-[1-9]{1}[0-9]{3}$/;
	
	if(!ref.test(tel)) {
		alert("올바른 번호를 입력하세요");
	}
}

//다음 API 주소찾기
function addressSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			var full = '';
			var extra = '';
			
			if(data.userSelectedType === 'R') { //도로명 주소
				if(data.bname !== '') { // 법정동명
					extra += data.bname;
				}
				if(data.buildingName !== '') { //건물명
					extra += (extra !== '' ? ',' + data.buildingName : data.buildingName);
				}

				full = data.roadAddress + (extra !== '' ? '(' + extra + ')' : '');
			} else { //지번 주소
				full = data.jibunAddress;
			}
			
			document.joinForm.address.value = full;
		}
	}).open();
}

function joinCheck() {
	var emailReg = /^(1|2)(9|0|1){1}[0-9]{2}(0|1){1}[0-9]{1}[0-3]{1}[0-9]{1}$/;

	if (!document.joinForm.name.value) {
		alert(name_msg);
		document.joinForm.name.focus();
		return false;
		
	} else if (!document.joinForm.id.value) {
		alert(id_msg);
		document.joinForm.id.focus();
		return false;

	} else if (!document.joinForm.pwd.value) {
		alert(pwd_msg);
		document.joinForm.pwd.focus();
		return false;
		
	} else if (!document.joinForm.pwdRe.value) {
		alert(pwdRe_msg);
		document.joinForm.pwdRe.focus();
		return false;
		
	} else if(document.joinForm.pwd.value != document.joinForm.pwdRe.value) {
		alert(pwd_check_msg);
		document.joinForm.pwdRe.focus();
		return false;
		
	} else if (!document.joinForm.email.value) {
		alert(email_msg);
		document.joinForm.email.focus();
		return false;
		
	} else if (!document.joinForm.sex.value) {
		alert(sex_msg);
		document.joinForm.sex.focus();
		return false;

	} else if (!document.joinForm.birth.value) {
		alert(birth_msg);
		document.joinForm.birth.focus();
		return false;

	} else if(!emailReg.test(document.joinForm.birth.value)) {
		alert('어느 시대 사람이신가요?');
		document.joinForm.birth.focus();
		return false;
		
	} else if (!document.joinForm.tel.value) {
		alert(tel_msg);
		document.joinForm.tel.focus();
		return false;
		
	} else if (!document.joinForm.address.value) {
		alert(address_msg);
		document.joinForm.address.focus();
		return false;
	}
	
	//로딩
	document.getElementById('myLoader').style.display = 'block';
}

//성별 선택
function sexBtnChange(sex) {
	var sexBtn = document.getElementsByClassName('sexBtn');
	if(sex == 'M') {
		sexBtn[0].style.backgroundColor = '#007bff';
		sexBtn[0].style.color = 'white';
		
		sexBtn[1].style.backgroundColor = 'white';
		sexBtn[1].style.color = '#495057';
		
		document.joinForm.sex.value='남';
	} else if(sex == 'Y') {
		sexBtn[0].style.backgroundColor = 'white';
		sexBtn[0].style.color = '#495057';
		
		sexBtn[1].style.backgroundColor = '#007bff';
		sexBtn[1].style.color = 'white';
		
		document.joinForm.sex.value='여';
	}
}

//회원가입 페이지의 로그인 페이지로 가기
function goMainSignIn() {
	if(confirm('작성을 취소하시겠습니까?')) {
		window.location = 'mainSignIn';
	}
}

//로그인 입력창 값 유무 확인
function signInChk() {
	if(!document.mainSignInForm.id.value){
		alert(id_msg);
		document.mainSignInForm.id.focus();
		return false;
	} else if(!document.mainSignInForm.pwd.value) {
		alert(pwd_msg);
		document.mainSignInForm.pwd.focus();
		return false;
	}
}

function mainPwdEmail() {
	var email = document.getElementById('email').value;
	window.location = 'mainPwdEmail?email=' + email;
}