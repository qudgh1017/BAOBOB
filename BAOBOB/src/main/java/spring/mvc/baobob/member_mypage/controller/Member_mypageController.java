package spring.mvc.baobob.member_mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.baobob.member_mypage.service.Member_mypageService;

@Controller
public class Member_mypageController {
	
	@Autowired
	Member_mypageService service;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//회원 마이페이지
	@RequestMapping("memMyPageMain")
	public String memberMypage(Model model) {
		log.debug("====== Member_mypageController/memMypage() ======");
		
		return "guest/member_myPage/member_myPage_main";
	}
	
	//1:1문의
	@RequestMapping("memQuestion")
	public String memQuestion(HttpServletRequest req, Model model) {
		log.debug("====== Member_mypageController/memQuestion() ======");
		
		service.memQuestionList(req, model);
		
		return "guest/member_myPage/member_myPage_memQuestion";
	}

}
