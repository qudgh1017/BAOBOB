package spring.mvc.baobob.guest_parking.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Guest_parkingService {

	//입장 시 번호 생성
	public void guestParkingInPro(HttpServletRequest req, Model model);
	
	//퇴장 번호 확인
	public void guestParkingOutCheckPro(HttpServletRequest req, Model model);
	
	//퇴장 처리
	public void guestParkingPay(HttpServletRequest req, Model model);

	//주차 내역 출력
	public void guestParkingMy(HttpServletRequest req, Model model);
}
