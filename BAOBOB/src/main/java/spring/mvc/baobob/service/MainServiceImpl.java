package spring.mvc.baobob.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.persistence.MainDAO;
import spring.mvc.baobob.vo.Member;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDAO dao;

	//아이디 중복 확인
	@Override
	public void confirmId(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		int cnt = dao.confirmId(id);
		model.addAttribute("cnt", cnt);
	}

	//가입 처리
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
		m.setMember_step(9);
		m.setMember_cumPoint(0);
		
		int cnt = dao.memberInsert(m);
		model.addAttribute("cnt", cnt);
	}

}
