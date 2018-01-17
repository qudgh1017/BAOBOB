package spring.mvc.baobob.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public interface MainService {

	//아이디 중복 확인
	public void confirmId(HttpServletRequest req, Model model);
	
	//가입 처리
	public void joinPro(HttpServletRequest req, Model model);

	//비밀번호 찾기
	public void mainPwdEmail(HttpServletRequest req, Model model);
	
	//인증 이메일 전송
	public String emailSend(HttpServletRequest req);
	
	//이메일 인증
	public void confirmEmail(HttpServletRequest req, Model model);
	
	//비밀번호 찾기 이메일 인증
	public void confirmPwdEmail(HttpServletRequest req, Model model);
	
	//로그인 처리
	public void signInPro(HttpServletRequest req, Model model);
	
	//firebase - facebook 로그인
	public void firebaseLoginPro(HttpServletRequest req, Model model);
	
	//고객센터
	public void mainHelp(HttpServletRequest req, Model model);
	
	//랜덤키
	public String randomKey();
}
