package spring.mvc.baobob.member_mypage.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.vo.Member;

public interface Member_mypageService {
	
	//1:1문의 리스트
	public void memQuestionList(HttpServletRequest req, Model model);
	
	//1:1문의 상세
	public void memQuestionContentForm(HttpServletRequest req, Model model);
	
	//1:1문의 수정 상세 페이지
	public void memQModifyView(HttpServletRequest req, Model model);
	
	//1:1문의 수정 처리
	public void memQModifyPro(HttpServletRequest req, Model model);
	
	//1:1문의 작성 처리페이지
	public void memQWritePro(HttpServletRequest req, Model model);
	
	//1:1문의 삭제 처리페이지
	public void memQDelPro(HttpServletRequest req, Model model);
	
	//회원카드정보 가져오기
	public void memberCard(HttpServletRequest req, Model model);
	
	//정보수정 입력페이지
	public void memPModifyView(HttpServletRequest req, Model model);
	
	//정보수정 처리페이지
	public void memPPro(MultipartHttpServletRequest req, Model model);
	
	
	
	
	
	
	
	
	
	
	

}
