package spring.mvc.baobob.guest_parking.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Guest_parkingController {

	@RequestMapping("guestParkingReceipt")
	public String guestParkingReceipt(HttpServletRequest req, Model model) {
		System.out.println("guestParkingReceipt()");
		return "guest/guest_parking/guestParkingReceipt";
	}

	@RequestMapping("guestParkingMember")
	public String guestParkingMember(HttpServletRequest req, Model model) {
		System.out.println("guestParkingMember()");
		return "guest/guest_parking/guestParkingMember";
	}

	@RequestMapping("guestParkingPay")
	public String guestParkingPay(HttpServletRequest req, Model model) {
		System.out.println("guestParkingPay()");
		return "guest/guest_parking/guestParkingPay";
	}

	@RequestMapping("guestParkingGuest")
	public String guestParkingGuest(HttpServletRequest req, Model model) {
		System.out.println("hostParkingGuest()");
		return "guest/guest_parking/guestParkingGuest";
	}
}
