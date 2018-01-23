package spring.mvc.baobob.android.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.baobob.member_mypage.persistence.Member_mypageDAO;
import spring.mvc.baobob.persistence.MainDAO;
import spring.mvc.baobob.vo.Member;

@Controller
public class AndroidController {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	MainDAO mainDao;
	@Autowired
	Member_mypageDAO myDdao;
	
	//앱 로그인
	@ResponseBody
	@RequestMapping("androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req){
		log.debug("androidSignIn()");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		Map<String, String> in = new HashMap<String, String>();
		in.put("member_id", id);
		in.put("member_pwd", pwd);
		String step = mainDao.confirmIdPwd(in);
		
		Map<String, String> out = new HashMap<String, String>();
		if(step != null) {
			out.put("member_id", id);
		} else {
			out.put("member_id", null);
		}
		
		return out;
	}
	
	//앱 마이페이지
	@ResponseBody
	@RequestMapping("androidMyPageMain")
	public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
		log.debug("androidMyPageMain()");
		
		//회원 정보
		String id = req.getParameter("id");
		Member m = myDdao.getMemberInfo(id);
		
		//예약 건수
		
		
		//예약 목록
		
		Map<String, Object> map = new HashMap<>();
		map.put("data1", m.getMember_name());
		map.put("data2", 0);
		map.put("data3", 0);
		map.put("data4", 0);
		map.put("member", m);
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	//TEST http://cocomo.tistory.com/412
	@ResponseBody //웹에서 안드로이드로 값을 전달하기 위한 머노테이션
	@RequestMapping("androidTest")
	public Map androidTest(HttpServletRequest req) {
		//안드로이드에서 전달한 값
		System.out.println("title : " + req.getParameter("title"));
		System.out.println("memo : " + req.getParameter("memo"));
		
		//웹에서 전달할 값
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", "아이디");
		map.put("member_pwd", "비밀번호");
		return map;
	}
}
