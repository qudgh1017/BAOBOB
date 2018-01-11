package spring.mvc.baobob.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.persistence.MainDAO;
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

	// 인증 메일 전송
	@Override
	public String emailSend(HttpServletRequest req) {

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
		String key = tmp.toString();
		
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
			dao.memberKeyDelete(id);
		}
		model.addAttribute("cnt", cnt);
	}

}
