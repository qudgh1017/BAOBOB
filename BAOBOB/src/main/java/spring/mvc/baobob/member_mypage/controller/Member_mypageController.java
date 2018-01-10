package spring.mvc.baobob.member_mypage.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Member_mypageController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//회원 마이페이지
	@RequestMapping("memMyPageMain")
	public String memberMypage(Model model) {
		
		log.debug("====== Member_mypageController/memMypage() ======");
		
		return "guest/member_myPage/member_myPage_main";
	}

}
