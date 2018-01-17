
//member
//=============================================================================
var msg_id = "아이디를 입력하세요";
var msg_step = "등급을 선택하세요."
var msg_pwd = "비밀번호를 입력하세요";
var msg_repwd = "비밀번호를 한 번 더 입력하세요.";
var msg_pwdChk = "비밀번호가 일치하지 않습니다.";
var msg_name = "이름을 입력하세요.";
var msg_birth = "주민번호를 입력하세요";
var msg_email = "이메일을 입력하세요";
var msg_emailchk = "이메일이 잘못되었습니다.";
var msg_confirmId = "중복확인을 해주세요";

var insertError = "회원가입에 실패하였습니다. \n확인 후 다시 시도하세요.";
var deleteError = "회원탈퇴 실패하였습니다. \n확인 후 다시 시도하세요.";
var updateError = "회원정보 수정에 실패하였습니다. \n확인 후 다시 시도해주세요.";
var pwdErorr = "비밀번호가 일치하지 않습니다. \n확인 후 다시 시도하세요";
var idErorr = "아이디가 존재하지 않습니다. \n확인 후 다시 시도하세요";

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

//에러 메시지
function errorAlert(errorMsg){
	alert(errorMsg);
	//이전 페이지로 이동
	window.history.back();
}

//메인페이지
function mainFocus() {
   document.mainform.id.focus();
}

//메인화면 버튼 클릭시
function mainCheck() {
   if(!document.mainform.id.value){
      alert(msg_id);
      document.mainform.id.focus();
      return false;
      
   } else if(!document.mainform.pwd.value){
      alert(msg_pwd);
      document.mainform.pwd.focus();
      return false;
   }
   
   document.mainform.submit();
}

//회원가입 페이지
function joinUsFocus() {
   document.joinusform.id.focus();
}

//회원가입 버튼 눌렀을때
function joinusCheck() {
	if(!document.joinusform.id.value){
		alert(msg_id);
		document.joinusform.id.focus();
		return false;
   
	} else if(!document.joinusform.pwd.value){
		alert(msg_pwd);
		document.joinusform.pwd.focus();
		return false;
      
	} else if(document.joinusform.pwd.value != document.joinusform.repwd.value){
        alert(msg_pwdChk);
        document.joinusform.repwd.focus();
        return false;
      
	} else if(!document.joinusform.name.value){
        alert(msg_name);
        document.joinusform.name.focus();
        return false;
      
	} else if(!document.joinusform.jumin1.value){
        alert(msg_birth);
        document.joinusform.jumin1.focus();
        return false;
      
	} else if(!document.joinusform.jumin2.value){
		alert(msg_birth);
		document.joinusform.jumin2.focus();
		return false;
      
	} else if(!document.joinusform.email1.value){
		alert(msg_email);
		document.joinusform.email1.focus();
		return false;
		  
	//직접 입력인경우-email2
	}else if(document.joinusform.email3.value == 0 
				&& !document.joinusform.email2.value){
		alert(msg_email);
		document.joinusform.email2.focus();
		return false;
		
	//중복확인 버튼을 클릭하지 않는 경우
	//체크 전제 조건 : joinUs.jsp의 form안에 <input type="hidden" name="hiddenId" value="0">
	//hiddenId : 중복확인 버튼 클릭 여부 체크(0:클릭안함, 1:클릭함)
	}else if(document.joinusform.hiddenId.value == "0"){
		alert(msg_confirmId);
		document.joinusform.dupChk.focus();
		return false;
	}
	
	alert("Thank you for joining GUNNY'S MALL!");
	document.joinusform.submit();
      
}

function nextJumin1(){
	if(document.joinusform.jumin1.value.length >= 6){
		document.joinusform.jumin2.focus();
	}
}

function nextJumin2(){
	if(document.joinusform.jumin2.value.length >= 7){
		document.joinusform.hp1.focus();
	}
}

function nextHp1(){
	if(document.joinusform.hp1.value.length >= 3){
		document.joinusform.hp2.focus();
	}
}

function nextHp2(){
	if(document.joinusform.hp2.value.length >= 4){
		document.joinusform.hp3.focus();
	}
}

function nextHp3(){
	if(document.joinusform.hp3.value.length >= 4){
		document.joinusform.email1.focus();
	}
}

