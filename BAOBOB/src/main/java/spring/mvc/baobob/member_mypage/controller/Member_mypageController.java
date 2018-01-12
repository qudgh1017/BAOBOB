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
	
	//1:1문의 리스트
	@RequestMapping("memQuestion")
	public String memQuestion(HttpServletRequest req, Model model) {
		log.debug("====== Member_mypageController/memQuestion() ======");
		
		//임시 세션
		req.getSession().setAttribute("memId", "member_id 01");
		
		service.memQuestionList(req, model);
		
		return "guest/member_myPage/member_myPage_memQuestion";
	}
	
	//1:1문의 상세
	@RequestMapping("memQuestionContentForm")
	public String memQuestionContentForm(HttpServletRequest req, Model model) {
		
		service.memQuestionContentForm(req, model);
		
		return "guest/member_myPage/member_myPage_memQContentForm";
	}

	//1:1문의 수정 폼 페이지
	@RequestMapping("memQModifyForm")
	public String memQModifyForm(HttpServletRequest req, Model model) {
		
		//contentForm에서 글수정버튼을 눌렀을때 넘긴 값들을 받는다.
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		//받아온값들을 저장해서 modifyForm.jsp에서 받아라
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "guest/member_myPage/member_myPage_memQModifyForm";
	}
	
	//1:1문의 수정 상세 페이지
	@RequestMapping("memQModifyView")
	public String boardModifyView(HttpServletRequest req, Model model) {
		
		service.memQModifyView(req, model);
		
		return "guest/member_myPage/member_myPage_memQModifyView";
	}
	
	//1:1문의 수정 처리
	@RequestMapping("memQModifyPro")
	public String memQModifyPro(HttpServletRequest req, Model model) {
		
		service.memQModifyPro(req, model);
		
		return "guest/member_myPage/member_myPage_memQModifyPro";
	}
	
	//문의하기 작성폼 페이지
	@RequestMapping("memQWriteForm")
	public String memQWriteForm(HttpServletRequest req, Model model) {
		
		//제목글쓰기(답변글이 아닌경우)
		int num = 0;
		int ref = 0; //그룹화 아이디
		int ref_step = 0; //답변글 순서(행)
		int ref_level = 0; //답변글 레벨(들여쓰기) 
		
		//답글쓰기
		//contentForm에서 답글쓰기 버튼을 눌렀을때 넘긴 값들을 받는다.
		if(req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
			ref = Integer.parseInt(req.getParameter("ref"));
			ref_step = Integer.parseInt(req.getParameter("ref_step"));
			ref_level = Integer.parseInt(req.getParameter("ref_level"));
		}
		
		//받아온값들을 저장해서 writeForm.jsp에서 받아라
		req.setAttribute("num", num);
		req.setAttribute("ref", ref);
		req.setAttribute("ref_step", ref_step);
		req.setAttribute("ref_level", ref_level);
		
		return "guest/member_myPage/member_myPage_memQWriteForm";
	}
	
	//문의하기 처리페이지	
	@RequestMapping("memQWritePro")
	public String memQWritePro(HttpServletRequest req, Model model) {
		
		service.memQWritePro(req, model);
		
		return "guest/member_myPage/member_myPage_memQWritePro";
	}
	
	//문의하기 삭제폼 페이지	
	@RequestMapping("memQDelForm")
	public String memQDelForm(HttpServletRequest req, Model model) {
		
		//contentForm.jsp에서 삭제button을 눌렀을떄 get방식으로 넘긴 값을 가져온다.
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "guest/member_myPage/member_myPage_memQDelForm";
	}
	
	//문의하기 삭제 처리페이지
	@RequestMapping("memQDelPro")
	public String memQDelPro(HttpServletRequest req, Model model) {
		
		service.memQDelPro(req, model);
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "guest/member_myPage/member_myPage_memQDelPro";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
