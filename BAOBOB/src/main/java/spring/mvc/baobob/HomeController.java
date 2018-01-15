package spring.mvc.baobob;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.mvc.baobob.service.MainService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping("mainDefault")
	public String mainDefault(Model model) {
		return "mainDefault";
	}

	@RequestMapping("mainEx")
	public String mainEx(Model model) {
		return "guest/example";
	}
	

	@RequestMapping("adminEx")
	public String adminEx(Model model) {
		return "host/example";
	}
	
	//==============================================================================
	
	@Autowired
	MainService service;
	
	@RequestMapping("mainIndex")
	public String mainIndex(HttpServletRequest req, Model model) {
		System.out.println("mainIndex()");
		
		String id = (String) req.getSession().getAttribute("memId");
		System.out.println(id);
		req.getSession().setAttribute("memId", id);
		
		return "main/mainIndex";
	}
	
	//회원가입
	@RequestMapping("mainJoin")
	public String mainJoin() {
		System.out.println("mainJoin()");
		return "main/mainJoin";
	}
	
	//아이디 중복 검사
	@RequestMapping("mainConfirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		System.out.println("confirmId()");
		
		service.confirmId(req, model);
		
		return "main/cntPage";
	}
	
	//가입처리
	@RequestMapping("mainJoinPro")
	public String joinPro(HttpServletRequest req, Model model) {
		System.out.println("joinPro()");
		
		service.joinPro(req, model);
		
		return "main/mainJoinPro";
	}

	//비밀번호 찾기 화면
	@RequestMapping("mainPwd")
	public String mainPwd(HttpServletRequest req, Model model) {
		System.out.println("mainPwd()");
		return "main/mainPwd";
	}
	
	//비밀번호 찾기 인증 메일 전송
	@RequestMapping("mainPwdEmail")
	public String mainPwdEmail(HttpServletRequest req, Model model) {
		System.out.println("mainPwdEmail()");

		service.mainPwdEmail(req, model);
		
		return "main/mainPwdEmail";
	}
	
	//인증 메일 확인
	@RequestMapping("mainConfirmEmail")
	public String mainConfirmEmail(HttpServletRequest req, Model model) {
		System.out.println("mainConfirmEmail()");
		
		service.confirmEmail(req, model);
		
		return "main/mainConfirmEmail";
	}
	
	//비밀번호 찾기 인증 메일 확인
	@RequestMapping("mainConfirmPwdEmail")
	public String mainConfirmPwdEmail(HttpServletRequest req, Model model) {
		System.out.println("mainConfirmPwdEmail");
		
		service.confirmPwdEmail(req, model);
		
		return "main/mainConfirmPwdEmail";
	}
	
	//로그인
	@RequestMapping("mainSignIn")
	public String mainSignIn(HttpServletRequest req, Model model) {
		System.out.println("mainSignIno()");
		return "main/mainSignIn";
	}
	
	//로그인 처리
	@RequestMapping("mainSignInPro")
	public String mainSignInPro(HttpServletRequest req, Model model) {
		System.out.println("mainSignInPro()");
		
		service.signInPro(req, model);

		return "main/mainSignInPro";
	}
	
	//firebase - facebook 로그인
	@RequestMapping("firebaseLogin")
	public String firebaseLogin(HttpServletRequest req, Model model) {
		System.out.println("firebaseLogin");
		
		service.firebaseLoginPro(req, model);
		
		return "main/firebaseLogin";
	}
	
	//로그아웃
	@RequestMapping("mainSignOut")
	public String mainSignOut(HttpServletRequest req, Model model) {
		System.out.println("mainSignOut()");
		
		req.getSession().invalidate();

		return "main/mainIndex";
	}
}