//confirmId----------------------------------------------------------------------

//중복확인 버튼 클릭시 서브창 open   
function confirmId(){
	if(!document.joinusform.id.value){
		alert(msg_id);
		document.joinusform.id.focus();
		return false;
	}
	
	
	//window.open("파일명", "윈도우명", "창속성");
	//url = "주소?속성=" + 속성값; ==> get방식
	var url = "confirmId?id=" + document.joinusform.id.value;
	window.open(url,"confirm","menubar=no, width=500, height=300");
}  

//중복확인 버튼 클릭시 포커스
function confirmIdFocus(){
	document.confirmform.id.focus();
}

//중복 확인 창에서 id입력 여부
function confirmIdCheck(){
	if(!document.confirmform.id.value){
		alert(msg_id);
		document.confirmform.id.focus();
		return false;
	}
}

//opener : window 객체의 open()메소드로 열린 새창(=중복확인창)에서, 열어준 부모창(=회원가입창)에 접근할때 사용한다.
//self.close(); : 메시지없이 현재창을 닫을 때 사용 
//hiddenId : 중복확인 버튼 클릭여부 체크(0=클릭안함, 1=클릭함)를 체크함으로 설정.
function setId(id){
	opener.document.joinusform.id.value=id;
	opener.document.joinusform.hiddenId.value="1";
	self.close();
}

//-------------------------------------------------------------------------------

//modifyView.jsp
function modifyCheck(){
	//비밀번호 입력값이 없을때
	if(!document.modifyform.pwd.value){
		alert(msg_pwd);
		return false;
	//비밀번호 확인값이 없을때
	}else if(!document.modifyform.repwd.value){
		alert(msg_repwd);
		return false;
	//비밀번호 불일치시
	}else if(document.modifyform.pwd.value != document.modifyform.repwd.value){
		alert(msg_pwdChk);
		return false;
	//이메일 입력값이 없을때
	}else if(!document.modifyform.email1.value){
		alert(msg_email);
		return false;
	}else if(!document.modifyform.email2.value){
		alert(msg_email);
		return false;
	//이름 입력값이 없을떄
	}else if(!document.modifyform.name.value){
		alert(msg_name);
		return false;
	}
	
}



//board
//=============================================================================
var msg_pwd = "비밀번호를 입력하세요.";
var msg_subject = "제목을 입력하세요.";
var msg_content = "내용을 입력하세요.";

var pwdError = "비밀번호가 일치하지 않습니다. \n확인 후 다시 시도하세요.";
var updateError = "글 수정에 실패했습니다. \n확인 후 다시 시도하세요.";
var deleteError = "글 삭제에 실패했습니다. \n확인 후 다시 시도하세요.";
var insertError = "글 작성에 실패했습니다. \n확인 후 다시 시도하세요.";

function errorAlert(msg){
	alert(msg);
	window.history.back();
}

//게시글 수정, 삭제일때 타는 script
function pwdFocus(){
	document.pwdform.pwd.focus();
}

function pwdCheck(){
	if(!document.pwdform.pwd.value){
		alert(msg_pwd);
		document.pwdform.pwd.focus();
		return false;
	}
}

function modifyFocus(){
	document.modifyform.subject.focus();
}

function boardModifyCheck(){
	if(!document.modifyform.subject.value){
		alert(msg_subject);
		document.modifyform.subject.focus();
		return false;
	}else if(!document.modifyform.pwd.value){
		alert(msg_pwd);
		document.modifyform.pwd.focus();
		return false;
	}
}

//글 작성
function writeFocus(){
	document.writeform.subject.focus();
}

function writeCheck(){
	if(!document.writeform.pwd.value){
		document.writeform.pwd.focus();
		alert(msg_pwd);
		return false;
	}else if(!document.writeform.subject.value){
		document.writeform.subject.focus();
		alert(msg_subject);
		return false;	
	}else if(!document.writeform.content.value){
		document.writeform.content.focus();
		alert(msg_content);
		return false;
	}
}

//host
//=============================================================================

