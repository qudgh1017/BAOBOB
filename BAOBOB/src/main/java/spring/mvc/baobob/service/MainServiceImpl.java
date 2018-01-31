package spring.mvc.baobob.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.persistence.MainDAO;
import spring.mvc.baobob.vo.FaqVO;
import spring.mvc.baobob.vo.Member;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainDAO dao;

	// 아이디 중복 확인
	@Override
	public void confirmId(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		int cnt = dao.confirmId(id);
		model.addAttribute("cnt", cnt);
	}

	// 가입 처리
	@Override
	public void joinPro(HttpServletRequest req, Model model) {
		String member_id = req.getParameter("id");
		String member_pwd = req.getParameter("pwd");
		String member_name = req.getParameter("name");
		String member_tel = req.getParameter("tel");
		String member_email = req.getParameter("email");
		String member_birth = req.getParameter("birth");
		String member_sex = req.getParameter("sex");
		String member_address = req.getParameter("address");

		Member m = new Member();
		m.setMember_id(member_id);
		m.setMember_pwd(member_pwd);
		m.setMember_name(member_name);
		m.setMember_tel(member_tel);
		m.setMember_email(member_email);
		m.setMember_birth(member_birth);
		m.setMember_sex(member_sex);
		m.setMember_address(member_address);
		m.setMember_point(0);
		m.setMember_step(13);
		m.setMember_cumPoint(0);

		String key = emailSend(req);
		int cnt = 0;
		if(key != null) {
			cnt = dao.memberInsert(m);
			if(cnt != 0) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("member_id", member_id);
				map.put("member_key", key);
				cnt = dao.memberKeyInsert(map);
			}
		} else {
			cnt = 9;
		}
		model.addAttribute("cnt", cnt);
	}
	

	//비밀번호 찾기
	public void mainPwdEmail(HttpServletRequest req, Model model) {
		String key = emailSend(req); //메일 전송
		String email = req.getParameter("email");
		
		//아이디 존재 확인
		String id = dao.memberEmailId(email);
		
		int cnt = 0;
		if(id != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("member_key", key);
			map.put("member_id", id);
			cnt = dao.memberKeyInsert(map); //인증키 저장
		} else {
			cnt = 9;
			System.out.println("mainPwdEmail cnt - " + cnt);
		}
		model.addAttribute("cnt", cnt);
	}

	// 인증 메일 전송
	@Override
	public String emailSend(HttpServletRequest req) {
		String key = randomKey();
		
		int cnt = dao.sendEmail(req.getParameter("email"), req.getParameter("id"), key);
		if(cnt != 0) {
			return key;
		}
		return null;
	}

	//이메일 인증
	@Override
	public void confirmEmail(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		String id = req.getParameter("id");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id",  id);
		map.put("member_key", key);
		int keyChk = dao.memberKeySelect(map);
		
		int cnt = 0;
		if(keyChk != 0) {
			map.put("member_id",  id);
			map.put("member_step", "9");
			cnt = dao.memberStepUpdate(map);
			dao.memberKeyDelete(key);
		}
		model.addAttribute("cnt", cnt);
	}

	//비밀번호 찾기 이메일 인증
	public void confirmPwdEmail(HttpServletRequest req, Model model) {
		String email = req.getParameter("email");
		String key = req.getParameter("key");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_email",  email);
		map.put("member_key", key);
		String pwd = dao.memberConfirmPwdKey(map);
		
		int cnt = 0;
		if(pwd != null) {
			cnt = dao.memberKeyDelete(key);
			System.out.println(cnt);
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("pwd", pwd);
	}
	
	//로그인 처리
	@Override
	public void signInPro(HttpServletRequest req, Model model) {
		String member_id = req.getParameter("id").trim();
		String member_pwd = req.getParameter("pwd").trim();
		
		Map<String, String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
		String step = dao.confirmIdPwd(map);
		
		int cnt = 0;
		if(step != null) {
			req.getSession().setAttribute("memStep", step);
			if(!step.equals("13")) {
				req.getSession().setAttribute("memId", member_id);
			}
			cnt = 1;
		}
		
		model.addAttribute("cnt", cnt);
	}

	//firebase - facebook 로그인
	@Override
	public void firebaseLoginPro(HttpServletRequest req, Model model) {
		String userId = req.getParameter("userId");
		String userName = req.getParameter("userName");
		String userEmail = req.getParameter("userEmail");
		
		int cnt = dao.getMemberCheck(userId);
		if(cnt == 0) {
			//등록되어 있지 않은 경우
			Member m = new Member();
			m.setMember_id(userId);
			m.setMember_pwd(randomKey());
			m.setMember_name(userName);
			m.setMember_tel("null");
			m.setMember_email(userEmail);
			m.setMember_birth("null");
			m.setMember_sex("null");
			m.setMember_address("null");
			m.setMember_point(0);
			m.setMember_step(9);
			m.setMember_cumPoint(0);

			cnt = dao.memberInsert(m);
		} else {
			//등록되어 있는 경우
			cnt = 1;
		}
		req.getSession().setAttribute("memId", userId);
		
		System.out.println("id " + userId + "/" + userName + "/" + userEmail);
		model.addAttribute("cnt", cnt);
	}
	
	//고객센터
	public void mainHelp(HttpServletRequest req, Model model) {
		String next = req.getParameter("next");
		if(next == null) { next = "1";}
		int current = Integer.parseInt(next);
		
		int totalCnt = dao.getHelperCnt();
		int rowSize = 5;
		
		int start = (current - 1) * rowSize + 1;
		int end = start + rowSize - 1;
		if(end > totalCnt) { end = totalCnt; }
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start",  start);
		map.put("end",  end);
		
		ArrayList<FaqVO> list = dao.getHelper(map);
		model.addAttribute("help", list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("end", end);
		model.addAttribute("current", current);
	}

	//고객센터 검색 제안어 ajax
	public void mainHelpKeywordSuggest(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		
		ArrayList<String> list = dao.helpKeywordSuggest(keyword);
		String suggest = "";
		for(String str : list) {
			suggest += !suggest.equals("") ? "," + str : str;  
		}
		
		model.addAttribute("suggest", suggest);
	}

	//고객센터 검색 Ajax
	public void mainHelpKeywordSearch(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");

		String next = req.getParameter("next");
		if(next == null) { next = "1";}
		int current = Integer.parseInt(next);

		int totalCnt = dao.helpKeywordSearchCnt(keyword);
		int rowSize = 5;
		
		int start = (current - 1) * rowSize + 1;
		int end = start + rowSize - 1;
		if(end > totalCnt) { end = totalCnt; }
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",  start);
		map.put("end",  end);
		map.put("keyword", keyword);
		ArrayList<FaqVO> help = dao.helpKeywordSearch(map);
		
		model.addAttribute("help", help);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("end", end);
		model.addAttribute("current", current);
		
		model.addAttribute("keyword", keyword);
	}
	
	
	//랜덤키
	@Override
	public String randomKey() {
		StringBuffer tmp = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 6; i += 1) {
			int rIdx = rnd.nextInt(2);
			switch (rIdx) {
			case 0:
				tmp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 1:
				tmp.append(rnd.nextInt(10));
				break;
			}
		}
		return tmp.toString();
	}
}
