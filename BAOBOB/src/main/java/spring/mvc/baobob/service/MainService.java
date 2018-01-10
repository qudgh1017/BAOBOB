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
}
