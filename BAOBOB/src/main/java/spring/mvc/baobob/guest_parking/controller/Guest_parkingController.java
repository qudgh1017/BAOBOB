package spring.mvc.baobob.guest_parking.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Guest_parkingController {

	@RequestMapping("guest_parking_dddd")
	public String method(HttpServletRequest req, Model model) {
		return "";
	}
}
