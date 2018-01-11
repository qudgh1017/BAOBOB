package spring.mvc.baobob.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.Member;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	SqlSession sqlSession;

	//아이디 중복 확인
	@Override
	public int confirmId(String id) {
		System.out.println("confirmId 시작");
		
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		int cnt = dao.confirmId(id);
		
		System.out.println("confirmId 종료");
		return cnt;
	}

	//가입처리
	@Override
	public int memberInsert(Member m) {
		System.out.println("memberInsert 시작");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		int cnt = dao.memberInsert(m);
		System.out.println("memberInsert 종료");
		return cnt;
	}

	@Autowired
	private JavaMailSender mailSender;
	
	//인증 메일 전송
	@Override
	public int sendEmail(String email, String id, String key) {
		int cnt = 0;
		try {
			SimpleMailMessage msg= new SimpleMailMessage();
			msg.setFrom("admin@baobob.com");
			msg.setTo(email);
			msg.setSubject("BAOBOB 가입 인증 메일");
			msg.setText(new StringBuffer("링크를 눌러 인증을 완료하세요. <br><br>")
					.append("<a href='http://localhost:8087/baobob/mainConfirmEmail?key=" + key + "")
					.append("&id=" + id + "'>인증<a>").toString());
			
			mailSender.send(msg);
			cnt = 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}


	//인증키 저장
	public int memberKeyInsert(Map<String, String> map) {
		System.out.println("memberKeyInsert 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int cnt = mapper.memberKeyInsert(map);
		System.out.println("memberKeyInsert 종료");
		return cnt;
	}

	//인증키 존재 여부 확인
	public int memberKeySelect(Map<String, String> map){
		System.out.println("memberKeySelect 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int cnt = mapper.memberKeySelect(map);
		System.out.println("memberKeySelect 종료");
		return cnt;
	}
	
	//인증키 삭제
	public int memberKeyDelete(String member_id){
		System.out.println("memberKeyDelete 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int cnt = mapper.memberKeyDelete(member_id);
		System.out.println("memberKeyDelete 종료");
		return cnt;
	}
	
	
	//회원 등급 수정
	@Override
	public int memberStepUpdate(Map<String, String> map) {
		System.out.println("memberStepUpdate 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int cnt = mapper.memberStepUpdate(map);
		System.out.println("memberStepUpdate 종료");
		return cnt;
	}

}
