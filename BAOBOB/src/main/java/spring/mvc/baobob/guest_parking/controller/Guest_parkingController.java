package spring.mvc.baobob.guest_parking.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.baobob.guest_parking.Service.Guest_parkingService;
import spring.mvc.baobob.service.MainService;

@Controller
public class Guest_parkingController {

	@Autowired
	Guest_parkingService service;
	
	@Autowired
	MainService mService;
	
	//메인
	@RequestMapping("guestParkingMain")
	public String guestParkingMain() {
		System.out.println("guestParkingMain()");
		return "guest/guest_parking/guestParkingMain";
	}
	
	//입장
	@RequestMapping("guestParkingIn")
	public String guestParkingIn() {
		System.out.println("guestParkingIn()");
		return "guest/guest_parking/guestParkingIn";
	}

	//입장 - 회원 선택시
	@RequestMapping("guestParkingMember")
	public String guestParkingMember(HttpServletRequest req, Model model) {
		System.out.println("guestParkingMember()");
		return "guest/guest_parking/guestParkingMember";
	}
	
	//입장 - 비회원 선택시
	@RequestMapping("guestParkingGuest")
	public String guestParkingGuest(HttpServletRequest req, Model model) {
		System.out.println("hostParkingGuest()");
		return "guest/guest_parking/guestParkingGuest";
	}
	
	//비회원 입장
	@RequestMapping("guestParkingGuestIn")
	public String guestParkingGuestIn(HttpServletRequest req, Model model) {
		System.out.println("guestParkingGuestIn()");
		service.guestParkingInPro(req, model);
		return "guest/guest_parking/guestParkingNumber";
	}
	
	//회원 입장- 로그인 처리 => 번호 생성
	@RequestMapping("guestParkingMemberIn")
	public String guestParkingSignIn(HttpServletRequest req, Model model) {
		System.out.println("guestParkingMemberIn()");
		
		mService.signInPro(req, model);
		service.guestParkingInPro(req, model);
		
		return "guest/guest_parking/guestParkingNumber";
	}
	
	//회원 입장- 페이스북 로그인 처리 => 번호 생성
	@RequestMapping("guestParkingFirebaseLogin")
	public String guestParkingFirebaseLogin (HttpServletRequest req, Model model) {
		System.out.println("guestParkingFirebaseLogin()");

		mService.firebaseLoginPro(req, model);
		service.guestParkingInPro(req, model);
		
		return "guest/guest_parking/guestParkingNumber";
	}
	
	//퇴장
	@RequestMapping("guestParkingOut")
	public String guestParkingOut() {
		System.out.println("guestParkingOut()");
		return "guest/guest_parking/guestParkingOutCheck";
	}
	
	//퇴장 - 번호 확인, 회원일 경우 자동 결제
	@RequestMapping("guestParkingOutCheckPro")
	public String guestParkingOutCheckPro(HttpServletRequest req, Model model) {
		System.out.println("guestParkingOutCheckPro()");
		
		service.guestParkingOutCheckPro(req, model);
		
		return "guest/guest_parking/guestParkingPay";
	}

	//결제
	@RequestMapping("guestParkingPayPro")
	public String guestParkingPay(HttpServletRequest req, Model model) {
		System.out.println("guestParkingPay()");
		
		service.guestParkingPay(req, model);
		
		return "guest/guest_parking/guestParkingPayPro";
	}
	
	//주차 내역
	@RequestMapping("guestParkingReceipt")
	public String guestParkingReceipt(HttpServletRequest req, Model model) {
		System.out.println("guestParkingReceipt()");
		return "guest/guest_parking/guestParkingReceipt";
	}
	
	//주차 내역 출력
	@RequestMapping("guestParkingMy")
	public String guestParkingMy(HttpServletRequest req, Model model) {
		System.out.println("guestParkingMy()");
		
		service.guestParkingMy(req, model);
		
		return "guest/guest_parking/guestParkingMy";
	}

}