function stockModifyCheck(){
	if(!document.modifyform.p_name.value){
		alert("상품명을 입력하세요");
		document.modifyform.p_name.focus();
		return false;
	}else if(!document.modifyform.p_size.value){
		alert("사이즈를 입력하세요");
		document.modifyform.p_size.focus();
		return false;
	}else if(!document.modifyform.p_price.value){
		alert("가격을 입력하세요");
		document.modifyform.p_price.focus();
		return false;
	}else if(!document.modifyform.p_count.value){
		alert("수량을 입력하세요");
		document.modifyform.p_count.focus();
		return false;
	}else if(document.modifyform.p_kind.value == "0"){
		alert("종류를 선택하세요");
		return false;
	}
}

//detail
function wishList(){
	/*if(confirm("Wish List에 담으시겠습니까?") == true){
		window.location="wishList.do"
	}*/
	alert("Comming Soon!!");
}

//Cart
function cartList(number, name, size, price, img){
	if(document.detailform.p_size.value == "0"){
		alert("Size를 선택하세요.");
		return false;
		
	}else if(confirm("Cart에 담으시겠습니까?") == true){
		window.location="addCart?p_number=" + number +
								   "&p_name=" + name +
								   "&p_size=" + document.detailform.p_size.value +
								   "&p_price=" + price +
								   "&p_img=" + img +
								   "&c_count=" + document.detailform.c_count.value;
		
	}
}

//buyNow
function buyNow(number, name, size, price, count, img) {
	if((count-document.detailform.c_count.value) < 0){
		alert("주문요청 수량이 재고수량보다 많습니다.")
		return false;
	
	}else if(document.detailform.p_size.value == "0"){
		alert("Size를 선택하세요.");
		return false;
		
	}else{
		window.location="buyNow?p_number=" + number +
								   "&p_name=" + name +
								   "&p_size=" + document.detailform.p_size.value +
								   "&p_price=" + price +
								   "&p_img=" + img +
								   "&p_count=" + document.detailform.c_count.value;
	
	}
}


//cartBuy
function cartBuy(number, name, size, price, count, img){
	window.location="cartBuy?p_number=" + number +
							   "&p_name=" + name +
							   "&p_size=" + size +
							   "&p_price=" + price +
							   "&p_count=" + count +
							   "&p_img=" + img;
}

//환불요청
function refund(number, name, size, price, count, img){
	if(confirm("환불요청 하시겠습니까?") == true){
		window.location="refundClim?p_number=" + number +
								   "&p_name=" + name +
								   "&p_size=" + size +
								   "&p_price=" + price +
								   "&p_count=" + count +
								   "&p_img=" + img;
	}
	
}

//호스트 주문승인
function orderApprove(id, date, number, name, size, price, count, img){
	window.location="approve?id=" + id +
							   "&p_number=" + number +
							   "&p_name=" + name +
							   "&p_size=" + size +
							   "&p_price=" + price +
							   "&p_count=" + count +
							   "&p_img=" + img;
}

//호스트 환불승인
function refundApprove(id, number, name, size, price, count, img){
	window.location="refundApprove?id=" + id +
							   "&p_number=" + number +
							   "&p_name=" + name +
							   "&p_size=" + size +
							   "&p_price=" + price +
							   "&p_count=" + count +
							   "&p_img=" + img;
}

//종합관리자 member 추가
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
		
	} else if(document.joinForm.step.value == 0){
		alert(msg_step);
		document.joinForm.step.focus();
		return false;
		
	}else if (!document.joinForm.pwd.value) {
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
}

//아이디 중복확인
function hostTConfirmId() {
	var param = 'id=' + document.joinForm.id.value;
	sendRequest(hostTConfirmId_callback, 'hostTConfirmId', 'GET', param);
}

function hostTConfirmId_callback() {
	if(httpRequest.readyState == 4) {
		if(httpRequest.status == 200) {
			var date = httpRequest.responseText;
			
			console.log('성공');
			if(date == 0) {
				alert('사용 가능한 아이디입니다.');
			} else {
				alert('이미 존재하는 아이디입니다.');
			}
			console.log(date);
		} else {
			console.log('에러 발생');
		}
	} else {
		console.log('에러 상태 : ' + httpRequest.readyState);
	}
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

//주소찾기
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






/*--------------------------------------------------------------------*/
/*------------------------------AJAX----------------------------------*/
/*--------------------------------------------------------------------*/
//${pageContext.request.contextPath} == localhost:8080/baobob 이라는뜻



























